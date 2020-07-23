#problem with bigrams in later versions of tm
#require(devtools)
#install_version("tm", version= "0.6-2", repos = "http://cran.r-project.org")


library(dplyr)
library(tm)
library(stringr)
library(ggplot2)
library(lubridate)
library(caTools)
library(Hmisc)

setwd("/home/matt/Documents/DisinformationSocialMedia")

#pro trump summary info

load(file="ProtrumpAccountInfo.rda")

glimpse(testbigdf)
#describe(testbigdf$statusesCount)
#describe(testbigdf$followersCount)
#describe(testbigdf$friendsCount)

tweets <- testbigdf
tweets$text <-tweets$description

tweets$text2 <-str_replace_all(tweets$text, '[[:punct:]]',' ')
tweets$text3 <-str_replace_all(tweets$text2,"[^[:graph:]]", " ") 
text <- data.frame(doc_id=row.names(tweets), text=tweets$text3)
#head(text)
corp <-Corpus(DataframeSource(text))
corp <- tm_map(corp, content_transformer(tolower))
myStopwords <- c(stopwords('english'), "http", "https", 'www', 'com', 'amp', 't', 'don', 'did','doesn')
corp <- tm_map(corp, removeWords, myStopwords)
tdm=TermDocumentMatrix(corp)
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)
#dm


#anti trump summary info

load(file="antitrumpAccountInfo.rda")

glimpse(testbigdf)
#describe(testbigdf$statusesCount)
#describe(testbigdf$followersCount)
#describe(testbigdf$friendsCount)

tweets <- testbigdf
tweets$text <-tweets$description

tweets$text2 <-str_replace_all(tweets$text, '[[:punct:]]',' ')
tweets$text3 <-str_replace_all(tweets$text2,"[^[:graph:]]", " ") 
text <- data.frame(doc_id=row.names(tweets), text=tweets$text3)
#head(text)
corp <-Corpus(DataframeSource(text))
corp <- tm_map(corp, content_transformer(tolower))
myStopwords <- c(stopwords('english'), "http", "https", 'www', 'com', 'amp', 't', 'don', 'did','doesn')
corp <- tm_map(corp, removeWords, myStopwords)
tdm=TermDocumentMatrix(corp)
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)
#dm

##     PRO TRUMP BY WEEK
load(file="Protrump_aug26_sep1.rda")



tweets <- aggrp2
tweets$text2 <-str_replace_all(tweets$text, '[[:punct:]]',' ')
tweets$text3 <-str_replace_all(tweets$text2,"[^[:graph:]]", " ") 
text <- data.frame(doc_id=row.names(tweets), text=tweets$text3)
#head(text)
corp <-Corpus(DataframeSource(text))
corp <- tm_map(corp, content_transformer(tolower))
myStopwords <- c(stopwords('english'), "http", "https", 'www', 'com', 'amp', 't', 'don', 'did','doesn')
corp <- tm_map(corp, removeWords, myStopwords)
tdm=TermDocumentMatrix(corp)
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)
dm2 <-filter(dm,freq > 30)
#dm2



corp <-VCorpus(DataframeSource(text))
corp <- tm_map(corp, content_transformer(tolower))
myStopwords <- c(stopwords('english'), "http", "https", 'www', 'com', 'amp', 't', 'don', 'did','doesn')
corp <- tm_map(corp, removeWords, myStopwords)
BigramTokenizer <-
  function(x)
    unlist(lapply(ngrams(words(x),2), paste, collapse = " "), use.names=FALSE)
tdm2=TermDocumentMatrix(corp, control=list(tokenize = BigramTokenizer))
# define tdm as matrix
m2 = as.matrix(tdm2)
# get word counts in decreasing order
word_freqs2 = sort(rowSums(m2), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm2 = data.frame(word=names(word_freqs2), freq=word_freqs2)
dm22 <-filter(dm,freq > 5)
dm22

