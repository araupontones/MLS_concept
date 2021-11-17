#count how many datasets exist in both rounds.

infile <- file.path("tables/summary_firm_data.rds")

dr <- rio::import(infile) |>
  mutate(inBoth1 = in1AB_2016 & in1C_2018,
         inBoth2 = in2A_2018 & in2B_2019)

total_dbs <- nrow(dr)


inRound1A <- sum(dr$in1AB_2016)
inRound1B <- sum(dr$in1C_2018)

inRound2A <- sum(dr$in2A_2018)
inRound2B <- sum(dr$in2B_2019)

dr1 <- dr |>filter(in1AB_2016 |in1C_2018 )


#Count combination of round 1


filesRound1 <- nrow(dr1) #total files in both rounds
inBoth1 <- sum(dr1$inBoth1)
inBoth1_perc <-paste0(round(mean(dr1$inBoth1),3) *100, "%")


#combinaiton of round 2
dr2 <- dr |>filter(in2A_2018 |in2B_2019 )

filesRound2 <- nrow(dr2) #total files in both rounds
inBoth2 <- sum(dr2$inBoth2)
inBoth2_perc <-paste0(round(mean(dr2$inBoth2),3) *100, "%")


#inBoth_perc <- paste0(round(inBoth/total_dbs *100,1), "%")





