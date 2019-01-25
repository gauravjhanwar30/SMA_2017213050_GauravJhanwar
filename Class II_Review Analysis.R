#Read file
test1=read.csv(file.choose(),header = T)
str(test1)

#Build corpus
#Install package "tm"
library(tm)

Corpus=Corpus(VectorSource(test1$a.size.base))
inspect(Corpus[1:5])

#Clean text
Corpus=tm_map(Corpus,tolower)
inspect(Corpus[1:5])

Corpus=tm_map(Corpus,removePunctuation)
inspect(Corpus[1:5])

Corpus=tm_map(Corpus,removeNumbers)
inspect(Corpus[1:5])

Cleanset=tm_map(Corpus,removeWords,stopwords('english'))
inspect(Cleanset[1:5])

Cleanset=tm_map(Cleanset,removeWords,c('can','book'))
incleanset=tm_map(Cleanset,gsub,
                  pattern='amazing',
                  replacement='awesome')
Cleanset=tm_map(Cleanset,stripWhitespace)
inspect(Cleanset[1:5])

#Term document matrix
tdm=TermDocumentMatrix(Cleanset)
tdm
tdm=as.matrix(tdm)
tdm[1:10,1:20]

distMatrix=dist(tdm,method = 'euclidean')
head(distMatrix)

dendo=hclust(distMatrix,method = "ward.D")
plot(dendo)
