#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
require(ggplot2)
require(dplyr)
require(reshape2)
require(lubridate)
require(rsconnect)

#source('theme.R')

  get_data<-function(number_of_days){
    root_csv<-'https://demandforecast.nationalgrid.com/efs_demand_forecast/emeddedforecastdownload'

    
    read.csv(root_csv) %>% 
      mutate(date=ymd(DATE_GMT),
             time=ifelse(nchar(TIME_GMT)<4,paste0('0',TIME_GMT),TIME_GMT),
             #time=ifelse(time=='2400','0000',time),
             datetime=paste(DATE_GMT, time),
             datetime=ymd_hm(datetime,tz = "GMT")) %>% 
      subset( date %in% (Sys.Date()+0:number_of_days)) %>% 
      rename(         
        `Solar Capacity`= EMBEDDED_SOLAR_CAPACITY,
        `Wind Capacity`= EMBEDDED_WIND_CAPACITY,
        `Wind Forecast`= EMBEDDED_WIND_FORECAST, 
        `Solar Forecast` = EMBEDDED_SOLAR_FORECAST
      )%>%
      select(
        date,
        datetime,
        `Solar Capacity`,
        `Wind Capacity`,
        `Wind Forecast`, 
        `Solar Forecast`
      ) 
    
  }

make_plot<-function(dtfrm)  {
  dtfrm %>%
    select(
      # date,
      datetime,
      # `Solar Capacity`,
      # `Wind Capacity`,
      `Wind Forecast`, 
      `Solar Forecast`
    ) %>%
    melt(id.vars='datetime', variable.name = 'Forecast')  %>% 
    ggplot(aes(x=datetime,y=value,colour=Forecast))+
    geom_line()+
    theme_light()+
    scale_color_manual(values=lj_twos)+
    ylab('Forecast MW \n ')+xlab('')+ggtitle('National Grid Embedded Generation Forecasts')
}

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("National Grid Embedded Generation Forecasts"),
   
   # Sidebar with a slider input for number of day 
   sidebarLayout(
      sidebarPanel(
         sliderInput("day",
                     "Number of days:",
                     min = 1,
                     max = 12,
                     value = 12)
      ),
      
      # Show a plot of the generated forecastribution
      mainPanel(
         plotOutput("forecastPlot"),
         br(),
         tableOutput("forecastSummary")
         
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
   output$forecastSummary<-renderTable({
    
     get_data(input$day) %>% 
       mutate(date=strftime(date,'%Y-%m-%d'))%>%
       group_by(date) %>% summarise(max_solar=max(`Solar Forecast`),
                                    max_wind=max(`Wind Forecast`),
                                    min_wind=min(`Wind Forecast`),
                                    baseload_wind=mean(`Wind Forecast`),
                                    baseload_solar=mean(`Solar Forecast`),
                                    capacity_Wind=max(`Wind Capacity`),
                                    capacity_solar=max(`Solar Capacity`)
                                                          )
     
   })
   output$forecastPlot <- renderPlot({
     get_data(input$day) %>% make_plot()
     
})
}

# Run the application 
shinyApp(ui = ui, server = server)

