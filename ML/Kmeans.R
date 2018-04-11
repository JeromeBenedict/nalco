data=read.csv("Kmeans.csv",header=FALSE)
data[data=='?']=NA
data=na.omit(data)
for(i in seq(ncol(data)))
{
  data[,i]=as.numeric(as.character(data[,i]))
}
a=data
k=2
b=c(1:nrow(a))
e=sample(b,k,replace=FALSE)
u=list()
for(i in seq(k))
{
  u[[i]]=a[e[i],]
}
e1=0
e2=1
while(e2==1)
{
  u1=list()
  u1=u
  iu=list()
  ki=c()
  for(i in seq(k))
  {
    ki[i]=0
  }
  for(i in seq(nrow(a)))
  {
    w=a[i,]
    g=c()
    for(j in seq(k))
    {
      w1=u[[j]]
      g[j]=sqrt(sum((w - w1) ^ 2))
    }
    gt=which(g==min(g))
    if(ki[gt]==0)
    {
      iu[[gt]]=rbind(w)
      ki[gt]=ki[gt]+1
    }else
    {
      iu[[gt]]=rbind(iu[[gt]],w)
    }
  }
  for(i in seq(k))
  {
    u[[i]]=colMeans(iu[[i]])
  }
  gty=TRUE
  for(i in seq(k))
  {
    if(all(u[[i]]==u1[[i]]))
       {
         gty=TRUE
       }else
       {
         gty=FALSE
       }
  }
  
  if(gty)
  {
    e2=0
  }
  
}

