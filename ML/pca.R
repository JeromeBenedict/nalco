a=read.csv('pca.csv')
for(i in seq(ncol(a)))
{
  a[,i]=as.numeric(a[,i])
}
b=colMeans(a)
c=data.frame()
for(i in seq(ncol(a)))
{
  for(j in seq(nrow(a)))
  {
    c[j,i]=a[j,i]-b[i]
  }
}
w=cov(c)
q=eigen(w)
q1=q$values
q2=q$vectors
q3=t(q2)
l1=seq(1,2,1)
q3=q3[l1,]
data=t(c)
fin=q3%*%data
