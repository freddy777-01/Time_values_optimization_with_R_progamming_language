library(readxl)
library(ggplot2)

morning_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R32",col_names = FALSE)))
morning_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R33",col_names = FALSE)))
morning_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R34",col_names = FALSE)))


#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(morning_AvgOrdinal,morning_AvgMNLR,morning_AvgGA),
  xvalues =c("AVG_ORDINAL","Avg_MNLR","Avg_GA")
)
tiff("morningAvgAccuracyBarChart.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "Morning",
    x="",
    y="Overall accuracy",
    fill ="Legend"
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))
dev.off()