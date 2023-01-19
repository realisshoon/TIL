#x: 차량 중량 y:연비 간의 산점도
data(mtcars)
plot(mpg~wt,data=mtcars)

model <- lm(mpg~wt,mtcars) #회귀 모형 생성
abline(model) #회귀선을 산점도 위에 표시

coef(model)[1] #b값을 출력
coef(model)[2] #w값을 출력

head(mtcars)



#단순회귀분석
b <- coef(model)[1]
w <- coef(model)[2]
wtSample <- 3.8 #예측하고자 하는 독립변수 대입

equation <- w*wtSample+b
print(equation)


#회귀모형 오차 구하기
wtData <- mtcars[,"wt"] #전체차량 중량 데이터 선택
mpgPred <- w*wtData+b #wtData를 회귀선에 대입하여 전체 차량 연비 예측값 도출
mpgData <- mtcars[,"mpg"] #전체 차량 연비 데이터 선택

compare <- data.frame(mpgPred,mpgData,mpgPred-mpgData) 
colnames(compare) <- c("예상","실제","오차")
head(compare)
print(compare)

#다중회귀분석
df <- data.frame(mtcars$wt,mtcars$disp,mtcars$hp)#독립변수 데이터들을 바탕으로 DF생성
colnames(df) <- c("중량","배기량","마력")

plot(df,pch=16,col="blue",main="산점도 매트릭스") #3:3 산점도 매트릭스

model <- lm(mpg~wt+disp+hp,data=mtcars)
summary(model)
