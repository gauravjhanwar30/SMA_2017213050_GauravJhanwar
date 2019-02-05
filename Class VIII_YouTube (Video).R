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
