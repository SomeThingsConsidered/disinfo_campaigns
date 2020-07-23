library(dplyr)
library(tm)
library(stringr)
library(ggplot2)
library(lubridate)

load(file="/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_aug22_aug29.rda")

#tweets <-filter(aggrp2,screenName=="AynRandPaulRyan")
tweets <- aggrp2


tweets$text2 <-str_replace_all(tweets$text, '[[:punct:]]',' ')
tweets$text3 <-str_replace_all(tweets$text2,"[^[:graph:]]", " ") 
text <- select(tweets, text3)
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

dm2 <-filter(dm,freq > 25)
write.csv(dm2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_unigram.csv")



BigramTokenizer <-
  function(x)
    unlist(lapply(ngrams(words(x),2), paste, collapse = " "), use.names=FALSE)
tdm=TermDocumentMatrix(corp, control=list(tokenize = BigramTokenizer))
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)

dm2 <-filter(dm,freq > 25)



write.csv(dm2, file = "/Users/cannonmatt/Documents/Disinformation_Tweets/TwitterDownload/Protrump_bigram.csv")

