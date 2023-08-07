library(readxl)
library(ggplot2)

dawn_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K12:K22",col_names = FALSE))
dawn_predictedGA<-unlist(read_excel("Alldata_excel.xlsx", range = "M12:M22",col_names = FALSE))
dawn_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "N12:N22",col_names = FALSE))
dawn_predictredEncoding<-unlist(read_excel("Alldata_excel.xlsx", range = "J12:J22",col_names = FALSE))

#x<-seq(1,11)
#y1<-dawn_actual
#y2<-dawn_predictedGA
#y3<-dawn_predictedMNLR
#line_width <-2

lb =c("actual","predictedGA","predictedMNLR","predicted ordinal encoding")
midnightFrame <- data.frame(
  xAxis = seq(1,11),
  actual = dawn_actual,
  predictedGA = dawn_predictedGA,
  predictedMNLR = dawn_predictedMNLR,
  predicredEncode = dawn_predictredEncoding
)
tiff("dawn1.tiff", units="in", width=10, height=10, res=300)
ggplot(midnightFrame,aes(x=xAxis))+
  geom_line(aes(y=actual,color="line1"))+geom_point(aes(y=actual,color="line1"),shape=1)+
  geom_line(aes(y=predictedGA,color="line2"))+geom_point(aes(y=predictedGA,color="line2"),shape=8)+
  geom_line(aes(y=predictedMNLR,color="line3"))+geom_point(aes(y=predictedMNLR,color="line3"),shape=0)+
  geom_line(aes(y=predicredEncode,color="line4"))+geom_point(aes(y=predicredEncode,color="line4"),shape=5)+
  labs(
    title ="Dawn Load",
    y="Predicted Load",
    x ="",
    color="Legend"
  )+scale_y_continuous(breaks=seq(10,65,by=1))+
  scale_color_manual(values = c("line1" = "green", "line2" = "red", "line3" = "black","line4"="orange"),
                     labels = lb) +
  scale_shape_manual(values = c("line1" = 16, "line2" = 8, "line3" = 0,"line4"=5),
                     labels = lb) +
  scale_linetype_manual(values = c("line1" = "solid", "line2" = "solid", "line3" = "solid","line4"="solid"),
                        labels = lb) +
  guides(color = guide_legend(override.aes = list(shape = c(16, 8, 0,5),
                                                  linetype = c("solid", "solid", "solid","solid"))))+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)))


#plot(x,seq(30,40),xlim = c(0,11),ylim =c(30,65),type="n",ylab="Predicted load",xlab = "")
#lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
#lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
#lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
#legend("topright",inset = 0.05,
#      c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
#       col = c("black","red","green"),
#       title = "Predictions",cex = 0.7,pch = c(1,1,1)
#)
dev.off()
