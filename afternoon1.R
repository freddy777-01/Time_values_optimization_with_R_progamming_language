library(readxl)
library(ggplot2)

afternoon_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K35:K59",col_names = FALSE))
afternoon_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L35:L59",col_names = FALSE))
afternoon_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M35:M59",col_names = FALSE))

x<-seq(1,25)
y1<-afternoon_actual
y2<-afternoon_predictedGA
y3<-afternoon_predictedMNLR
line_width <-2
#length(seq(31,47,by=0.64))
tiff("afternoon1.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(31,46.5,by=0.64),xlim = c(0,25),ylim =c(25,50),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
