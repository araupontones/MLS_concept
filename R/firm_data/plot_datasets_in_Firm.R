infile <- "report/tables/summary_firm_data.rds"
exfile <- file.path(plots, "Harmonization/databasesInFirm.png")


d <- import(infile)


#prepare data for plot --------------------------------------------------------
d_p <- d |>
  pivot_longer(cols = -c(module, database)) |>
  filter(value) |>
  group_by(module, name) |>
  summarise(total = n(), .groups = 'drop') |>
  filter(name != "inAll") |>
  group_by(module) |>
  mutate(total_module = sum(total)) |>
  ungroup()|>
  mutate(name = str_remove(name, "in"),
         module = fct_reorder(module, total_module),
         name = factor(name, 
                       levels = rev(c("1AB_2016", 
                                  "1C_2018",
                                  "2A_2018",
                                  "2B_2019"))
                       )
         )


#labels ------------------------------------------------------------------------
labels_module <- d_p |>
  group_by(module)|>
  summarise(label = first(total_module), .groups = 'drop')


#plot ---------------------------------------------------------------------------
d_p |>
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
            nudge_x = 2) +
  scale_fill_manual(breaks = c("1AB_2016", 
                               "1C_2018",
                               "2A_2018",
                               "2B_2019"),
                    values = c("#23747C", "#8EAAB0", "#3AB76C", "#A5D6B0"),
                    name = "Sub-rounds")+
  scale_x_continuous(expand = c(0,0),
                     limits = c(0,110)) +
  labs(x = "Number of databases in folder",
       y = "Folder",
       title = "There are a total of 662 databases (*.dta) saved in the 01_Firm directory.",
       subtitle = "Only in the round 2B_2019, there are 394 datasets. And not all the folders exist for all\nthe sub-rounds.",
       caption = "Analysis of the data management system for the MLSS online dashboard | Nov 2021 ")+
  theme_MLS()
  


ggsave(exfile,
       last_plot())
