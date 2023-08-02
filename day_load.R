library(readxl)
library(ggplot2)

day_load<-unlist(read_excel("Alldata_excel.xlsx", range = "A2:A74",col_names = FALSE))
midnight_load<-unlist(read_excel("Alldata_excel.xlsx", range = "A2:A11",col_names = FALSE))

num <-length(day_load)

x<-seq(1,73)
y1<-day_load
#class(y1)
#length(seq(1,73))

#group <- rep(LETTERS[1:7],times=7)        # group, one shape per group
data <- data.frame(num,y1)
#data[,2]
tiff("dayLoadTrend.tiff", units="in", width=10, height=10, res=300)
ggplot(data) + geom_histogram(aes(x=seq(1,73), y=seq(1,73)),fill="red")
dev.off()
