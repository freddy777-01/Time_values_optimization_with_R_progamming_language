source("Utils.R")

excelSheet <- "Prospects_of_AI_in_library"

### PLANS FOR ADOPTION
plans_of_adoption<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "C2:C39",col_names = FALSE,col_types = "text"))
# count_inverse_values(plans_of_adoption,"YES")

adoptionDataFrame<-data.frame(
  x_values = c("Have plans","Don't have plans"),
  y_values = c(
    cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"YES")),
    cal_percentage(plans_of_adoption,count_inverse_values(plans_of_adoption,"YES"))
  )
)

tiff("prospcets_Plan_for_AI_pieChat.tiff", units="in", width=5, height=5, res=300)
pie3D(adoptionDataFrame$y_values, mar = rep(1.75, 4),
      col = hcl.colors(length(adoptionDataFrame$x_values), "Spectral"),
      labels = paste0(adoptionDataFrame$y_values,"%"))

legend(
  x =-0.6,y=-0.5,
  legend = adoptionDataFrame$x_values,
  fill = hcl.colors(length(adoptionDataFrame$x_values), "Spectral"),
  title = "",
  cex = 0.8,
  horiz = TRUE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
dev.off()

### INITIATION

initiatives<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "D2:D39",col_names = FALSE,col_types = "text"))
sum(initiatives$...1 != "YES",na.rm = TRUE)

initiativeDataFrame <- data.frame(
  x_values =c("Initiated","Not Initiated"),
  y_values = c(
    cal_percentage(initiatives,count_any_values(initiatives,"YES")),
    cal_percentage(initiatives,count_inverse_values(initiatives,"YES"))
  )
)

tiff("prospcets_Initiation_for_AI_pieChat.tiff", units="in", width=5, height=5, res=300)
pie3D(initiativeDataFrame$y_values, mar = rep(1.75, 4),
      col = hcl.colors(length(initiativeDataFrame$x_values), "Spectral"),
      labels = paste0(initiativeDataFrame$y_values,"%"))

legend(
  x =-0.5,y=-0.4,
  legend = initiativeDataFrame$x_values,
  fill = hcl.colors(length(initiativeDataFrame$x_values), "Spectral"),
  title = "",
  cex = 0.8,
  horiz = TRUE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
dev.off()

#Gouped bar chart
adoptionDataFrame<-data.frame(
  x_values = c("Have plans","Don't have plans"),
  y_values = c(
    cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"YES")),
    cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"NO")),
    cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"<NA>"))
  )
)
initiativeDataFrame <- data.frame(
  x_values =c("Initiated","Not Initiated"),
  y_values = c(
    cal_percentage(initiatives,count_any_values(initiatives,"YES")),
    cal_percentage(initiatives,count_any_values(initiatives,"NO")),
    cal_percentage(initiatives,count_any_values(initiatives,"<NA>"))+3,
  )
)
plans_of_adoption_Yes<-cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"YES"))
plans_of_adoption_No<-cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"NO"))
plans_of_adoption_Na<-cal_percentage(plans_of_adoption,count_any_values(plans_of_adoption,"<NA>"))

initiatives_Yes<-cal_percentage(initiatives,count_any_values(initiatives,"YES"))
initiatives_No<-cal_percentage(initiatives,count_any_values(initiatives,"NO"))
initiatives_Na<-cal_percentage(initiatives,count_any_values(initiatives,"<NA>"))+3


#Adoptation
adoptation_df<-data.frame(
  x_values =  c("Have plans","Dont have plans","NA"),
  y_values=c(
    plans_of_adoption_Yes,
    plans_of_adoption_No,
    plans_of_adoption_Na
  )
)

tiff("prospcets_Plan_for_AI_BarChat.tiff", units="in", width=5, height=5, res=300)
ggplot(adoptation_df, aes(x=x_values,y = y_values,fill=x_values)) + 
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
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 4, color = "black")
dev.off()

#Initiation
initiation_df<-data.frame(
  x_values =  c("Initiated","Not Initiated","NA"),
  y_values=c(
    initiatives_Yes,
    initiatives_No,
    initiatives_Na
  )
)

tiff("prospcets_Initiation_for_AI_BarChat.tiff", units="in", width=5, height=5, res=300)
ggplot(initiation_df, aes(x=x_values,y = y_values,fill=x_values)) + 
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
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 4, color = "black")
dev.off()
