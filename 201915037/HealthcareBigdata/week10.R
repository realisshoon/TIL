print(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg,
     main="중량-연비 산점도",
     xlab="중량(wt)", #x축
     ylab="연비(mpg)", #y축
     col="red",
     pch=19) #point 종류
vars <- c("mpg","disp","drat","wt") #대상변수
target <- mtcars[,vars] #데이터프레임에서 위의 변수명을 가진 열 선택
head(target)
pairs(target,main="Multi Plots")

#실습

data(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg,
     main="중량-연비 산점도",
     xlab="중량(wt)", #x축
     ylab="연비(mpg)", #y축
     col="blue",
     pch=15) #point 종류
vars <- c("UrbanPop","Murder","Assault") 
target <- USArrests[,vars] 
pairs(target)

#plot()
beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.095,0.07,0.06,0.02,0.05)
ca <- data.frame(beers,bal)
print(ca)
plot(bal~beers,data=ca) #산점도

#lm()
camodel <- lm(bal~beers,data=ca)
abline(camodel)

#cor()
cor(beers,bal)

#plot(): 선그래프
month <- 1:12
cold <- c(5,8,7,9,4,6,12,13,8,6,6,4)
cold2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,
     cold,
     main="감기 환자 통계",
     type="l",
     lty=1,
     lwd=1,
     col="red",
     xlab="month",
     ylab="cold patients",
     ylim=c(1,15)
     )
lines(month,
     cold2,
     type="b",
     col="blue")
