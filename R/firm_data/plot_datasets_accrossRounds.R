infile <- "report/tables/summary_firm_data.rds"
exfile <- file.path(plots, "Harmonization/databasesAcrossRounds.png")


d <- import(infile)



View(d_p)
#prepare data for plot --------------------------------------------------------
d_p <- d |>
  mutate(name = database) |>
  select(module,name, starts_with("in")) |>
  select(-ends_with("All")) |>
  pivot_longer(-c(name,module),
               names_to = "round") |>
  mutate(round = str_remove(round, "in"),
    round = factor(round, 
                       levels = c("1AB_2016", 
                                  "1C_2018",
                                  "2A_2018",
                                  "2B_2019")
                       ),
    value = case_when(value ~ "Yes",
                      T ~ "No")
         ) |>
  filter(!str_detect(name, "interview__")) |>
  filter(value == "Yes")

View(d_p)

#plot ---------------------------------------------------------------------------
d_p |>
  ggplot(aes(
    x = round,
    y = name,
    fill = round
  )
  ) +
  geom_tile(color = "white") +
  scale_fill_manual(breaks = c("1AB_2016", 
                               "1C_2018",
                               "2A_2018",
                               "2B_2019"),
                    values = c("#23747C", "#8EAAB0", "#3AB76C", "#A5D6B0"),
                    name = "") +
  scale_y_discrete(expand = c(0,0)) +
  scale_x_discrete(position = "top",
                   expand = c(0,0))+
  labs(x = "",
       y = "Dataset",
       title = "Consistency of datasets across rounds.",
       #subtitle = "Only in the round 2B_2019, there are 394 datasets. And not all the folders exist for all\nthe sub-rounds.",
       #caption = "Analysis of the data management system for the MLSS online dashboard | Nov 2021 "
       ) +
  theme_MLS() +
  theme(axis.text.x = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_rect(fill = "white"),
        legend.position = c(.3,1),
        legend.direction = "horizontal",
        legend.title = element_blank(),
        legend.text = element_text(size = 22),
        plot.title = element_text(size = 40)
        )
  
  
  
  
  

exfile
ggsave(exfile,
       last_plot(),
       height = 80,
       width = 30,
       units = 'cm')
