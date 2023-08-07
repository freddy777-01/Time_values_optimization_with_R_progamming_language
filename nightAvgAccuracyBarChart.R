library(readxl)
library(ggplot2)

night_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R72",col_names = FALSE)))
night_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R73",col_names = FALSE)))
night_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R74",col_names = FALSE)))


#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(night_AvgOrdinal,night_AvgMNLR,night_AvgGA),
  xvalues =c("AVG_ORDINAL","Avg_MNLR","Avg_GA")
)
tiff("nightAvgAccuracyBarChart.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "Night",
    x="",
    y="Overall accuracy",
    fill ="Legend"
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))
dev.off()