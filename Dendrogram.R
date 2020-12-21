
# Packages ----------------------------------------------------------------
library(tm)
library(plyr)
library(readr)
library(tm)
library(plyr)
library(FactoMineR)



# Preparing data ----------------------------------------------------------
# Netvizz used to save data as*.tab delimited files:
comments <- read_delim("comments.tab", delim = "\t")

# Converting the data in a single string 
# Here we are considering all data 
text_string <- as.character(base1$comment_message)

# Stopwords
# We are going to use a list of stopwords provided by the package *tm*, so no need to import. Problably some users names will pop up, you add them to the list (see code below)

# Creating the corpus for processing with tm
corpus.cluster <- Corpus(VectorSource(text_string))


# Corpus Cleaning ---------------------------------------------------------

























