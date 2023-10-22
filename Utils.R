library(ggplot2)
library(dplyr)
library(plotrix)
library(readxl)

excelFile <- "university_AI_adoption.xlsx"
# Define a custom labeling function for the y-axis
percentage_labels <- scales::percent_format(scale = 1)


count_any_values <- function(dataFrame,valueToCount){
  colnames(dataFrame)<-c("bool") #changing data frame column name to "bool"
  
  if(valueToCount == "YES"){
    value_count <- sum(dataFrame$bool == valueToCount,na.rm = TRUE)
    
  }else if(valueToCount == "NO"){
    value_count <- sum(dataFrame$bool == valueToCount,na.rm = TRUE)
  }else{
    value_count <- sum(dataFrame$bool == valueToCount,na.rm = TRUE)
  }
  
  return(value_count)
}

count_inverse_values <- function(dataFrame,valueToCount){
  colnames(dataFrame)<-c("bool") #changing data frame column name to "bool"
  
    non_null_value_count <- sum(dataFrame$bool != valueToCount,na.rm = TRUE)
    null_value_count <- sum(is.na(dataFrame$bool))
  return(non_null_value_count + null_value_count)
}

cal_percentage <- function(dataFrame,valueCount){
  total_clmn <- nrow(dataFrame)
  percentage_yes <- round((valueCount / total_clmn) * 100, 0)
  
  return(percentage_yes)
}

# removing null values and "NO" values
remove_null_values <- function(dataFrame){
  colnames(dataFrame)<-"bool" #changing data frame column name to "bool"
  
  dataFrame <- dataFrame %>%
    filter(bool != "<NA>")
    # filter(bool !="NO")
  
  return(dataFrame)
}

