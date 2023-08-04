library(readxl)
library(ggplot2)

afternoon_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R56",col_names = FALSE)))
afternoon_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R57",col_names = FALSE)))
afternoon_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R58",col_names = FALSE)))


#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(afternoon_AvgOrdinal,afternoon_AvgMNLR,afternoon_AvgGA),
  xvalues =c("AVG_ORDINAL","Avg_MNLR","Avg_GA")
)
tiff("afternoonAvgAccuracyBarChart.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "Afternoon",
    x="",
    y="Overall accuracy",
    fill ="Legend"
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))
dev.off()