library(readxl)
library(ggplot2)

midnight_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K75:K80",col_names = FALSE))
midnight_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L75:L80",col_names = FALSE))
midnight_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M75:M80",col_names = FALSE))

x<-seq(1,6)
y1<-midnight_actual
y2<-midnight_predictedGA
y3<-midnight_predictedMNLR
line_width <-2

#length(seq(36,54,by=3.1))

tiff("midnight2.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(36,54,by=3.1),xlim = c(0,6),ylim =c(30,55),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
