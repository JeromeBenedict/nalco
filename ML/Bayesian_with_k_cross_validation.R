a=read.csv("Test1.csv")
a=na.omit(a)
n=nrow(a)
b=c(1:n)
k=10
l=as.integer(n/k)
m=n%%k
h=list()
for(i in seq(k))
{
  if(i!=k)
  {
    v=sample(b,l,replace=FALSE)
    h[[i]]=a[v,]
    b=setdiff(b,v)
  }else
  {
    v=sample(b,l+m,replace=FALSE)
    h[[i]]=a[v,]
    b=setdiff(b,v)
  }
}
acc=c()
for (i in seq(k))
{
  u=0
  for(j in seq(k))
  {
    if(i!=j)
    {
     if(u==0)
     {
       r=rbind(h[[j]])
       u=u+1
     }
      r=rbind(h[[j]],r)
    }
  }
  yu=h[[i]]
  n=ncol(r)
  b=list()
  for(ss in seq(n-1))
  {
    m1=length(unique(r[,ss]))
    c=matrix(NA,2,m1)
    b[[ss]]=c
  }
  m=list()
  f=length(which(r[,n]==2))
  f1=length(which(r[,n]==4))
  for(ss in seq(n-1))
  {
    m[[ss]]=unique(r[,ss])
    u=length(m[[ss]])
    for(js in seq(u))
    {
      q=length(which(a[,ss]==m[[ss]][js] & r[,n]==2))
      b[[ss]][1,js]=q/f
      q1=length(which(a[,ss]==m[[ss]][js] & r[,n]==4))
      b[[ss]][2,js]=q1/f1
    }
  }
  print(b)
  print('******************************************************************************************')
  yc=c()
  for(jj in seq(nrow(yu)))
  {
    hi=1
    hi1=1
    g=yu[jj,1:(n-1)]
    for(ij in 1:length(g))
    {
      s=which(g[1,ij]==m[[ij]])
      hi=hi*b[[ij]][1,s]
      hi1=hi1*b[[ij]][2,s]
    }
    z1=hi/(hi1+hi)
    z2=hi1/(hi1+hi)
    if(z1>=z2)
    {
      yc[jj]=2
    }else
    {
      yc[jj]=4
    }
  }
  po=0
  for(ii in seq(length(yc)))
  {
    if(yc[ii]==yu[ii,n])
    {
      po=po+1
    }
  }
  acc[i]=po/nrow(yu)
  
}
mean(acc)