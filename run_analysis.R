library(dplyr)
Temptest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=TRUE) #opens X_test file
            Xtest <- tbl_df(Temptest) # converts into a df for dplyr package
    Tempytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=TRUE)#opens Y_test file
            Ytest <- tbl_df(Tempytest) # converts into a df for dplyr package
                  colnames(Ytest)<- as.character("Activity")# asigns Acitvity as colname to Ytest  
    Tempsubjtest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=TRUE) #opens subject_test file
            subjtest <- tbl_df(Tempsubjtest) # converts into a df for dplyr package
                  colnames(subjtest)<- as.character("Subject") # asigns Subject as colname to Ytest  

Temptrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=TRUE)#opens X_train file
            Xtrain <- tbl_df(Temptrain) # converts into a df for dplyr package
    Tempytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=TRUE)#opens Y_train file
          Ytrain <- tbl_df(Tempytrain) # converts into a df for dplyr package
                  colnames(Ytrain)<- as.character("Activity")# asigns Acitvity as colname to Ytrain 
    Tempsubjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=TRUE) #opens subject_train file
          subjtrain <- tbl_df(Tempsubjtrain) # converts into a df for dplyr package
                  colnames(subjtrain)<- as.character("Subject") # asigns Subject as colname to Ytrain 

TempFeat <- read.table("./UCI HAR Dataset/features.txt") #opens features file
        names <- as.vector(TempFeat$V2) #takes out variables and asigns it to vector names
              colnames(Xtrain)<- names # asigns names to Ytrain 
              colnames(Xtest)<- names # asigns names to Ytest
      
xtotal <- rbind(Xtrain,Xtest) #rowbinds X train and test df
Ytotal <- rbind(Ytrain,Ytest) #rowbinds Y train and test df
Subjtotal <- rbind(subjtrain,subjtest) #rowbinds Subject train and test df
    total <- tbl_df(cbind(xtotal, Subjtotal,Ytotal)) # column binds X,Y and Subject

Selectmean <- cbind((total[ , grepl( "mean",names( total ) ) ])) # selects all column names with mean in it
Selectstd  <- cbind((total[ , grepl( "std",names( total ) ) ])) # selects all column names with std in it
SelectMean <- cbind((total[ , grepl( "Mean",names( total ) ) ])) # selects all column names with Mean in it
Selectmeanstd <- tbl_df(cbind(Selectmean, Selectstd, SelectMean)) # column binds mean, std and Mean columns
      Activities<- as.character(sapply(total$Activity,switch, '1' = 'walk','2'= 'walkup', '3'= 'walkdown', '4'= 'sit', '5'= 'stand', '6'='lay','undefined'=""))
              Selectact <- tbl_df(cbind(Selectmean, Selectstd, SelectMean, Activities, Subjtotal)) # column binds df with new activity names and subject

low_names<-c(tolower(names(Selectact))) # changes all column names to no capital
      mgsub <- function(pattern, replacement, x, ...) { # changes all column names to readable names
              result <- x
                  for (i in 1:length(pattern)) {
                        result <- gsub(pattern[i], replacement[i], result, ...)
                                   }
                          result }
pattern <- c("tb","tg","acc","fbody","-","gyro","freq","std","\\(","\\)","mag","\\,")
replacement <-  c("b","g","acceleration","transformedbody","","gyroscope","frequency", "standarddeviation","","","magnitude","")
newlow_names <- mgsub( pattern, replacement, low_names)
colnames(Selectact)<-newlow_names # asigns new column names to df



groupeddata <- group_by(Selectact, subject, activities) #Groups df by subject and activities
final<- groupeddata %>% summarise_each(funs (mean)) # summarizes grouped data 
head(final) #returns head final data











