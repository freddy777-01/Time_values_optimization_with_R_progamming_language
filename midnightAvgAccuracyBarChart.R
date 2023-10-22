library(readxl)
library(ggplot2)
#library(openxlsx2)

#accuracy_Ga<-unlist(read_excel("Alldata_excel.xlsx", range = "P2:P74",col_names = FALSE))

midnight_AvgOrdinal<-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R9",col_names = FALSE, col_types = "text")),2)
midnight_AvgMNLR<-round(as.numeric(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R10",col_names = FALSE,col_types = "text")),2)
midnight_AvgGA<-round(as.numeric(read_excel("Alldata_excel.xlsx", range = "R11",col_names = FALSE,col_types = "text")),2)

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
  xvalues =c("Avg_Ordinal","Avg_Heuristic","Avg_GA")
)
tiff("midnightAvgAccuracyBarChart.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=midnightAccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "",
    x="",
    y="Overall accuracy",
    fill =""
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))+
  coord_cartesian(ylim = c(5,113))+
  theme_minimal()+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.65, 0.94),
        legend.direction = "horizontal"
  )+
  geom_text(aes(label = midnightAccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()

#+geom_text(aes(label = midnightAccuracyAVG), vjust = -0.5, size = 4, color = "black")
# legend.background = element_rect(color = "black", size = 0.2),