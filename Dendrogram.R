
# Packages ----------------------------------------------------------------
library(tm)
library(plyr)
library(readr)
library(tm)
library(plyr)
library(FactoMineR)
library(RColorBrewer)



# Preparing data ----------------------------------------------------------
# Netvizz used to save data as*.tab delimited files:
comments <- read_delim("comments.tab", delim = "\t")

# Converting the data in a single string 
# Here we are considering all data 
text_string <- as.character(base1$comment_message)

# Stopwords
# We are going to use a list of stopwords provided by the package *tm*, so no need to import. Problably some users names will pop up, you add them to the list

# Creating the corpus for processing with tm
corpus.cluster <- Corpus(VectorSource(text_string))


# Corpus Cleaning ---------------------------------------------------------
## Two functions
### URL removing
removeURL <- function(x) gsub("http[[:alnum:][:punct:]]*", "", x)
### Users removing
remove.users <-function(x) gsub("@[[:alnum:][:punct:]]*","",x)

#cleaning using tm_map
corpus.cluster <- tm_map(corpus.cluster, content_transformer(removeURL))
corpus.cluster <- tm_map(corpus.cluster,content_transformer(remove.users))
corpus.cluster <- tm_map(corpus.cluster, stripWhitespace)
corpus.cluster <- tm_map(corpus.cluster, removePunctuation)
corpus.cluster <- tm_map(corpus.cluster,
                         function(x)removeWords(x,stopwords("pt")))


# Cluster calculations ---------------------------------------------------
## creating a ter document matrix
cluster.tdm <- TermDocumentMatrix(corpus.cluster)
## Transforming this tdm in an ordinary matrix
cluster.m <- as.matrix(cluster.tdm)

#Removing sparce words
cluster.wf <- rowSums(cluster.m)
cluster.m1 <- cluster.m[cluster.wf>quantile(cluster.wf,probs=0.99), ]

#Removing words with zero relationship
cluster.m1 <- cluster.m1[,colSums(cluster.m1)!=0]

# Transforming all relationships in biniary
cluster.m1[cluster.m1 > 1] <- 1

#Calculating the distance
cluster.m1dist = dist(cluster.m1, method="binary")

# Calculating the clusters, using wrds method
clus1 <- hclust(cluster.m1dist, method="ward.D2")


# Creating the dendrogram
##Initial plot as a list
dend <- as.dendrogram(clus1)

## Creating the colours

## Creating 10 groups for analysis
clusMember <- cutree(clus1, 10)

#Function to 'colour' the labels
colLab <- function(n) {
  if (is.leaf(n)) {
    a <- attributes(n)
    labCol <- labelColors[clusMember[which(names(clusMember) == a$label)]]
    attr(n, "nodePar") <- c(a$nodePar, lab.col = labCol)
  }
  n
}

#Applying the colours to all nodes in the dendogram
clusDendro <- dendrapply(dend, colLab)

# Now actually plotting
plot(clusDendro,cex=0.9)






















