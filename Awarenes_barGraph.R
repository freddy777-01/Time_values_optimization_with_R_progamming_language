source("Utils.R")

excelSheet <- "Awareness_of_AI_technology"

familiarity_dataFrame<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "C2:C39",col_names = FALSE,col_types = "text"))
colnames(familiarity_dataFrame)<-("bool")
known_tools_dataFrame<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "D2:D39",col_names = FALSE,col_types = "text"))
colnames(known_tools_dataFrame)<-("bool")

benefits_dataFrame<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "F2:F39",col_names = FALSE,col_types = "text"))
colnames(benefits_dataFrame)<-("bool")



#nrow(familiarity)
percentages<-data.frame(
  y_values = c(
    cal_percentage(familiarity_dataFrame,count_any_values(familiarity_dataFrame,"YES")),
               cal_percentage(known_tools_dataFrame,count_any_values(known_tools_dataFrame,"YES")),
               cal_percentage(benefits_dataFrame,count_any_values(benefits_dataFrame,"YES"))
               ),
  x_values = c("familarity","known tools","benefits")
)


tiff("awareness_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(percentages, aes(x=x_values,y = y_values,fill=x_values)) + 
  geom_col(width = 0.5)+
  scale_y_continuous(breaks = seq(0, 100, by = 5), labels = percentage_labels,
                     limits = c(0, 100),  # Set the limits to 0 and 100
                     expand = c(0, 0)  
    )+
  labs(
    title = "",
    x="",
    y="Frequency",
    fill ="Legend"
  )+theme_minimal()+
  theme(axis.text.x = element_blank())+
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 4, color = "black")
dev.off()
