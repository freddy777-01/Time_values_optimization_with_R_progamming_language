library(readxl)
library(ggplot2)

dawn_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K12:K22",col_names = FALSE))
dawn_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L12:L22",col_names = FALSE))
dawn_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M12:M22",col_names = FALSE))

x<-seq(1,11)
y1<-dawn_actual
y2<-dawn_predictedGA
y3<-dawn_predictedMNLR
line_width <-2
tiff("dawn1.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(30,40),xlim = c(0,11),ylim =c(30,65),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
