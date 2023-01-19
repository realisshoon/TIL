library(readxl)
data1 <- read_excel("deliverySum.xlsx")
data2 <- read_excel("obesityRate.xlsx")


mydata1 <- as.data.frame(data1)
mydata2 <- as.data.frame(data2)

year <-c("2019","2020","2021")

avgDelivery <- mydata1[9,9:11]
rownames(avgDelivery) <- c("delivery")
colnames(avgDelivery) <-year
print(avgDelivery)


avgObesity <- mydata2[2,3:5]
rownames(avgObesity) <- c("Obesity")
colnames(avgObesity) <- year
print(avgObesity)


plot(year,
     avgDelivery,
     main="배달 통계",
     type="b",
     xlab="year",
     ylab="delivery"
)
plot(year,
     avgObesity,
     main="비만 통계",
     type="b",
     xlab="year",
     ylab="Obesity"
)

