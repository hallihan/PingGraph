
p_file <- function(filename, hours, w, pings) {
library("ggplot2")
 p<-qplot(Timestamp,sent/sent*100,data=pings) + xlab("") + ylab("Pings Returned %") +
   geom_line(aes(Timestamp,received/sent*100), color="blue") +
   geom_line(aes(Timestamp,(sent-received)/sent*100), color="red") +
   scale_y_continuous(limits = c(0, 100)) +
   scale_x_datetime(limits =  c(Sys.time()-3600*hours,Sys.time()))
 png(filename, height = 900, width = w)
 print(p)
 dev.off()
}
pingdata <- read.csv(file=paste(Sys.getenv("DATADIR"),"pingdata.csv",sep=""),head=TRUE,sep=",")
pingdata$Timestamp <- as.POSIXct(pingdata$Timestamp,format="%Y-%m-%dT%H:%M")

p_file(paste(Sys.getenv("WEBDIR"),"archive/plot",as.Date(Sys.time(),tz="America/New_York")-1,".png", sep=""),24,1600,pingdata)
