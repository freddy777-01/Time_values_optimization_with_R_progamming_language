library(readxl)
library(ggplot2)

day_load<-unlist(read_excel("Alldata_excel.xlsx", range = "A2:A74",col_names = FALSE))

num <-length(day_load)

x<-seq(1,73)
y1<-day_load
#class(y1)
#length(seq(1,73))

#group <- rep(LETTERS[1:7],times=7)        # group, one shape per group
loadData <- data.frame(
  dayload = day_load
  )
#data[,2]
tiff("dayLoadTrend.tiff", units="in", width=10, height=10, res=300)
ggplot(loadData,aes(x=seq(1,73), y=dayload),fill="red") +
  geom_line()+
  geom_point()+
  scale_y_continuous(breaks=seq(1,73,by=1))+
  labs(
    title = "",
    x="",
    y="Day Load (KWh)",
    fill ="Legend"
  )
dev.off()
