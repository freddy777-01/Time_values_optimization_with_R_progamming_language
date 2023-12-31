library(readxl)
library(ggplot2)

day_load<-unlist(read_excel("Alldata_excel.xlsx", range = "A2:A74",col_names = FALSE))
midnight_load1<-max(as.data.frame(lapply(read_excel("Alldata_excel.xlsx", range = "A2:A11",col_names = FALSE,col_types = "text"),function(d) round(as.numeric(d),2))))
dawn_load1<-max(as.data.frame(lapply(read_excel("Alldata_excel.xlsx", range = "A12:A22",col_names = FALSE,col_types = "text"),function(d) round(as.numeric(d),2))))
morning_load1<-max(as.data.frame(lapply(read_excel("Alldata_excel.xlsx", range = "A23:A34",col_names = FALSE,col_types = "text"),function(d) round(as.numeric(d),2))))
afternoon_load1<-max(as.data.frame(lapply(read_excel("Alldata_excel.xlsx", range = "A35:A60",col_names = FALSE,col_types = "text"),function(d) round(as.numeric(d),2))))
night_load1<-max(as.data.frame(lapply(read_excel("Alldata_excel.xlsx", range = "A61:A74",col_names = FALSE,col_types = "text"),function(d) round(as.numeric(d),2))))

#max(midnight_load)
#xValues<-c("midnight","dawn","morning","afternoon","night")

loadData<-data.frame(
  dayload = c(midnight_load1,dawn_load1,morning_load1,afternoon_load1,night_load1),
  xvalues =c("midnight","dawn","morning","afternoon","night")
)
tiff("dayLoad1.tiff", units="in", width=5, height=5, res=300)
ggplot(loadData,aes(x=xvalues,y=dayload,fill=xvalues))+geom_col()+
  labs(
    title = "",
    x="",
    y="Day Load (KWh)",
    fill ="Legend"
  )+geom_text(aes(label = dayload), vjust = -0.5, size = 4, color = "black")
dev.off()