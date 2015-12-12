library(ISLR)
library(tree)

mydata<-read.csv("C:/Users/sony/Desktop/PBL Data/data_now.csv")
attach(mydata)
head(mydata)

range(SEVERITY)
high=ifelse(SEVERITY>=2,"MODERATE","HIGH")
mydata=data.frame(mydata,high)
names(mydata)
mydata=mydata[,-4]
names(mydata)
set.seed(3)
train=sample(1:nrow(mydata),nrow(mydata)/1000)
test=-train
training_data=mydata[train,]
testing_data=mydata[test,]
testing_high=high[test]


t_m=tree(high~.,training_data)
plot(t_m)
text(t_m,pretty=0)

t_p=predict(t_m,testing_data,type="class")
mean(t_p!=testing_high)


set.seed(6)
cv_tree=cv.tree(t_m,FUN=prune.misclass)
names(cv_tree)
plot(cv_tree$size,cv_tree$dev,type="b")


p_m=prune.misclass(t_m,best=2)
plot(p_m)
text(p_m,pretty=0)

tr_p=predict(p_m,testing_data,type="class")
mean(tr_p!=testing_high)

