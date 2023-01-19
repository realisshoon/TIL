####한글 깨질때####
par(family = 'NanumGothic')

###week09
##데이터 구조 파악
#범주형 데이터 : 순서만 중요할 뿐 연산을 할 수 없음
#table() 
gender <- c("M","F","M","M","F","M","F","M","F")
table(gender)
religion <- c("Ch","I","N","B","N","Ch","Ca","B","N")
table(religion)
table(gender,religion)

univ <- c("상명대","대전대","동의대","단국대","단국대","동의대","우송대","홍익대","상명대","원광보건대")
table <- table(univ)
table(univ)/length(univ)

barplot(table,main="재학 대학 분포")
#연속형 데이터 : 절대적인 '0'값을 가지고 '없다'라고 표현 할 수 없음
bmi <- c(12.1,12.8,15,19,22,28,31.1)
mean(bmi)
median(bmi)
mean(bmi,trim=0.2)

quantile(bmi)
summary(bmi)
var(bmi)
sd(bmi)
range(bmi)
diff(bmi) #앞의 인덱스와의 차이

boxplot(bmi)

###week10
##산점도
print(mtcars)
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg,
     main="중량-연비 산점도",
     xlab="중량(wt)",
     ylab="연비(mpg)",
     col="red",
     pch=19)
#pairs()
vars <- c("mpg","disp","drat","wt")
target <- mtcars[,vars]
head(target)
pairs(target,main="Multi plots")

print(USArrests)
vars <- c("Murder","Assault","UrbanPop")
head(vars)
target <- USArrests[,vars]
pairs(target)

##상관분석과 상관계수
#상관분석은 두 변수간의 관계를 분석하기 위해 사용
#변수는 연속형 자료만 가능

#상관계수 r=X와 Y가 함께 변하는 정도/각각 변하는 정도
#plot()
beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.095,0.07,0.06,0.02,0.05)
ca <- data.frame(beers,bal)
print(ca)
plot(bal~beers,data=ca)

#lm() : linear model
camodel <- lm(bal~beers,data=ca)
abline(camodel) #회귀선 그리기 

#cor() 상관계수 구하는 함수
#methond : person,kendall,spearman 기본값 : person
cor(beers,bal) #높을 수록 상관관계가 높다

##선그래프
month <- 1:12
cold1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
cold2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,
     cold1,
     main="감기 환자 통계",
     type="s",
     lty=1,
     lwd=1,
     xlab="month",
     ylab="cold patients",
     ylim = c(1,15)
     )
lines(month,
      cold2,
      type="b",
      col="blue")


##week10 연습문제1
print(cars)
plot(cars$speed,cars$dist)

print(pressure)
plot(pressure$temperature,pressure$pressure)

print(state.x77)
pairs(state.x77[,c("Population","Income","Illiteracy","Area")])

##연습문제2
print(trees)
plot(trees$Girth,trees$Height)
cor(trees$Girth,trees$Height)

pairs(trees)
cor(trees)


##연습문제3
print(Orange)
color <- c("red","green","blue","yellow","black")
plot(Orange$age,Orange$circumference,col=color[Orange$Tree])


##연습문제4
install.packages("mlbench")
library(mlbench)
data("Glass")
print(Glass)
myds <- Glass
pairs(myds[,-10])
cor(myds[,-10])
pairs(myds[,-10],col=myds$Type)

##연습문제5
data("Ionosphere")
print(Ionosphere)
myds <- Ionosphere[,3:12]
myds

cor(myds)
mycor <- data.frame(cor(myds))

for(i in 1:nrow(mycor)){
  mycor[i,i] <- NA
}
mycor
max(mycor,na.rm = T)

plot(myds$V9,myds$V11)
cor(myds$V9,myds$V11)

###week11
##단순회귀분석
data(mtcars)
plot(mpg~wt,data=mtcars)

model <- lm(mpg~wt,mtcars)
abline(model)

b <- coef(model)[1] #b 값
w <- coef(model)[2] #w 값
coef(model)
wtSample <- 3.8
equation <- w*wtSample+b
print(equation)

mtcars
wtData <- mtcars[,"wt"]
mpgPred <- w*wtData+b
mpgData <- mtcars[,"mpg"]

compare <- data.frame(mpgPred,mpgData,mpgPred-mpgData)
colnames(compare) <- c("예상","실제","오차")
head(compare)

##다중회귀분석
#독립변수 간에는 서로 낮은 상관관계를 보여야함
#실습
data(mtcars)
df <- data.frame(mtcars$wt,mtcars$disp,mtcars$hp)
colnames(df) <- c("중량","배기량","마력")

plot(df,pch=16,col="blue",main="산점도 매트릭스")

model <- lm(mpg~wt+disp+hp,data=mtcars)
summary(model)

library(MASS)
newModel <- stepAIC(model)

summary(newModel)

#openAPI를 활용한 공공데이터 
pageNo <- 1
rows <- 10
type_data_format <- "xml"
url <- paste0(serviceURL, operation, paste0("?serviceKey=", ServiceKey), paste0("&pageN0=", pageNo), paste0("&numOfRows=", rows), paste0("&resultType=", type_data_format))




##연습문제
data(trees)
trees
df <- data.frame(trees$Girth,trees$Height)
plot(df,pch=20,col="blue")

model <- lm(Volume~Girth+Height,data=trees)
summary(model)


Volume =  -57.9877 + 4.7082 * trees$Girth + 0.3393 * trees$Height
##
install.packages("lbench")
library(lbench)
data("BostonHousing")
BostonHousing

ds <- data.frame(BostonHousing[,-4])
model <- lm(medv~.,data=ds)
summary(model)

plot(ds,pch=20,col="blue")

###
data(mtcars)
mtcars
mod <- lm(mpg~.,data=mtcars)
summary(mod)


###12주차

data(mtcars)
mtcars
mod <- lm(mpg~.,data=mtcars)
summary(mod)

library(MASS)
mod2 <- stepAIC(mod)
summary(mod2)

###
excel <- read.csv("binary.csv")
mydata <- data.frame(excel)
mydata
mod <- lm(admit~.,mydata)
mod2 <- glm(admit~gre+gpa+rank,data=mydata) 
summary(mod)
summary(mod2)

pred <- predict(mod2,mydata[,c("gre","gpa","rank")])
pred <- round(pred,digits = 0)
pred

result <- data.frame(pred,mydata$admit)
print(result)
