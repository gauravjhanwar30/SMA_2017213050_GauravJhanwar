#Libraries
library(caret)
library(pROC)
library(mlbench)
library(e1071)

#Example-1 Student Application (Classification) - binary data
data=read.csv(file.choose(),header = T)
str(data)
data$admit[data$admit==0]='No'
data$admit[data$admit==1]='Yes'
data$admit=factor(data$admit)

#KNN Model
trControl=trainControl(method="repeatedcv",number=10,repeats=3)
set.seed(222)
fit=train(admit~.,data=data,method='knn',tuneLength=20,trControl=trControl,preProc=c("center","scale"))

#Model Performance
fit
plot(fit)
varImp(fit)


#Regression on BostonHousing Data

library(mlbench)
data(BostonHousing)
data1=BostonHousing

set.seed(333)
fit=train(medv~.,data=data1,tuneGrid=expand.grid(k=1:70),method='knn',metric='Rsquared',trControl=trControl,preProc=c('center','scale'))

#Model Performance
fit
plot(fit)
varImp(fit)
pred=predict(fit,newdata = data1)
RMSE(pred,data1$medv)
plot(pred~data1$medv)




#Read data file - Cardiotocographic data
mydata=read.csv(file.choose())
mydata$NSPF=as.factor(mydata$NSP)

#Decision tree with party
library(party)
mytree=ctree(NSPF~LB+AC+FM,mydata,controls = ctree_control(mincriterion = 0.9,minsplit = 50))
print(mytree)
plot(mytree,type="simple")
