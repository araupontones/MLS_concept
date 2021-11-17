#' bar plot that counts data by module and rounds

plot_datasets <- function(.data,
                          title,
                          subtitle,
                          limits,
                          nudge){
  
  .data |>
    ggplot(aes(
      x = total,
      y = module
    )
    ) +
    geom_col(aes( fill = name),
             width = .7) +
    geom_text(data = labels_module,
              aes(label = label,
                  x = label,
                  y = module),
              hjust = 0,
              nudge_x = nudge) +
    scale_fill_manual(breaks = c("1AB_2016", 
                                 "1C_2018",
                                 "2A_2018",
                                 "2B_2019"),
                      values = c("#23747C", "#8EAAB0", "#3AB76C", "#A5D6B0"),
                      name = "Sub-rounds")+
    scale_x_continuous(expand = c(0,0),
                       limits = limits) +
    labs(x = "Number of databases in folder",
         y = "Folder",
         title = title,
         subtitle = subtitle,
         caption = "Analysis of the data management system for the MLSS online dashboard | Nov 2021 ")+
    theme_MLS()
}
