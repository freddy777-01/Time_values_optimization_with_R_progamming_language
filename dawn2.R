library(readxl)
library(ggplot2)

dawn_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K81:K93",col_names = FALSE))
dawn_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L81:L93",col_names = FALSE))
dawn_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M81:M93",col_names = FALSE))

x<-seq(1,13)
y1<-dawn_actual
y2<-dawn_predictedGA
y3<-dawn_predictedMNLR
line_width <-2

length(seq(32,42,by=0.77))

tiff("dawn2.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(32,42,by=0.77),xlim = c(1,14),ylim =c(30,45),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
#axis(side=2, at=seq(32,42, by=0.77))
legend("topright",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
