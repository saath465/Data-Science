#Financial Data Analysis of the companies Month to Month Revenue,
#Expense and Tax, with information about good, bad, wost and Best month 
#with profit margins.

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

# Profit for each month 

Profit_month <- revenue - expenses
print(Profit_month)

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * Profit_month, 2)
tax 

#Profit after Tax cut
profit.after.tax <- Profit_month - tax
print(profit.after.tax)

#Mean of profits for the year
profit.mean <- mean(profit.after.tax)

#Good month --> Profit was greater than the mean for the year
profit.good.month <- profit.after.tax > profit.mean
profit.good.month

#bad months of the year are
bad.month <- profit.good.month[-TRUE]
bad.month

#Best month of the year with max profit 
best.month <- max(profit.after.tax)
best.month

#Worst Month of the year with lowest profit
worst.month <- min(profit.after.tax)
worst.month

#interms of $1000
reve.1000 <- round(revenue/1000,0)
exp.1000 <- round(expenses/1000,0)
profit.before.tax.1000 <- round(Profit_month/1000,0)
tax.1000 <- round(tax/1000,0)
profit.after.tax.1000 <- round(profit.after.tax/1000,0)
best.1000 <- round(best.month/1000,0)
worst.1000 <- round(worst.month/1000,0)

#Printing the results...

reve.1000
exp.1000
profit.before.tax.1000
tax.1000
best.1000
worst.1000
profit.after.tax.1000



#Extra Credits-- representing the results as a matrix
M <- rbind(
  reve.1000,
  exp.1000,
  profit.before.tax.1000,
  tax.1000,
  profit.after.tax.1000,
  profit.good.month,
  bad.month,
  best.month,
  worst.month
)

#Printing the matrix for the results of the calculations

M
