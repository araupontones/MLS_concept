#create summary data of data by round
#' @param directorio directorio donde estan los datos

create_summary_data <- function(directorio,
                                inRound){
  
  
  dirs_data_firm <- list.dirs(directorio, recursive = F)
  not_this <- which(str_detect(dirs_data_firm, ".rtf"))
  
  if(length(not_this) >0){
    dirs_data_firm <- dirs_data_firm[-not_this]
    
  }
  

  
  #print(not_this)
  
  data_summary = tibble(
    module = "",
    database = ""
    #records = "",
    #variables = ""
    
  )
  
  
  
  #data_summary[3,1] <- "Z"
  
  
  i = 1
  for(m in dirs_data_firm){
    
    module <- toupper(str_extract(m, "[^\\/]*$"))
    message(module)
    
    data_within <- list.files(m, pattern = ".dta", full.names = T)
    for(f in data_within){
      
      file <-  str_extract(f, "[^\\/]*$")
      #read_it <- rio::import(f)
      
      
      print(f)
      
      data_summary[i,1]= module
      data_summary[i,2]= file
      #data_summary[i,3]= prettyNum(nrow(read_it), big.mark = ",")
      #data_summary[i,4]= prettyNum(ncol(read_it), big.mark = ",")
      
      
      
      #print(i)
      i = i + 1
      
    }
    
    
    
    data_summary2 <- data_summary |>
      mutate("{{inRound}}":= TRUE)
    
    
  }
  
  
  
  return(data_summary2)
  
}
