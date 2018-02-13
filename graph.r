p_file <- function(filename, hours, w, pings) {
library("ggplot2")
 p<-qplot(Timestamp,sent/sent*100,data=pings) + xlab("") + ylab("Pings Returned %") +
   geom_line(aes(Timestamp,received/sent*100), color="blue") +
   geom_line(aes(Timestamp,(sent-received)/sent*100), color="red") +
   scale_y_continuous(limits = c(0, 100)) +
   scale_x_datetime(limits =  c(Sys.time()-3600*hours,Sys.time()))
 png(filename, height = 400, width = w)
 print(p)
 dev.off()
}

p_filev <- function(filename, hours, w, pings) {
library("ggplot2")
 p<-qplot(Timestamp,sent/sent*100,data=pings) + xlab("") + ylab("Pings Returned %") +
   geom_line(aes(Timestamp,received/sent*100), color="blue") +
   geom_line(aes(Timestamp,(sent-received)/sent*100), color="red") +
   scale_y_continuous(limits = c(0, 100)) +
   scale_x_datetime(limits =  c(Sys.time()-3600*hours,Sys.time())) +
   coord_flip()
 png(filename, height = w, width = 500)
 print(p)
 dev.off()
}

pingdata <- read.csv(file=paste(Sys.getenv("DATADIR"),"pingdata.csv",sep=""),head=TRUE,sep=",")
pingdata$Timestamp <- as.POSIXct(pingdata$Timestamp,format="%Y-%m-%dT%H:%M")

p_file(paste(Sys.getenv("WEBDIR"),"ping_plot1.png", sep=""),1,800,pingdata)
p_file(paste(Sys.getenv("WEBDIR"),"ping_plot4.png", sep=""),4,500,pingdata)
p_file(paste(Sys.getenv("WEBDIR"),"ping_plot12.png", sep=""),12,500,pingdata)
p_file(paste(Sys.getenv("WEBDIR"),"ping_plot24.png", sep=""),24,800,pingdata)
p_filev(paste(Sys.getenv("WEBDIR"),"ping_plot72.png", sep=""),72,1600,pingdata)