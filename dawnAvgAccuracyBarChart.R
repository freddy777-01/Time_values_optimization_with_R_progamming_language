library(readxl)
library(ggplot2)
#library(openxlsx2)

accuracy_Ga<-unlist(read_excel("Alldata_excel.xlsx", range = "P2:P74",col_names = FALSE))

dawn_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE)))
dawn_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R21",col_names = FALSE)))
dawn_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R22",col_names = FALSE)))

#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  dawntAccuracyAVG = c(dawn_AvgOrdinal,dawn_AvgMNLR,dawn_AvgGA),
  xvalues =c("AVG_ORDINAL","Avg_MNLR","Avg_GA")
)
tiff("dawnAvgAccuracyBarChart.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=xvalues,y=dawntAccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "Dawn",
    x="",
    y="Overall accuracy",
    fill ="Legend"
  )
dev.off()