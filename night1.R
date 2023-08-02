library(readxl)
library(ggplot2)

night_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K61:K74",col_names = FALSE))
night_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L61:L74",col_names = FALSE))
night_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M61:M74",col_names = FALSE))

x<-seq(1,14)
y1<-night_actual
y2<-night_predictedGA
y3<-night_predictedMNLR
line_width <-2

#length(seq(45,66,by=1.6))

tiff("night1.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(45,66,by=1.6),xlim = c(0,15),ylim =c(40,70),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
