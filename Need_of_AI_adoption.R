source("Utils.R")
excelSheet <- "Need_of_AI_adoption"

checkInOut<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "C2:C39",col_names = FALSE,col_types = "text"))
library_instruction<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "D2:D39",col_names = FALSE,col_types = "text"))
search_information<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "E2:E39",col_names = FALSE,col_types = "text"))
reference_service<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "F2:F39",col_names = FALSE,col_types = "text"))
curr_awareness_service<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "G2:G39",col_names = FALSE,col_types = "text"))
bibliographic_service<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "H2:H39",col_names = FALSE,col_types = "text"))
circulation_operation<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "I2:I39",col_names = FALSE,col_types = "text"))
indexing<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "J2:J39",col_names = FALSE,col_types = "text"))
abstraction<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "K2:K39",col_names = FALSE,col_types = "text"))
information_service<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "L2:L39",col_names = FALSE,col_types = "text"))


#nrow(remove_null_values(checkInOut))
#nrow(checkInOut)

dataFrameServices<-data.frame(
  x_values =c("Check-in/Out","Library Instruction","Search information","Current awareness service","Bibliographic service","Circulation oprations","Indexing","Abstraction","Information service"),
  y_values =c(
    cal_percentage(checkInOut,nrow(remove_null_values(checkInOut))),
    cal_percentage(library_instruction,nrow(remove_null_values(library_instruction))),
    cal_percentage(search_information,nrow(remove_null_values(search_information))),
    cal_percentage(curr_awareness_service,nrow(remove_null_values(curr_awareness_service))),
    cal_percentage(bibliographic_service,nrow(remove_null_values(bibliographic_service))),
    cal_percentage(circulation_operation,nrow(remove_null_values(circulation_operation))),
    cal_percentage(indexing,nrow(remove_null_values(indexing))),
    cal_percentage(abstraction,nrow(remove_null_values(abstraction))),
    cal_percentage(information_service,nrow(remove_null_values(information_service)))
  )
)

tiff("need_of_AI_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(dataFrameServices, aes(x=x_values,y = y_values,fill=x_values)) + 
  geom_col(width = 0.5)+
  scale_y_continuous(breaks = seq(0, 100, by = 5), labels = percentage_labels,
                     limits = c(0, 100),  # Set the limits to 0 and 100
                     expand = c(0, 0)  
  )+
  labs(
    title = "",
    x="",
    y="Percentage",
    fill ="Legend"
  )+theme_minimal()+
  theme(axis.text.x = element_blank())+
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 2, color = "black")
dev.off()
