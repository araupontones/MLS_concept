#creates data that shows names and labels for the derived data.

create_data_info <- function(db){
  
  
  data_info <- tibble(
    var_name = "",
    label = "",
    format = ""
  )
  
  
  data_names <- names(db)
  
  
  
  
  i = 1
  for(v in data_names){
    
    message(v)
    ats <- attributes(db[[v]])
    
    if(!is.null(ats$label) & length(ats$label) <  2){
      label_stat <- ats$label
      
    } else {
      
      label_stat = ""
    }
    
    data_format <- ats$format.stata
    
    
    
    data_info[i,1]= v
    data_info[i,2]= label_stat
    data_info[i,3]= data_format
    
    
    i = i +1
  }  
  
  
  return(data_info)
  
  
}
