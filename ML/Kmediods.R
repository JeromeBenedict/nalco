dat<-read.csv(file.choose())
#k<-as.numeric(readline("Enter k value : "))
med1<-dat[1,]
med2<-dat[2,]

  #take 2 mediod values
  #compute the manhattan distnace between all points and mediods
  #assign to cluster with lower cost
  #add cost to total cost
  #compare the cost with previous cost 

cluster1<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
ind1<-0
cluster2<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
ind2<-0
cost<-0
for(i in seq(nrow(dat))){
  d1<-sum(abs(dat[i,]-med1))
  d2<-sum(abs(dat[i,]-med2))
  if(d1<d2){
    ind1<-ind1+1
    for(k in seq(ncol(dat))){
      cluster1[ind1,k]<-dat[i,k]
    }
    cost<-cost+d1
  }
  else{
    ind2<-ind2+1
    for(k in seq(ncol(dat))){
      cluster2[ind2,k]<-dat[i,k]
    }
    cost<-cost+d2
  }
}
cost
#mediod1
tindex<-1
while(tindex<=ind1){
  tcluster1<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
  tind1<-0
  tcluster2<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
  tind2<-0
  tcost<-0
  tmed1<-cluster1[tindex,]
  #cat("\n mediod1 value : ",tmed1)
  tmed2<-med2
  for(i in seq(nrow(dat))){
    d1<-sum(abs(dat[i,]-tmed1))
    d2<-sum(abs(dat[i,]-tmed2))
    if(d1<d2){
      tind1<-tind1+1
      for(k in seq(ncol(dat))){
        tcluster1[tind1,k]<-dat[i,k]
      }
      tcost<-tcost+d1
    }
    else{
      tind2<-tind2+1
      for(k in seq(ncol(dat))){
        tcluster2[tind2,k]<-dat[i,k]
      }
      tcost<-tcost+d2
    }
  }
  #cat("\t tcost : ",tcost)
  if(tcost<cost){
    cluster1<-tcluster1
    cluster2<-tcluster2
    ind1<-tind1
    ind2<-tind2
    cost<-tcost
    med1<-tmed1
    med2<-tmed2
    tindex<-1
    #cat("\t tcost : ",tcost)
  }
  else
    tindex<-tindex+1
}
#mediod2
tindex<-1
while(tindex<=ind1){
  tcluster1<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
  tind1<-0
  tcluster2<-matrix(data=0,nrow=nrow(dat),ncol=ncol(dat))
  tind2<-0
  tcost<-0
  tmed1<-med1
  #cat("\n mediod value : ",tmed1)
  tmed2<-cluster2[tindex,]
  for(i in seq(nrow(dat))){
    d1<-sum(abs(dat[i,]-tmed1))
    d2<-sum(abs(dat[i,]-tmed2))
    if(d1<d2){
      tind1<-tind1+1
      for(k in seq(ncol(dat))){
        tcluster1[tind1,k]<-dat[i,k]
      }
      tcost<-tcost+d1
    }
    else{
      tind2<-tind2+1
      for(k in seq(ncol(dat))){
        tcluster2[tind2,k]<-dat[i,k]
      }
      tcost<-tcost+d2
    }
  }
  #cat("\t tcost : ",tcost)
  if(tcost<cost){
    cluster1<-tcluster1
    cluster2<-tcluster2
    ind1<-tind1
    ind2<-tind2
    cost<-tcost
    med1<-tmed1
    med2<-tmed2
    tindex<-1
  }
  else
    tindex<-tindex+1
}
cost
cat('\nCluster 1 : \n')
print(cluster1[1:ind1,])
cat('\nCluster 2 : \n')
print(cluster2[1:ind2,])
