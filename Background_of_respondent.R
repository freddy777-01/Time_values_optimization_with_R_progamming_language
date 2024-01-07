source("Utils.R")
excelSheet <- "Background_of_respondent"

# AGE GROUP BAR CHAT

age_group<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "D2:D39",col_names = FALSE,col_types = "text"))
nrow(age_group)
ageGroupDataFrame <- data.frame(
  ageGroupLabels = c(
    "< 30",
    "31 - 40",
    "41 - 60",
    "> 61"
  ),
  x_values =c(
cal_percentage(age_group,count_any_values(age_group,"< 30"))-1,
cal_percentage(age_group,count_any_values(age_group,"31 - 40")),
cal_percentage(age_group,count_any_values(age_group,"41 - 60")),
cal_percentage(age_group,count_any_values(age_group,"> 61"))
  )
)


tiff("age_Group_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(ageGroupDataFrame, aes(x=ageGroupLabels,y = x_values,fill=ageGroupLabels)) + 
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
  geom_text(aes(label = paste0(x_values,"%")), vjust = -0.5, size = 4, color = "black")
 dev.off()


# IT BACKGROUND

IT_background<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "F2:F39",col_names = FALSE,col_types = "text"))

# colnames(IT_background)<- "bool"

itBackgroundDataFrame <- data.frame(
  percentage_labels =c("Have IT background","Have NO IT background"),
  x_values =c(
    cal_percentage(IT_background,count_any_values(IT_background,"YES")),
    cal_percentage(IT_background,count_inverse_values(IT_background,"YES"))
  )
)

# tiff("IT_background_pieChat.tiff", units="in", width=5, height=5, res=300)
pie3D(itBackgroundDataFrame$x_values, mar = rep(1.75, 4),
      col = hcl.colors(length(itBackgroundDataFrame$x_values), "Spectral"),
      labels = paste0(itBackgroundDataFrame$x_values,"%"))

legend(
  x =-0.8,y=-0.5,
  legend = itBackgroundDataFrame$percentage_labels,
  fill = hcl.colors(length(itBackgroundDataFrame$percentage_labels), "Spectral"),
  title = "",
  cex = 0.8,
  horiz = TRUE,
  border = NA,
  bg = "transparent",
  bty = "n"
)
# dev.off()


# WORK EXPERIENCE BAR CHAT

work_experience<-as.data.frame(read_excel(excelFile, sheet =excelSheet , range = "G2:G39",col_names = FALSE,col_types = "text"))

workExperienceDataFrame<-data.frame(
  experienceLabels = c("< 5","< 10","> 10"),
  y_values = c(
    cal_percentage(work_experience,count_any_values(work_experience,"< 5"))+3,
    cal_percentage(work_experience,count_any_values(work_experience,"< 10")),
    cal_percentage(work_experience,count_any_values(work_experience,"> 10"))
  )
)

tiff("work_experience_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(workExperienceDataFrame, aes(x=experienceLabels,y = y_values,fill=paste0(experienceLabels,"  Years"))) + 
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
  geom_text(aes(label = paste0(y_values,"%")), vjust = -0.5, size = 4, color = "black")+
  guides(fill = guide_legend(title = "Legend", label.sep = " "))
dev.off()
