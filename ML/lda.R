a=read.csv('lda.csv')
b=length(unique(a[,ncol(a)]))
c=unique(a[,ncol(a)])
u=list()
w=list()
u1=seq(1,ncol(a)-1,1)
a1=a[,u1]
for(i in seq(b))
{
  f=which(a[,ncol(a)]==c[i])
  u[[i]]=a[f,u1]
  w[[i]]=colMeans(u[[i]])
  w[[i]]=as.matrix(w[[i]])
}
sw=matrix(0,ncol(a)-1,ncol(a)-1)
for(i in seq(b))
{
  for(j in seq(nrow(u[[i]])))
  {
    x=u[[i]][j,]
    x=t(x)
    s=(x-w[[i]])%*%t(x-w[[i]])
    sw=sw+s
  }
}
t1=colMeans(a)
t1=t(t1[u1])
t1=t(t1)
sb=matrix(0,ncol(a)-1,ncol(a)-1)
for(i in seq(b))
{
  s=(w[[i]]-t1)%*%t((w[[i]]-t1))
  s=nrow(u[[i]])*s
  sb=sb+s
}
f=solve(sw)%*%sb
q=eigen(f)
q1=q$values
q2=q$vectors
q3=t(q2)
k=seq(1,2,1)
q3=q3[k,]
data=t(a1)
fin=q3%*%data