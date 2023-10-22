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