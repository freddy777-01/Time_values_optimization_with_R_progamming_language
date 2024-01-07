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

## drawing grouped bar graph
familarity_percentage_yes<- cal_percentage(familiarity_dataFrame,count_any_values(familiarity_dataFrame,"YES"))
familarity_percentage_no<-cal_percentage(familiarity_dataFrame,count_any_values(familiarity_dataFrame,"NO"))
familarity_percentage_null<-cal_percentage(familiarity_dataFrame,count_any_values(familiarity_dataFrame,"<NA>"))

known_tools_percentage_yes<- cal_percentage(known_tools_dataFrame,count_any_values(known_tools_dataFrame,"YES"))
known_tools_percentage_no<-cal_percentage(known_tools_dataFrame,count_any_values(known_tools_dataFrame,"NO"))
known_tools_percentage_null<-cal_percentage(known_tools_dataFrame,count_any_values(known_tools_dataFrame,"<NA>"))

benefits_percentage_yes<- cal_percentage(benefits_dataFrame,count_any_values(benefits_dataFrame,"YES"))
benefits_percentage_no<-cal_percentage(benefits_dataFrame,count_any_values(benefits_dataFrame,"NO"))
benefits_percentage_null<-cal_percentage(benefits_dataFrame,count_any_values(benefits_dataFrame,"<NA>"))

#c("Yes","No","<Na>")
#c("familarity","known tools","benefits")
df<-data.frame(
  x_lables =  c("benefits","known tools","familarity"),
  legend_lables =  c("Yes","No","Na"),
  grouped_values = c("familarity","known tools","benefits"),
  x_values= rep(c("Yes","No","Na"),each=3),
  y_values=c(familarity_percentage_yes,familarity_percentage_no,familarity_percentage_null+3,known_tools_percentage_yes,
      known_tools_percentage_no,known_tools_percentage_null,benefits_percentage_yes,benefits_percentage_no+1,
      benefits_percentage_null
      )
)

tiff("awareness_groupedBarChat.tiff", units="in", width=5, height=5, res=300)
ggplot(df, aes(fill=legend_lables, y=y_values, x=x_values)) + 
  geom_bar(position=position_dodge2(width = 0.9,preserve = "single"), stat="identity")+
  scale_y_continuous(breaks = seq(0, 100, by = 5), labels = percentage_labels,
                     limits = c(0, 100),  # Set the limits to 0 and 100
                     expand = c(0, 0)  
  )+
  scale_x_discrete(labels = df$x_lables) + 
  labs(
    title = "",
    x="",
    y="Percentage",
    fill ="Legend"
  )+theme_minimal()+
  geom_text(aes(label = paste0(y_values, "%")),
            position = position_dodge2(width = 0.9,preserve = "single"),
            vjust = -0.5, size = 4, color = "black")
dev.off()
##End of grouped bar graph


#tiff("awareness_barChat.tiff", units="in", width=5, height=5, res=300)
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
#dev.off()



## testing
tg <- data.frame(team=rep(c('A', 'B', 'C'), each=3),
                 position=rep(c('Guard', 'Forward', 'Center'), times=3),
                 points=c(14, 8, 8, 16, 3, 7, 17, 22, 26))

ggplot(tg, aes(fill=position, y=points, x=team)) + 
  geom_bar(position='dodge', stat='identity')
