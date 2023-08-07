library(readxl)
library(ggplot2)
#library(openxlsx2)

accuracy_Ga<-unlist(read_excel("Alldata_excel.xlsx", range = "P2:P74",col_names = FALSE))

midnight_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R9",col_names = FALSE)))
midnight_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R10",col_names = FALSE)))
midnight_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R11",col_names = FALSE)))

#dawn_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE)))
#dawn_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R21",col_names = FALSE)))
#dawn_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R22",col_names = FALSE)))

#morning_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE)))
#dawn_AvgMNLR<-max(unlist(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R21",col_names = FALSE)))
#dawn_AvgGA<-max(unlist(read_excel("Alldata_excel.xlsx", range = "R22",col_names = FALSE)))



maxAccuracyGa<-c(midnight_accGa,dawn_accGa,morning_accGa,afternoon_accGa,night_accGa)

#max(midnight_load)
#xValues<-c("midnight","dawn","morning","afternoon","night")

loadData<-data.frame(
  midnightAccuracyAVG = c(midnight_AvgOrdinal,midnight_AvgMNLR,midnight_AvgGA),
  xvalues =c("AVG_ORDINAL","Avg_MNLR","Avg_GA")
)
tiff("midnightAvgAccuracyBarChart.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=xvalues,y=midnightAccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "Midnight",
    x="",
    y="Overall accuracy",
    fill ="Legend"
  )+geom_text(aes(label = midnightAccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()