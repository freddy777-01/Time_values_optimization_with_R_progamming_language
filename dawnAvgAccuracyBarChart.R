library(readxl)
library(ggplot2)
#library(openxlsx2)

#accuracy_Ga<-unlist(read_excel("Alldata_excel.xlsx", range = "P2:P74",col_names = FALSE))

#dawn_AvgOrdinal<-max(unlist(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE)))

#smp <-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE,col_types = "text")[1,1]),2)

dawn_AvgOrdinal<-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R20",col_names = FALSE,col_types = "text")[1,1]),2)
dawn_AvgMNLR<-round(as.numeric(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R21",col_names = FALSE,col_types = "text")[1,1]),2)
dawn_AvgGA<-round(as.numeric(read_excel("Alldata_excel.xlsx", range = "R22",col_names = FALSE,col_types = "text")[1,1]),2)

#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  dawntAccuracyAVG = c(dawn_AvgOrdinal,dawn_AvgMNLR,dawn_AvgGA),
  xvalues =c("Avg_Ordinal","Avg_Heuristic","Avg_GA")
)
tiff("dawnAvgAccuracyBarChart.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=dawntAccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "",
    x="",
    y="Overall accuracy",
    fill =""
  )+
  theme_minimal()+
  scale_y_continuous(breaks = seq(5,100,by=5))+
  coord_cartesian(ylim = c(5,100))+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.83, 0.96),
  )+
  geom_text(aes(label = dawntAccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()
#geom_text(aes(label = dawntAccuracyAVG), vjust = -0.5, size = 4, color = "black")
# legend.background = element_rect(color = "black", size = 0.2),