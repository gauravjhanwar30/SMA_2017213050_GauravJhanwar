#Logical, Visual, Statical

#library needed
library(glmnet)
library(caret)
library(mlbench)
library(psych)

#Data
data("BostonHousing")
data1=BostonHousing

?BostonHousing

pairs.panels(data)

summary(data)

model=lm(medv~.,data = data1)
summary(model)
model

res=model$residuals
pred=model$fitted.values

cbind(pred,data1$medv,res)

head(data1$medv)

#Data Partition
set.seed(222)
ind=sample(2,nrow(data1),replace=T,prob = c(0.7,0.3))
train=data1[ind==1,]
test=data1[ind==2,]

model=lm(medv~.,data=train)
summary(model)
model

#Prediction
p1=predict(model,train)
sqrt(mean((train$medv-p1)^2))

#Prediction
p2=predict(model,test)
sqrt(mean((test$medv-p2)^2))
