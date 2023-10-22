source("Utils.R")

excelSheet <- "AI_adoption_in_library"

### CREATING A PIE CHAT
adoption<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "C2:C39",col_names = FALSE,col_types = "text"))

pieChatDataFrame <-data.frame(
  labels=c("adopted","not adopted"),
  x_values =c(cal_percentage(adoption,count_any_values(adoption,"YES")),cal_percentage(adoption,count_inverse_values(adoption,"YES")))
)



 tiff("adoption_pieChat.tiff", units="in", width=5, height=5, res=300)
 pie3D(dataFrame$x_values, mar = rep(1.75, 4),
       col = hcl.colors(length(pieChatDataFrame$x_values), "Spectral"),
       labels = paste0(dataFrame$x_values,"%"))
 
 legend(
   x =-0.6,y=-0.4,
   legend = pieChatDataFrame$labels,
   fill = hcl.colors(length(pieChatDataFrame$labels), "Spectral"),
   title = "",
   cex = 0.8,
   horiz = TRUE,
   border = NA,
   bg = "transparent",
   bty = "n"
 )
 dev.off()

### CREATING A BAR CHAT

aquisition<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "D2:D39",col_names = FALSE,col_types = "text"))
verification<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "E2:E39",col_names = FALSE,col_types = "text"))
registration<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "F2:F39",col_names = FALSE,col_types = "text"))
stamping<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "G2:G39",col_names = FALSE,col_types = "text"))
cataloguing<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "H2:H39",col_names = FALSE,col_types = "text"))
classificatin<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "I2:I39",col_names = FALSE,col_types = "text"))
labeling<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "J2:J39",col_names = FALSE,col_types = "text"))
rfid<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "K2:K39",col_names = FALSE,col_types = "text"))
pANDc<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "L2:L39",col_names = FALSE,col_types = "text"))
barcoding<-as.data.frame(read_excel(excelFile, sheet = excelSheet, range = "M2:M39",col_names = FALSE,col_types = "text"))



barChatDataFrame<-data.frame(
  x_values = c("Aquisition","Verification","Registration","Stamping","Cataloguing","Classification","Labeling","RFID","Preservation & conservation","Barcoding"),
  y_values = c(
    cal_percentage(aquisition,count_any_values(aquisition,"YES")),
    cal_percentage(verification,count_any_values(verification,"YES")),
    cal_percentage(registration,count_any_values(registration,"YES")),
    cal_percentage(stamping,count_any_values(stamping,"YES")),
    cal_percentage(cataloguing,count_any_values(cataloguing,"YES")),
    cal_percentage(classificatin,count_any_values(classificatin,"YES")),
    cal_percentage(labeling,count_any_values(labeling,"YES")),
    cal_percentage(rfid,count_any_values(rfid,"YES")),
    cal_percentage(pANDc,count_any_values(pANDc,"YES")),
    cal_percentage(barcoding,count_any_values(barcoding,"YES"))
  )
)

tiff("adoption_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(barChatDataFrame, aes(x=x_values,y = y_values,fill=x_values)) + 
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
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 3, color = "black")
dev.off()
