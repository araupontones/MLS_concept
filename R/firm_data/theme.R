extrafont::loadfonts(device = 'win')  
extrafont::fonts()


theme_MLS <- function(){
  
  theme_minimal()+
    theme(legend.position = 'top',
          axis.ticks = element_blank(),
          axis.text.y = element_text(hjust = 0),
          axis.title.y = element_text(margin = margin(r = 10)) ,
          text = element_text(family = "Montserrat"),
          plot.title.position = 'plot',
          plot.title = element_text(face = "bold", margin = margin(b = 10))
    )
}
