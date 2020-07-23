#install.packages("twitteR")

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

# pro trump



Applist <- (c(
"GeneMcVay",       
"JC20204",         
"JamesDoss50",
"NRO",
"PatriotPorn",
"Sammy4121958",   
"SandraTXAS",
"Sheckyi",
"Stump_for_Trump",
"The_Trump_Train",
"Trey_VonDinkis",
"TrmpPnceMkeSens",
"angelfan1973",
"ckent283",
"codeofvets",
"drawandstrike",
"inittowinit007",
"jakepalmieri",
"jpjack_brennan",
"nizmycuba",
"os4185"  
              ))

tempgroup <- data.frame()
agggroup <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=1000, includeRts=TRUE)
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



aggrp2 <-filter(aggrp1, ( month ==10 & year==2018 & day >=15)     )


write.csv(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/Protrump_oct15_oct21.csv")
save(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/Protrump_oct15_oct21.rda")





chkusers <- lookupUsers( c(
  "GeneMcVay",       
  "JC20204",         
  "JamesDoss50",
  "NRO",
  "PatriotPorn",
  "Sammy4121958",   
  "SandraTXAS",
  "Sheckyi",
  "Stump_for_Trump",
  "The_Trump_Train",
  "Trey_VonDinkis",
  "TrmpPnceMkeSens",
  "angelfan1973",
  "ckent283",
  "codeofvets",
  "drawandstrike",
  "inittowinit007",
  "jakepalmieri",
  "jpjack_brennan",
  "nizmycuba",
  "os4185"  
))

testbigdf<-data.frame()
for (i in 1:21){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}



write.csv(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/ProtrumpAccountInfo.csv")
save(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/ProtrumpAccountInfo.rda")



###################################################################################
#antitrump


Applist <- (c(
  "AngryandAsian",
  "Cha51brolll19",
  "ChangeTheLAUSD",
  "ChrisJZullo",
  "CitizensFedUp",
  "DavidWetherell", 
  "DemResistance",
  "GeorgeLakoff",
  "GonzoBaggins",
  "HillaryWarnedUs",
  "HoneyDemForce",
  "IlllllIAna_Pet_",
  "InspiringU2",
  "InvestigateRU",
  "JeffreyGuterman",
  "Jessicap527",
  "LOCKHIMUPUSA",
  "MDBlanchfield",  
  "MisterAleem",
  "NickFury2018",
  "PalmerReport",
  "TheDemCoalition",
  "TruckersVote",
  "TruthBlueIn",    
  "Wonkette",
  "aroseblush",
  "cowards_are_us",
  "crpswarrior1",
  "defenddacatx",
  "dusterdog1",     
  "dwaynecobb",
  "funder",
  "lori_go",
  "maydaymindy9",
  "misinfonewsfeed",
  "ninaandtito",    
  "njterrie",
  "russ30327",
  "snowflake_miner",
  "AynRandPaulRyan",
  "waltshaub"
))

tempgroup <- data.frame()
agggroup <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=1000, includeRts=TRUE)
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




aggrp2 <-filter(aggrp1, (month ==10 & year==2018 & day >=15 )     )


write.csv(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/antitrump_oct15_oct21.csv")
save(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/antitrump_oct15_oct21.rda")



chkusers <- lookupUsers( c(
  "AngryandAsian",
  "Cha51brolll19",
  "ChangeTheLAUSD",
  "ChrisJZullo",
  "CitizensFedUp",
  "DavidWetherell", 
  "DemResistance",
  "GeorgeLakoff",
  "GonzoBaggins",
  "HillaryWarnedUs",
  "HoneyDemForce",
  "IlllllIAna_Pet_",
  "InspiringU2",
  "InvestigateRU",
  "JeffreyGuterman",
  "Jessicap527",
  "LOCKHIMUPUSA",
  "MDBlanchfield",  
  "MisterAleem",
  "NickFury2018",
  "PalmerReport",
  "TheDemCoalition",
  "TruckersVote",
  "TruthBlueIn",    
  "Wonkette",
  "aroseblush",
  "cowards_are_us",
  "crpswarrior1",
  "defenddacatx",
  "dusterdog1",     
  "dwaynecobb",
  "funder",
  "lori_go",
  "maydaymindy9",
  "misinfonewsfeed",
  "ninaandtito",    
  "njterrie",
  "russ30327",
  "snowflake_miner",
  "AynRandPaulRyan",
  "waltshaub"
))


testbigdf<-data.frame()
for (i in 1:41){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}



write.csv(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/antitrumpAccountInfo.csv")
save(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/antitrumpAccountInfo.rda")


#############################################################################################


# walkaway

#"jamesirving2", dropped 10.21

Applist <- (c(
  "RubyRockstar333",
  "John_KissMyBot",
  "JacquelynDeSmit",
  "JerseyGoods",
  "Woke2008",
  "chuckwi87998634",
   "pollsofpolitics",
  "peterboykin",
  "Tombx7M",
  "CliffShep",
  "DeplorableChoir",
  "FrancesannMaga",
  "PaulHook_em",
  "Dogman1013",
  "TexasLips",
  "1DanielScott",
  "carrera911targa",
  "EntheosShines",  
  
  "JannaWilkinso69",
  "Jeffmyers0011",
  "JohnGre2563232",
  "perfectsliders",
  "SpitfireSuzy",   
   "ChrissyMAGAOne",
  "Slappy_Kincaid",
  "ChrissyUSA1",
  "lisarob61254794",
  "EstefaniaRobin2",
  "renomarky",
   "TomTrump2020",
  "1stGenAmerican1"))



tempgroup <- data.frame()
agggroup1 <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=1000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup1 <-rbind(agggroup1, tempgroup)
}

#   "BaggaBrigade", dropped 9/9
# "jmarlene7", dropped 10/21
# "isabell08481837" dropped 10/21
 
Applist <- (c(
  "ginocarr",
 
  "Manni_syd",
  "liuyingchao",
   "peace4all333",
  "reneewoods3",
  "Roy___Rogers",
  "Baby___Del",
  "LarryHumphries1",
  "rosie514",
   "AbbeyMaeCook88",
  "AkramiTaha",
  "Boriskogan5",
  "ChristeneDove",
  "fanaticraven"   
   ))




tempgroup <- data.frame()
agggroup2 <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=1000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup2 <-rbind(agggroup2, tempgroup)
}


#"MikeRyan2016" removed 9/16
#"TuxiTalk1", removed 9/30
#"LibsloveGibs", removed 10/7
# "MrsAmerica1776", 10/14
# "Joseph_Greely", 10/21

Applist <- (c(

  "Naninani51",
"robinfajen1970",

"USA4TRUMP",      
"WhiteOne413",
"celesteholsinge",
"denise39deer",
"TheAlaskanInFL",
"zeusFanHouse",
"cathymv",        
"Curiouswithlife",
"DebsterAPTT45",


"LeftLoons",

"O_IrishT",
"Qandew",
"BBTruthbetold",
"HeroAssange",
"KRaZiKiLLeTTe",  
"LvrCoffee",
"Patrici41859934",
"RobertH09778996",
"SoarForFreedom",
"SYMMETRY_11",
"VanWalker67",
"YnotDebPauly",
"Cat_00005",
"CJC28756315",
"DoneRightPro",
"IMHO1969",
"Jackmeh04461964",
"JaniceAFrank1",
"LeeanneMAGA",


"Tasukram",
"antypynky55"  
))

tempgroup <- data.frame()
agggroup3 <- data.frame()

for (number in Applist)  {
  r_stat2 <- userTimeline(number, n=1000, includeRts=TRUE)
  print(number)
  tempgroup <- do.call("rbind", lapply(r_stat2, as.data.frame))
  agggroup3 <-rbind(agggroup3, tempgroup)
}



agggroup <- rbind(agggroup1, agggroup2, agggroup3)



#save as csv
agggroup$created2=strptime(as.character(agggroup$created), format="%Y-%m-%d %H:%M:%S")
agggroup$month <- month(agggroup$created2)
agggroup$day <- day(agggroup$created2)
agggroup$year <- year(agggroup$created2)

aggrp1 <- select(agggroup, -created2)



aggrp2 <-filter(aggrp1, (month ==10 & year==2018 & day >=15)     )


write.csv(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/walkaway_oct15_oct21.csv")
save(aggrp2, file = "/home/matt/Documents/DisinformationSocialMedia/walkaway_oct15_oct21.rda")




chkusers <- lookupUsers( c(
  "RubyRockstar333",
  "John_KissMyBot",
  "JacquelynDeSmit",
  "JerseyGoods",
  "Woke2008",
  "chuckwi87998634",
  "pollsofpolitics",
  "peterboykin",
  "Tombx7M",
  "CliffShep",
  "DeplorableChoir",
  "FrancesannMaga",
  "PaulHook_em",
  "Dogman1013",
  "TexasLips",
  "1DanielScott",
  "carrera911targa",
  "EntheosShines",  
  "jamesirving2",
  "JannaWilkinso69",
  "Jeffmyers0011",
  "JohnGre2563232",
  "perfectsliders",
  "SpitfireSuzy",   
  "ChrissyMAGAOne",
  "Slappy_Kincaid",
  "ChrissyUSA1",
  "lisarob61254794",
  "EstefaniaRobin2",
  "renomarky",
  "TomTrump2020",
  "1stGenAmerican1",
  "ginocarr",
  "jmarlene7",
  "Manni_syd",
  "liuyingchao",
  "peace4all333",
  "reneewoods3",
  "Roy___Rogers",
  "Baby___Del",
  "LarryHumphries1",
  "rosie514",
  "AbbeyMaeCook88",
  "AkramiTaha",
  "Boriskogan5",
  "ChristeneDove",
  "fanaticraven",   
  "isabell08481837",
  "Naninani51",
  "robinfajen1970",
  "TuxiTalk1",
  "USA4TRUMP",      
  "WhiteOne413",
  "celesteholsinge",
  "denise39deer",
  "TheAlaskanInFL",
  "zeusFanHouse",
  "cathymv",        
  "Curiouswithlife",
  "DebsterAPTT45",
  "Joseph_Greely",
  "LeftLoons",
  "MikeRyan2016",   
  "MrsAmerica1776",
  "O_IrishT",
  "Qandew",
  "BBTruthbetold",
  "HeroAssange",
  "KRaZiKiLLeTTe",  
  "LvrCoffee",
  "Patrici41859934",
  "RobertH09778996",
  "SoarForFreedom",
  "SYMMETRY_11",
  "VanWalker67",
  "YnotDebPauly",
  "Cat_00005",
  "CJC28756315",
  "DoneRightPro",
  "IMHO1969",
  "Jackmeh04461964",
  "JaniceAFrank1",
  "LeeanneMAGA",
  "LibsloveGibs",
  "Tasukram",
  "antypynky55"  
))


testbigdf<-data.frame()
for (i in 1:86){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}



write.csv(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/WalkawayAccountInfo.csv")
save(testbigdf, file = "/home/matt/Documents/DisinformationSocialMedia/WalkawayAccountInfo.rda")


