##Kmeans
mydata=read.csv("C:/Users/Naveen/Desktop/final.csv")
##Accrding to rule of thumb k=sqrt(n/2)
results=kmeans(mydata,262)
results$cluster
results$centers
plot(mydata[c("LGA_NAME","TOTAL_PERSONS")],col=c("red","purple","darkgreen"),type="p")
