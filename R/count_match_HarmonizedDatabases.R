#count how many datasets exist in both rounds.

infile <- file.path("tables/summary_harmonized_data.rds")

dh <- rio::import(infile) |>
  mutate(inBoth1 = in1AB_2016 & in1C_2018)

total_dbs <- nrow(dh)


inRound1A <- sum(dh$in1AB_2016)
inRound1B <- sum(dh$in1C_2018)

#inRound2A <- sum(dr$in2A_2018)
#inRound2B <- sum(dr$in2B_2019)

dh1 <- dh |>filter(in1AB_2016 |in1C_2018 )


#Count combination of round 1


filesHRound1 <- nrow(dh1) #total files in both rounds
inHBoth1 <- sum(dh1$inBoth1)
inHBoth1_perc <-paste0(round(mean(dh1$inBoth1),3) *100, "%")


#combinaiton of round 2
dr2 <- dr |>filter(in2A_2018 |in2B_2019 )

filesRound2 <- nrow(dr2) #total files in both rounds
inBoth2 <- sum(dr2$inBoth2)
inBoth2_perc <-paste0(round(mean(dr2$inBoth2),3) *100, "%")


#inBoth_perc <- paste0(round(inBoth/total_dbs *100,1), "%")






