#read the labels
features<-read.table("./data/UCIHarDataset/features.txt")
activities<-read.table("./data/UCIHarDataset/activity_labels.txt")

#read all them tables for the training set
X_train<-read.table("./data/UCIHarDataset/train/X_train.txt")
Y_train<-read.table("./data/UCIHarDataset/train/Y_train.txt")
subject_train<-read.table("./data/UCIHarDataset/train/subject_train.txt")

#name the columns
colnames(X_train)<-features$V2
colnames(Y_train)<-"activity"
colnames(subject_train)<-"subject"
#add in the subject
trainSet<-cbind(X_train,subject_train)
#add in the Y_train
trainSet<-cbind(trainSet,Y_train)

#TEST SET
#read all them tables for the test set
X_test<-read.table("./data/UCIHarDataset/test/X_test.txt")
Y_test<-read.table("./data/UCIHarDataset/test/Y_test.txt")
subject_test<-read.table("./data/UCIHarDataset/test/subject_test.txt")
#name the columns
colnames(X_test)<-features$V2
colnames(Y_test)<-"activity"
colnames(subject_test)<-"subject"

#add in the subject
testSet<-cbind(X_test,subject_test)
#add in the Y_test
testSet<-cbind(testSet,Y_test)

#build the full set from Train and Test
fullSet<-rbind(trainSet,testSet)

#only keep the columns I want (mean, std, subject, activity)
editedSet<-fullSet[,grepl("*.mean\\(\\)|*.std\\(\\)|activity|subject",names(fullSet))]

#replace the activity
editedSet$activity<-factor(editedSet$activity,levels=activities$V1,labels=activities$V2)

#melt the editedSet by subject and activity
secondSet<-melt(editedSet,id=c("subject","activity"))
tidyData<-dcast(secondSet, subject + activity ~ variable, fun.aggregate=mean)

#write the tidyData out
write.table(tidyData,"./data/UCIHarDataset/courseproject.txt",sep="\t")
