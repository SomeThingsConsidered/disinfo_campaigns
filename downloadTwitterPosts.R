library(twitteR)
library(dplyr)
library(lubridate)

my_api_key <- "Y0h1U5O9N4S3AzE5z0kLLRee5"
my_api_secret <- "812xAMCcnHdi9aAxjJ9sWjYJyF3tQszh1qXP8yG6lgIDrraxbt"
my_access_token <- "4705250966-oi9Lm3ybajXFH59b3igIIorldtmw9lnBjYkqtrV"
my_access_token_secret <- "VtZ5cwwkRzk5q7eutYQ51pd8DwubdwEdcMeYjFbKWsgJU"

setup_twitter_oauth(my_api_key,
                    my_api_secret,
                    my_access_token,
                    my_access_token_secret)


###################################################################################

# couldnt find   'GameOnPatriots'



Applist <- (c('RickOhioImBack', 
              'SoarForFreedom',
              'WeSupport45',
              'JacobAWohl',
              'Trey_VonDinkis',
              'RubyRockstar333'))

tempgroup <- data.frame()
agggroup1 <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=2000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup1 <-rbind(agggroup1, tempgroup)
}



Applist <- (c('JerseyGoods',
              'JacquelynDeSmit',
              'chuckwi87998634',
              'peterboykin'))

tempgroup <- data.frame()
agggroup2 <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=2000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup2 <-rbind(agggroup2, tempgroup)
}

agggroup <- rbind(agggroup1, agggroup2)



#save as csv
agggroup$created2=strptime(as.character(agggroup$created), format="%Y-%m-%d %H:%M:%S")
agggroup$month <- month(agggroup$created2)
agggroup$day <- day(agggroup$created2)
agggroup$year <- year(agggroup$created2)

aggrp1 <- select(agggroup, -created2)



aggrp2 <-filter(aggrp1, (day >= 22 & month ==8 & year==2018))


write.csv(aggrp2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_aug22_aug29.csv")


save(aggrp2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_aug22_aug29.rda")



chkusers <- lookupUsers(c('RickOhioImBack', 
                         'SoarForFreedom',
                         'WeSupport45',
                         'JacobAWohl',
                         'Trey_VonDinkis',
                         'RubyRockstar333',
                         'JerseyGoods',
                         'JacquelynDeSmit',
                         'chuckwi87998634',
                         'peterboykin'))


testbigdf<-data.frame()
for (i in 1:10){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}


save(testbigdf, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_accounts.rda")

write.csv(testbigdf, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_accounts.csv")


###################################################################################



Applist <- (c('AynRandPaulRyan', 
              'balancedlogic',
              'maydaymindy9',
              'SethAbramson',
              'MayIrmamay14',
              'ChrisJZullo',
              '44mmvvpp',
              'hullboydan',
              'ColSand42',
              'DemResistance'
))

tempgroup <- data.frame()
agggroup <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=2000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup <-rbind(agggroup, tempgroup)
}

#save as csv
agggroup$created2=strptime(as.character(agggroup$created), format="%Y-%m-%d %H:%M:%S")
agggroup$month <- month(agggroup$created2)
agggroup$day <- day(agggroup$created2)
agggroup$year <- year(agggroup$created2)

aggrp1 <- select(agggroup, -created2)



aggrp2 <-filter(aggrp1, (day >= 22 & month ==8 & year==2018))


write.csv(aggrp2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Antitrump_aug22_aug29.csv")


save(aggrp2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Antitrump_aug22_aug29.rda")




chkusers <- lookupUsers(c('AynRandPaulRyan', 
                          'balancedlogic',
                          'maydaymindy9',
                          'SethAbramson',
                          'MayIrmamay14',
                          'ChrisJZullo',
                          '44mmvvpp',
                          'hullboydan',
                          'ColSand42',
                          'DemResistance'))


testbigdf<-data.frame()
for (i in 1:10){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}


save(testbigdf, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Antitrump_accounts.rda")

write.csv(testbigdf, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Antitrump_accounts.csv")


