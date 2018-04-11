library(imager)
im<-load.image(file.choose())
plot(im)
a=matrix(im,ncol=3)
obj<-kmeans(a,iter.max=25,64)#restricting no. of dist colours to 64
i=1:dim(a)[1]
b=matrix(nrow=dim(a)[1],ncol=dim(a)[2])
b[i,]=obj$centers[obj$cluster[i],]
compR<-matrix(b[,1],ncol=dim(im)[2],nrow=dim(im)[1])
compG<-matrix(b[,2],ncol=dim(im)[2],nrow=dim(im)[1])
compB<-matrix(b[,3],ncol=dim(im)[2],nrow=dim(im)[1])
k<-array(dim=c(dim(im)))
k[,,,1]<-compR
k[,,,2]<-compG
k[,,,3]<-compB
yo<-cimg(k)
plot(yo)
