# FantasyFootballAnalytics
# Durugshan

# load the ffanalytics package
library(ffanalytics)

# scrape fantasy data
fantasyScrape = scrape_data(src = c("CBS", "ESPN", "FantasyPros", "Yahoo"), 
                         pos = c("QB", "RB", "WR", "TE", "DST"),
                         season = 2018, week = 0)

# load the scoring settings
scoring_settings <- ffanalytics::scoring

# change scoring settings
scoring_settings[["pass"]][["pass_int"]] <- -1

scoring_settings[["misc"]][["fumbles_lost"]] <- -2

scoring_settings[["pts_bracket"]][[3]][["threshold"]] <- 13
scoring_settings[["pts_bracket"]][[4]][["threshold"]] <- 20
scoring_settings[["pts_bracket"]][[4]][["points"]] <- 1
scoring_settings[["pts_bracket"]][[5]][["threshold"]] <- 99
scoring_settings[["pts_bracket"]][[5]][["points"]] <- -2

scoring_settings[["dst"]][["dst_blk"]] <- 2
scoring_settings[["idp"]][["idp_solo"]] <- 0
scoring_settings[["idp"]][["idp_asst"]] <- 0
scoring_settings[["idp"]][["idp_int"]] <- 2
scoring_settings[["idp"]][["idp_fum_force"]] <- 9
scoring_settings[["idp"]][["idp_fum_force"]] <- 0
scoring_settings[["idp"]][["idp_pd"]] <- 0

# run projections
projections2018 <- projections_table(fantasyScrape, scoring_settings)

# add player info
projections2018 <- add_player_info(projections2018)

# write to csv
write.csv(projections2018, file = "FFProjections_2018_2.csv")