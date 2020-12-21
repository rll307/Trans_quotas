# Packages ----------------------------------------------------------------
library(readr)
library(tidytext)
library(tidyverse)
library(plyr)
library(dplyr)


# Preparing data ----------------------------------------------------------
# Netvizz used to save data as*.tab delimited files:
comments <- read_delim("comments.tab", delim = "\t")

# Stopwords
# We are going to use a list of stopwords provided by the package *tm*, so no need to import. Problably some users names will pop up, you add them to the list.
#saving the stopwords as a data frame

my.stopwords <-data.frame(tm::stopwords("pt"))

#Renaming the column
colnames(my.stopwords)<-"word"

geral.list <- comments %>%
  unnest_tokens(word, comment_message)%>%
  anti_join(my.stopwords, by="word")%>%
  count(word)%>%
  mutate(freq = (n/sum(n))*100)

#Rounding by 3
geral.list$freq <- round(geral.list$freq,3)









