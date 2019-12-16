colores<-c(
  '#032B35',
  '#0D413A',
  '#0D413A',
  '#1BA9CF',
  '#2991AE',
  '#3FC172',
  '#3FC172')

reds_greens<-c('#7FCDAE', '#9AD97B', '#E5C877', '#EB9474', '#EE7772')
lj_greens<-c('#00B74A','#00D95A','#14E569')
lj_purples<-c('#410B68','#570b84','#5E0F96')
lj_blacks<-c('#000000','#101010','#202020')
lj_whites<-c('#F7F6F7','#FBFBFB','#FFFFFF','#CACACA','#ccd2ce','#ececec')
lj_blues<-c('#00ADDA','#00BEF2','#00CDF5')
lj_yellows<-c('#E0EE00','#F3FF00','#F8FF88')
lj_oranges<-c('#FD7B21','#FF933A','#FFA563')
lj_reds<-c('#FF0020','#FF003C','#FF485E')
lj_ones<-c(lj_greens[1],lj_purples[1],lj_blues[1],lj_yellows[1],lj_oranges[1],lj_reds[1])
lj_twos<-c(lj_greens[2],lj_purples[2],lj_blues[2],lj_yellows[2],lj_oranges[2],lj_reds[2])
lj_threes<-c(lj_greens[3],lj_purples[3],lj_blues[3],lj_yellows[3],lj_oranges[3],lj_reds[3])
lj_heatmap<-c('#ff4945','#ff6339','#ff7c2b','#ff9519','#ffae00','#ffc700','#ffe000','#FFF810','#92ea38','#73e444','#00d95a','#00c889','#00b3b4','#009cd4','#0083e2','#0065d8','#0042b6','#570b84')
lj_graphs<-c('#00d95a',	'#570b84',	'#0083e2',	'#00b3b4',	'#aeee2c',	'#ffe000',	'#ffc700',	'#ff9519'	)
lj_area<-c(rev(lj_heatmap)[1:3],lj_graphs[1])


theme_dark <- function (base_size = 12, base_family = "") {
  theFont = 'LibreFranklin'
    theme_gray(base_size = base_size, base_family = base_family) %+replace% 
    theme(panel.spacing = unit(1, "lines"),
      plot.title = element_text(colour = '#3FC172',size=14,family=theFont),
      axis.text = element_text(colour = '#3FC172',size=8.5,family=theFont),
      legend.text = element_text(colour = '#3FC172',family=theFont),  
      legend.title = element_text(colour = '#3FC172',family=theFont),  
      axis.title.x = element_text(colour = '#3FC172',family=theFont),
      axis.title.y = element_text(colour = '#3FC172',angle=90,family=theFont),
      strip.text=element_text(colour = '#202020',family=theFont),
      panel.background = element_rect(fill="#222222"),
      panel.grid.minor = element_line(colour = '#0d413a'),
      panel.grid.major = element_line(colour = '#0d413a'),
      plot.background = element_rect(fill='#222222'),
      legend.background = element_rect(fill='#222222'),
      legend.position = 'bottom'
    )   
}


theme_light <- function (base_size = 12, base_family = "") {
  theme_gray(base_size = base_size, base_family = base_family) %+replace%
  theme(
    # panel.spacing = unit(1, "lines"),
    plot.title = element_text(colour =  lj_blacks[3],size=14,family='Cabin'),
    axis.text = element_text(colour = lj_blacks[3],size=8.5,family='LibreFranklin'),
    legend.text = element_text(colour = lj_blacks[3],family='LibreFranklin'),  
    axis.title.x = element_text(colour = lj_blacks[3],family='LibreFranklin'),
    axis.title.y = element_text(colour = lj_blacks[3],angle=90,family='LibreFranklin'),
    strip.text=element_text(colour = '#202020',size=8.5,family='LibreFranklin'),
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.minor = element_line(colour =lj_whites[1]),
    panel.grid.major = element_line(colour =lj_whites[1]),
    plot.background = element_blank(),
    legend.background = element_blank(),
    # legend.title = element_blank(),
    legend.position = 'bottom')   
}

