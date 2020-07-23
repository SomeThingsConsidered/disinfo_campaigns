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



#pro trump
#21 of 26

#AndyHortin18
#TrumpQAnon
#ZibaLady1ZibaLady1
#dherman001
#rp4freedom1st

chkusers <- lookupUsers( c('AndyHortin18',
'GeneMcVay',
'JC20204',
'JamesDoss50',
'NRO',
'PatriotPorn',
'Sammy4121958',
'SandraTXAS',
'Sheckyi',
'Stump_for_Trump',
'The_Trump_Train',
'Trey_VonDinkis',
'TrmpPnceMkeSens',
'TrumpQAnon',
'ZibaLady1ZibaLady1',
'angelfan1973',
'ckent283',
'codeofvets',
'dherman001',
'drawandstrike',
'inittowinit007',
'jakepalmieri',
'jpjack_brennan',
'nizmycuba',
'os4185',
'rp4freedom1st'))

testbigdf<-data.frame()
for (i in 1:21){holddf<-twListToDF(chkusers[i])
testbigdf<-rbind(testbigdf,holddf)}

testbigdf$screenName


##############################

#anti trump

# 41 of 46
#ChrisHo01441969
#OperationJust
#Resist_chick1
#TalbertSwan
#genlady9



chkusers <- lookupUsers( c(
  'AngryandAsian',
  'Cha51brolll19',
  'ChangeTheLAUSD',
  'ChrisHo01441969',
  'ChrisJZullo',
  'CitizensFedUp',
  'DavidWetherell',
  'DemResistance',
  'GeorgeLakoff',
  'Gonzobaggins',
  'HillaryWarnedUs',
  'HoneyDemForce',
  'IlllllIAna_Pet_',
  'InspiringU2',
  'InvestigateRU',
  'JeffreyGuterman',
  'Jessicap527',
  'LOCKHIMUPUSA',
  'MDBlanchfield',
  'MisterAleem',
  'NickFury2018',
  'OperationJust',
  'PalmerReport',
  'Resist_chick1',
  'TalbertSwan',
  'TheDemCoalition',
  'TruckersVote',
  'TruthBlueIn',
  'Wonkette',
  'aroseblush',
  'cowards_are_us',
  'crpswarrior1',
  'defenddacatx',
  'dusterdog1',
  'dwaynecobb',
  'funder',
  'genlady9',
  'lori_go',
  'maydaymindy9',
  'misinfonewsfeed',
  'ninaandtito',
  'njterrie',
  'russ30327',
  'snowflake_miner',
  'AynRandPaulRyan',
  'waltshaub'))


testbigdf2<-data.frame()
for (i in 1:41){holddf<-twListToDF(chkusers[i])
testbigdf2<-rbind(testbigdf2,holddf)}

testbigdf2$screenName






#########################################################

##walkaway
#89 of 100

chkusers <- lookupUsers( c(
'RubyRockstar333',
'GameOnPatriots',
'John_KissMyBot',
'JacquelynDeSmit',
'JerseyGoods',
'Trump5254',
'Woke2008',
'ERRippee',
'chuckwi87998634',
'pollsofpolitics',
'AndyHortin18',
'BadgerCzar',
'peterboykin',
'Tombx7M',
'4cbdbenifits',
'CliffShep',
'DeplorableChoir',
'FrancesannMaga',
'PaulHook_em',
'Dogman1013',
'TexasLips',
'1DanielScott',
'carrera911targa',
'EntheosShines',
'jamesirving2',
'JannaWilkinso69',
'Jeffmyers0011',
'JohnGre2563232',
'perfectsliders',
'RedRisingUSA',
'SpitfireSuzy',
'ChrissyMAGAOne',
'Slappy_Kincaid',
'ChrissyUSA1',
'lisarob61254794',
'EstefaniaRobin2',
'renomarky',
'TomTrump2020',
'1stGenAmerican1',
'ginocarr',
'jmarlene7',
'Manni_syd',
'liuyingchao',
'peace4all333',
'reneewoods3',
'Roy___Rogers',
'Vince_MildRed',
'Baby___Del',
'LarryHumphries1',
'rosie514',
'AbbeyMaeCook88',
'AkramiTaha',
'BaggaBrigade',
'Boriskogan5',
'ChristeneDove',
'fanaticraven',
'isabell08481837',
'Naninani51',
'RickOhioImBack',
'robinfajen1970',
'TuxiTalk1',
'USA4TRUMP',
'WhiteOne413',
'celesteholsinge',
'denise39deer',
'TheAlaskanInFL',
'zeusFanHouse',
'cathymv',
'Curiouswithlife',
'DebsterAPTT45',
'Joseph_Greely',
'kellyesorelle',
'LeftLoons',
'MikeRyan2016',
'MrsAmerica1776',
'O_IrishT',
'Qandew',
'SueG196315',
'BBTruthbetold',
'HeroAssange',
'KRaZiKiLLeTTe',
'laub_torres',
'LvrCoffee',
'Patrici41859934',
'RobertH09778996',
'SoarForFreedom',
'SYMMETRY_11',
'VanWalker67',
'YnotDebPauly',
'Cat_00005',
'CJC28756315',
'DoneRightPro',
'IMHO1969',
'Jackmeh04461964',
'JaniceAFrank1',
'LeeanneMAGA',
'LibsloveGibs',
'Tasukram',
'antypynky55'  ))


testbigdf2<-data.frame()
for (i in 1:89){holddf<-twListToDF(chkusers[i])
testbigdf2<-rbind(testbigdf2,holddf)}

testbigdf2$screenName


