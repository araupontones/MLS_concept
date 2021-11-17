
exfile <- file.path("report/tables/summary_harmonized_data.rds")


bl1_dir <- file.path(db_data_bl,"01_1AB_2016/03_Harmonized")
bl2_dir <- file.path(db_data_bl, "02_1C_2018/03_Harmonized")

ml1_dir <- file.path(db_data_ml, "01_2A_2018/03_Harmonized")
ml2_dir <- file.path(db_data_ml, "01_2B_2019/03_Harmonized")



#data of round 1 baseline
bl1 <- create_summary_data(directorio = bl1_dir,
                           inRound = in1AB_2016)



#round 2 baseline
bl2 <- create_summary_data(directorio = bl2_dir,
                           inRound = in1C_2018)




# ml1 <- create_summary_data(directorio = ml1_dir,
#                            inRound = in2A_2018)
# 
# ml2 <- create_summary_data(directorio = ml2_dir,
#                            inRound = in2B_2019)



#join rounds to check which file exist in which --------------------------------
bl_c <- bl1 |>
  full_join(bl2, by = c("module", "database")) |>
  # full_join(ml1, by = c("module", "database")) |>
  # full_join(ml2, by = c("module", "database")) |>
  mutate(inAll = in1AB_2016 & in1C_2018) |>
  select(module, database, starts_with("in"), starts_with("record"), starts_with("var")) |>
  mutate(across(contains("in"), function(x)case_when(is.na(x) ~ F,
                                                     T ~ x))) |>
  arrange(module, database)



#exfile






export(bl_c, exfile)



