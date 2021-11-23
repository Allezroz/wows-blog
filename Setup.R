pacman::p_load(ggplot2, tidyverse, readxl, rvest, jsonlite, lubridate, httr, googlesheets4,xlsx)
gs4_auth(email="michael.zorzella@gmail.com")
appID <- "?application_id=dfa76b64ae36b72878d1258d9b820ec4"
PRcolors <- c("Bad" = "#FE0E00","Below Average"="#FE7903","Average"="#FFC71F","Good"="#44B300",
              "Very Good"="#318000","Great"="#02C9B3","Unicum"="#D042F3","Super Unicum"="#A00DC5")
mapTable <- read_sheet("1T8rXfNjkJzC8vmaXTXgQ_sCcEO4o6EEplM2lZsz_IRs",sheet=1)
playerList <- read_sheet("1dXBIDKLc_AaoDxXXWTCOwcunRUTL8-BgJ--efLBKE2U",sheet=1)
shipList <- read_sheet("1gDfFEN7O_VkV7pADtdnLzNYWlkidB9XG_nZ_63cXPPA",sheet=1)
cbGames <- read_sheet("19ONeLaNEHbVALB2iOUG93FPjP7wP06SXQC3V9JpSZNc",sheet=1)
cbPlayers <- read_sheet("19ZMSWKDTOG_KL4YSFfO0_Uu4eZnZ7E0xRjM2kgYTFOg",sheet=1)