data<-read.csv(file.choose())
for(i in seq(2,ncol(data)))
{
  data[,i]=as.numeric(data[,i])
  data[,i]=data[,i]-1
}

library("rpart")

dt=rpart(Buys~.,data,control=rpart.control(minsplit=2))

plot(dt)
text(dt)

rpart.plot(dt)
     

