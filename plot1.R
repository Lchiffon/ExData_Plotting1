setwd("C:/Users/Administrator/Desktop/exdata_data_household_power_consumption")
read.table("household_power_consumption.txt",skip=66637,nrows= 2880,sep=";")->data
spl<-function(x){
  x<-as.character(x)
  strsplit(x,"/")->y
  paste0("0",y[[1]][1],"/","0",y[[1]][2],"/",y[[1]][3])
}
time=rep(0,2880)
for (i in 1:length(data$V1)){
  spl(data$V1[i])->time[i]
}
time<-paste0(time,"/",data$V2)
strptime(time,"0%d/0%m/%Y/%H:%M:%S")->x
####compute the datatime callede x


###plotting 1
png(filename = "plot1.png",
    width = 480, height = 480)
hist(data$V3,col="red",xlab="Global Active Power(kilowatts)",
     main="GLobal Active Power")
dev.off()
