#setwd("X:/LAB/ML")

data<-read.csv(file.choose(),header=TRUE)

for(i in seq(1,ncol(data)))
{
  data[,i]=as.numeric(data[,i])
}

c=unique(data[,ncol(data)])
tot_ent=0
for(i in c)
{
  v=length(which(data[ncol(data)]==i))/nrow(data)
  tot_ent=tot_ent+(v*log2(v))
}
tot_ent=-tot_ent
ig=matrix(0,1,ncol(data)-1)
for(i in seq(ncol(data)-1))
{
  f=unique(data[,i])
  for(j in f)
  {
    tmp=0
    for(k in c)
    {
        v=(length(which(data[i]==j&data[ncol(data)]==k)))/length(which(data[i]==j))
        if(v!=0)
        {
          tmp=tmp+(v*log2(v))
        }
    }
    tmp=-tmp
    ig[i]=ig[i]+(tmp*(length(which(data[i]==j))/nrow(data)))
  }
}
ig=tot_ent-ig
best=which.max(ig)
cat("\nThe best factor is",names(data)[best])


