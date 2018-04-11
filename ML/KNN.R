a=read.csv(file.choose())
k=7
for(i in seq(ncol(a)))
{
  a[,i]=as.numeric(a[,i])
}
dist=matrix(0,1,nrow(a))
test=a[15,]
k1=0
for(i in seq(nrow(a)))
{
  x1=a[i,]
  e=sqrt(sum((x1-test)^2))
  e1=c(e,i)
  if(k1==0)
  {
    e2=rbind(e1)
    k1=k1+1
  }else
  {
    e2=rbind(e2,e1)
  }
}
ui=e2
new=e2[order(e2[,1]),]
w1=c()
for(i in seq(k))
{
  w=new[i,2]
  w1[i]=a[w,ncol(a)]
}
t=table(w1)
q=as.data.frame(t)
q=q[order(-q[2]),]
print(q[1,1])
