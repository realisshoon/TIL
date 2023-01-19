library(treemap)
data("GNI2014")
head(GNI2014)

treemap(GNI2014,
        index=c("continent","iso3"),#계층구조 설정
        vSize="population", #타일크기
        vColor="GNI", #타일 색상
        type="value", #타일컬러링 방법
        title="세계 GNI")

#실습01
data(mtcars)
mtcars$name <- rownames(mtcars)
treemap(mtcars,
        index="name",
        vSize="hp",
        vColor="mpg",
        type="value",
        title="중고차")
#버블차트
head(state.x77)
state <- data.frame(state.x77)#매트릭스->dataframe 변환
symbols(state$Illiteracy,state$Murder, #원의 x,y좌표의 열
        circles=state$Population,#원의 반지름 열
        inches=0.3,
        fg="white",
        bg="lightgray", 
        lwd=1.5, #원의 테두리 두께
        xlab="Illiteracy",
        ylab="Murder",
        main="Illieracy and Murder per bublechart")#버블차트 제목  
text(state$Illiteracy,state$Murder,
     rownames(state),
     cex=0.6,
     col="brown")
#실습02
state <- data.frame(state.x77)#매트릭스->dataframe 변환
symbols(state$Income,state$Life.Exp, #원의 x,y좌표의 열
        circles=state$Population,#원의 반지름 열
        inches=0.3,
        fg="white",
        bg="lightgray", 
        lwd=1.5, #원의 테두리 두께
        xlab="Income",
        ylab="Life.Exp",
        main="소득과 기대수명 버블차트")#버블차트 제목  
text(state$Income,state$Life.Exp,
     rownames(state),
     cex=0.6,
     col="brown")

#모자이크 플롯
data(mtcars)
mosaicplot(~gear+vs,
           data=mtcars,
           color=TRUE,
           main="Gear&Vs")
#실습03
data(mtcars)
mosaicplot(~gear+am,
           data=mtcars,
           color=TRUE,
           main="Gear&Transmission")
##ggplot
library(ggplot2)
month <- c(1,2,3,4,5,6)
weight <- c(40,48,47,45,43,39)
df <- data.frame(month,weight)

ggplot(data=df,aes(x=month,y=weight))+geom_bar(stat="identity",width=0.8,fill="steelblue")

ggplot(data=Orange,aes(x=age,y=circumference))+geom_line(aes(color=Tree),linetype=5,size=3)

#실습04
data("Loblolly")
ggplot(data=Loblolly,aes(x=age,y=height))+geom_line(aes(color=Seed),linetype=1,size=1)

#산점도
ggplot(data=mtcars,aes(x=hp,y=mpg))+geom_point()

ggplot(data=mtcars,aes(x=hp,y=mpg))+geom_point(aes(color=as.factor(vs)))

#실습05
data("diamonds")
diamonds <- head(diamonds,100)
ggplot(data=diamonds,aes(x=carat,y=price))+geom_point(aes(color=as.factor(cut)))

#상자그래프
library(ggplot2)

data("mtcars")
ggplot(data=mtcars,aes(y=hp))+geom_boxplot(aes(fill=as.factor(cyl)))

#차원축소
library(Rtsne)
library(ggplot2)
library(survival)
cancer <- gbsg[,c("age","size","grade","nodes")]#gbsg데이터셋 중 필요한 열만 추출
grade <- cancer$grade

tsne <- Rtsne(cancer,dim=2,perplexity=10,check_duplicates=FALSE)

tsneDF <- data.frame(tsne$Y)
ggplot(data=tsneDF,aes(x=X1,y=X2,color=grade))+geom_point(size=2)
