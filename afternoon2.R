library(readxl)
library(ggplot2)

afternoon_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K117:K131",col_names = FALSE))
afternoon_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L117:L131",col_names = FALSE))
afternoon_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M117:M131",col_names = FALSE))

#length(afternoon_actual)

x<-seq(1,15)
y1<-afternoon_actual
y2<-afternoon_actual
y3<-afternoon_actual
line_width <-2

#0.102380952
#length(seq(20,45,by=1.666666667))
#,xlim = c(1,20),ylim =c(20,45)
tiff("afternoon2.tiff", units="in", width=10, height=10, res=300)
plot(x,seq(20,45,by=1.666666667),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
axis(side=2, at=seq(20,45, by=1))
axis(side = 1,at=c(1:20))
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
