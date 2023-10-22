library(readxl)
library(ggplot2)


#midnight_actual<-unlist(read_excel("Alldata_excel.xlsx", range = "K2:K11",col_names = FALSE))

unfiltered_actual<-read_excel("Alldata_excel.xlsx", range = "K2:K11",col_names = FALSE, col_types = "text")
midnight_actual <- as.data.frame(lapply(unfiltered_actual,function(d) round(as.numeric(d),2)))

unfiltered_predictedGA <-read_excel("Alldata_excel.xlsx", range = "M2:M11",col_names = FALSE, col_types = "text")
midnight_predictedGA<-as.data.frame(lapply(unfiltered_predictedGA,function(d) round(as.numeric(d),2)))
#midnight_predictedGA[,1]
#midnight_predictedMNLR<-unlist(read_excel("Alldata_excel.xlsx", range = "N2:N11",col_names = FALSE))
#midnight_predictredEncoding<-unlist(read_excel("Alldata_excel.xlsx", range = "J2:J11",col_names = FALSE))

#x<-seq(1,10)
#y1<-midnight_actual
#y2<-midnight_predictedGA
#y3<-midnight_predictedMNLR
line_width <-2
lb =c("actual","predictedGA","predictedMNLR","predicted ordinal encoding")
midnightDataFrame <- data.frame(
  xAxis = seq(1,10,1),
  actual = midnight_actual[,1],
  predictedGA = midnight_predictedGA[,1]
)

tiff("midnight1_PredictedGA.tiff", units="in", width=5, height=5, res=300)
ggplot(midnightDataFrame,aes(x=xAxis))+
  geom_line(aes(y=actual,color="line1"))+geom_point(aes(y=actual,color="line1"),shape=1)+
  geom_line(aes(y=predictedGA,color="line2"))+geom_point(aes(y=predictedGA,color="line2"),shape=8)+
  labs(
    title ="",
    y="Predicted load",
    x ="Validated data points",
    color="Legend"
  )+scale_y_continuous(breaks=seq(2,60,by=2))+
  scale_x_continuous(breaks = seq(1,10,by=1))+
  coord_cartesian(ylim = c(2,60),xlim = c(1,10))+
  scale_color_manual(values = c("line1" = "black", "line2" = "red"),
                     labels = lb) +
  scale_shape_manual(values = c("line1" = 16, "line2" = 8),
                     labels = lb) +
  scale_linetype_manual(values = c("line1" = "solid", "line2" = "solid"),
                        labels = lb) +
  guides(color = guide_legend(override.aes = list(shape = c(16, 8),
                                                  linetype = c("solid", "solid"))))+
  theme_minimal()+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.background = element_rect(color = "black", size = 0.2),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.85, 0.87)
        )

# plot(x,seq(42,60,2),xlim = c(0,10),ylim =c(30,65),type="n",ylab="Predicted load",xlab = "")
# lines(x,y1,type="o",col="black",lty=1,lwd=line_width)
# lines(x,y2,type="o",col="red",lty=3,lwd=line_width)
# lines(x,y3,type="o",col="green",lty=5,lwd=line_width)
# legend("topright",inset = 0.05,
#        c("actual","predicted_GA","predicted_Heuristic"),lty = c(1,2,5),
#        col = c("black","red","green"),
#        title = "Predictions",cex = 0.7,pch = c(1,1,1)
#        )
dev.off()

