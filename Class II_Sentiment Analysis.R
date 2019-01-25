#Sentiment Analysis
#Install package 'syuzhet'
library(syuzhet)

#Read file
test1=read.csv(file.choose(),header = T)
senti=iconv(test1$a.size.base,to='utf-8')

#Obtain sentiment scores
s=get_nrc_sentiment(senti)
head(s)
s[4]
get_nrc_sentiment('delay')
