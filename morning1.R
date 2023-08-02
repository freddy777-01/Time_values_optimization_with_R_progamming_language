library(readxl)
library(ggplot2)

morning_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K23:K34",col_names = FALSE))
morning_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L23:L34",col_names = FALSE))
morning_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M23:M34",col_names = FALSE))

x<-seq(1,12)
y1<-morning_actual
y2<-morning_predictedGA
y3<-morning_predictedMNLR
line_width <-2
tiff("morning1.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(26,42.5,by=1.5),xlim = c(0,12),ylim =c(26,50),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
