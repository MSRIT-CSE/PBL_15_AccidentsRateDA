mydata=read.csv("C:/Users/Naveen/Desktop/final.csv")
results=kmeans(mydata,262)
counts<-table(mydata$DAY_OF_WEEK,mydata$SEVERITY)
barplot(counts,main="Car",xlab = "SEVERITY",ylab="SPEED_ZONE",col=c("darkblue","red"),legend=rownames(counts),beside = TRUE)
