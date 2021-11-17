infile <- "report/tables/summary_harmonized_data.rds"
exfile <- file.path(plots, "Harmonization/databasesInHarmonized.png")


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

plot_datasets(d_p,
              title = "After the harmonization, there are 60 datasets in 03_Harmonized.",
              subtitle = "There is not harmonized data yet for the Midline sub-rounds. And the directory GVH only\nexists for 1C_2018.",
              limits = c(0,25),
              nudge = .5)



ggsave(exfile,
       last_plot())
