library(readxl)
library(ggplot2)

morning_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K94:K110",col_names = FALSE))
morning_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "L94:L110",col_names = FALSE))
morning_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "M94:M110",col_names = FALSE))

#length(morning_actual)

x<-seq(1,17)
y1<-morning_actual
y2<-morning_predictedGA
y3<-morning_predictedMNLR
line_width <-2


#length(seq(23,38,by=0.882353))

tiff("morning2.tiff", units="in", width=5, height=5, res=300)
plot(x,seq(23,38,by=0.882353),xlim = c(1,20),ylim =c(20,40),type="n",ylab="Predicted load",xlab = "")
lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
#axis(side=2, at=seq(32,42, by=0.77))
legend("topleft",inset = 0.05,
       c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
       col = c("black","red","green"),
       title = "Predictions",cex = 0.7,pch = c(1,1,1)
)
dev.off()
