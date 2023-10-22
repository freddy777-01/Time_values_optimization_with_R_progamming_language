library(ggplot2)


tools <-data.frame(
  nm = c("Excel","Tableau","Odoo","Spss","Stata","Google analytic","Candela","Instagram","Whatsapp","Quick book"),
  p = c(8,2,1,1,1,1,1,1,1,1)
)
data <- tools %>% 
  arrange(desc(nm)) %>%
  mutate(prop = round(p / sum(tools$p) *100,0)) %>%
  mutate(ypos = round(cumsum(prop)- 0.5*prop,0))

# Define a custom labeling function for the y-axis
percentage_labels <- scales::percent_format(scale = 1)

#tiff("age_vs_awareness_barChat.tiff", units="in", width=5, height=5, res=300)
ggplot(data, aes(x=nm,y = prop,fill=nm)) + 
  geom_col(width = 0.7)+
  scale_y_continuous(breaks = seq(0, 100, by = 10), labels = percentage_labels)+
  labs(
    title = "ICT Tools",
    x="",
    y="Frequency",
    fill ="Legend"
  )+theme_minimal()+
  theme(axis.text.x = element_blank())+
  geom_text(aes(label = paste0(prop,"%")), vjust = -0.5, size = 4, color = "black")
#dev.off()
