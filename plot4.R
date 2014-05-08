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


###plotting 4
png(filename = "plot4.png",
    width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,2,1))
###4-1
plot(x,data$V3,ylab="Global Active Power",
     type="l",xlab="")

###4-2

plot(x,data$V5,ylab="Voltage",
     type="l",xlab="datatime")

###4-3
plot(x,data$V7,ylab="Energy sub metering",
     type="l",xlab="")
lines(x,data$V8,col="red")
lines(x,data$V9,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       yjust=1,bty="n")

###4-4

plot(x,data$V4,ylab="Global_reactive_power",
     type="l",xlab="datatime")

dev.off()
