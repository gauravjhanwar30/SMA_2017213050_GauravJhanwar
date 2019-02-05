#Getting Youtube Data
library(vosonSML)

#Google Developer API Key
apikey="AIzaSyDwceFbclO6zZs1kn6JfhCzeLpPBfImE68"
key=Authenticate('youtube',apikey)

#Collect data using Youtube Video IDs
ytdata=CollectDataYoutube(videoIDs = c('VVY3do673Zc','tKmkMVaNu9g'),apiKeyYoutube = apikey)
str(ytdata)
write.csv(ytdata,file='C:/Users/lab3/Downloads/ytdata.csv',row.names = F)

#Read YouTube Data File
data=read.csv(file.choose(),header = T)
str(data)
data=data[data$ReplyToAnotherUser != FALSE,]
y=data.frame(ytdata$User,ytdata$ReplyToAnotherUser)

#Create user network
library(igraph)
net=graph.data.frame(y,directed = T)
net=simplify(net)
V(net)
E(net)
V(net)$label=V(net)$name
V(net)$degree=degree(net)

#Histogram of node degree
hist(V(net)$degree,
     col = 'green',
     main = 'Histogram of the Node Diagram',
     ylab = 'Frequency',
     xlab = 'Degree of Vertices')

#Netwrok Diagram
plot(net,
     vertex.size = 0.2*V(net)$degree,
     edge.arrow.size = 0.1,
     vertex.label.cex = 0.01*V(net)$degree)

#Sentiment Analysis (Other libraries: RSentiment, )
library(syuzhet)

#Read data file
data1=read.csv(file.choose(),header = T)
str(data)
comments=iconv(data1$Comment, to = 'utf-8')

#Obtain sentiment scores
s=get_nrc_sentiment(comments)
head(s)
s$neutral=ifelse(s$negative+s$positive==0,1,0)
head(s)
comments[3]

#Bar plot
barplot(100*colSums(s)/sum(s),
        las = 2,
        col = rainbow(10),
        ylab = 'Percentage',
        main = 'Sentiment Scores for YouTube Comments')

#*********************************************************************************#

library(devtools)
devtools::install_github("ropenscilabs/opencv")
#Libraries
library(opencv)
library(psych)

#Live face detection
ocv_video(ocv_face)

#Various options
ocv_video(ocv_edges)
ocv_video(ocv_knn)
ocv_video(ocv_facemask)
ocv_video(ocv_mog2)
ocv_video(ocv_stylize)
ocv_video(ocv_sketch)

library(rattle)
#Face Recognition
ccb=ocv_read(file.choose())
faces=ocv_face(ccb)

#Various options

#Get the face location data
facemask=ocv_facemask(ccb)
attr(facemask,'faces')

library(rattle)
rattle()
library(RGtk2)
