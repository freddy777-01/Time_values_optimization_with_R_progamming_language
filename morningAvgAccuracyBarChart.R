library(readxl)
library(ggplot2)

morning_AvgOrdinal<-round(as.numeric(read_excel("Alldata_excel.xlsx", sheet = "All data", range = "R32",col_names = FALSE,col_types = "text")),2)
morning_AvgMNLR<-round(as.numeric(read_excel("Alldata_excel.xlsx",sheet = "All data", range = "R33",col_names = FALSE,col_types = "text")),2)
morning_AvgGA<-round(as.numeric(read_excel("Alldata_excel.xlsx", range = "R34",col_names = FALSE)),2)


#max(midnight_load)
#geom_hline(yintercept = 0, color = "black", linetype = "solid") #draws the x-axis line

loadData<-data.frame(
  AccuracyAVG = c(morning_AvgOrdinal,morning_AvgMNLR,morning_AvgGA),
  xvalues =c("Avg_Ordinal","Avg_Heuristic","Avg_GA")
)
tiff("morningAvgAccuracyBarChart.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=AccuracyAVG,fill=xvalues))+geom_col(width = 0.5)+
  labs(
    title = "",
    x="",
    y="Overall accuracy",
    fill =""
  )+
  scale_y_continuous(breaks = seq(0,100,by=5))+
  coord_cartesian(ylim = c(5,100))+
  theme_minimal()+
  theme(legend.title = element_text(hjust = 0.5, margin = margin(b = 10)),
        panel.border = element_rect(color = "black", fill = NA, size = 1),
        legend.key.size = unit(0.9, "lines"),
        legend.position = c(0.85, 0.96)
  )+geom_text(aes(label = AccuracyAVG), vjust = -0.5, size = 4, color = "black")
dev.off()
# geom_text(aes(label = AccuracyAVG), vjust = -0.5, size = 4, color = "black")+
#legend.key.size = unit(0.9, "lines")
#legend.background = element_rect(color = "black", size = 0.2),