library(cleandata)

#avg = c(44.06, 33.94, 30.11, 34.55,53.81)
df <- data.frame(
  avg = c(44.07, 33.94, 30.11, 34.55,54.13),
  rank = as.factor(c('2nd', '4th', '5th', '3rd','1st'))
)

df

order.list <- c('1st','2nd','3rd','4th','5th')

cat.df <- df[, c("rank"), drop = FALSE]
encoded <- encode_ordinal(df, order = order.list)


