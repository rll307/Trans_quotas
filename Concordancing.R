# Packages ----------------------------------------------------------------

library(quanteda)

# Preparing data ----------------------------------------------------------
# Netvizz used to save data as*.tab delimited files:
comments <- read_delim("comments.tab", delim = "\t")

# Creating the corpus  ----------------------------------------------------------

Conc.Corpus <- corpus(comments, text_field = "comment_message")

# Concordancing

trans <- kwic(corpus, pattern = "transe", window = 15, 
              case_insensitive=TRUE, valuetype = "regex")

# Some parameters might be changed, such as the pattern, the valuetype etc. 