thismatrix <- matrix(c("Orange","Banana","Guava","Mango")
                     ,nrow = 2,
                     ncol = 2)
#thismatrix

thismatrix<-cbind(thismatrix,c("Grapes","Watermelon"))

for (rows in 1:nrow(thismatrix)) {
  for (columns in 1:ncol(thismatrix)) {
    print(thismatrix[rows, columns])
  }
}