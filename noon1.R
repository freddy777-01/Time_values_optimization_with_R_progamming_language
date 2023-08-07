library(readxl)
library(ggplot2)

noon_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K111:K116",col_names = FALSE))
noon_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L111:L116",col_names = FALSE))
noon_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M111:M116",col_names = FALSE))

length(noon_actual)

x<-seq(1,6)
y1<-noon_actual
y2<-noon_predictedGA
y3<-noon_predictedMNLR
line_width <-2


length(seq(27,40,by=2.5))

tiff("noon1.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(27,40,by=2.5),xlim = c(1,7),ylim =c(25,45),type="n",ylab="Predicted load",xlab = "")
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
