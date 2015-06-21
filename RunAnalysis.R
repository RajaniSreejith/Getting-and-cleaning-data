runanalysis<-function()
{
  #meging x and y data
  trainx=read.table("train/X_train.txt",fill=TRUE)
   testx<-read.table("test/X_test.txt",fill=TRUE)
  testy<-read.table("test/y_test.txt",fill=TRUE)
  trainy=read.table("train/y_train.txt",fill=TRUE)
  xdata<-rbind(testx,trainx)
 ydata<-rbind(testy,trainy)
 #combining xdata with featuree  and extracting mean ans std 
 featuredata<-read.table("features.txt",fill=TRUE)
 colnames(xdata)<-featuredata$V2
 meanstdColumn<-grep("mean|std",featuredata$V2,value=TRUE)
 xdata<-xdata[meanstdColumn]
  #combining test subject  and Y data 
 testsubject<-read.table("test//subject_test.txt")
 trainsubject<-read.table("train//subject_train.txt")
 subjectdata<-rbind(testsubject,trainsubject)
 colnames(subjectdata)<-c("Subject")
 actdata<-read.table("activity_labels.txt",fill=TRUE)
 mergesub_Ydata<-cbind(ydata,subjectdata)
  #combining subject_activity data and ydata
 
 library(plyr)
 ymerge<-join(mergesub_Ydata,actdata)
 #changing the column names of ymerge 
 colnames(ymerge)<-c("YData","Subject","Activity")
 #combining xdata nad y data
 xycombine<-cbind(xdata,ymerge) 
 head(xycombine)
 write.table(xycombine,"result.txt",row.name=FALSE)

print("completed")

              
}
