#중간고사 정리

##ch1.vector
vec <- c("hello","world","bigdata")
typeof(vec)

vec <- 0
##
vec <- c("pi",3.14,TRUE)
typeof(vec)

##
a <- c(8,6,4,5)
b <- c(2)
a/b

c <- c(8,9)
a+c

vec <- 0
#numVector
vec <- c(1.53,3.14,3.28,4.49)
rep(vec,2)
seq(1,10,by=2)
round(vec)

#vectorIndexing
indexVec <- c(2,3,4,5)
indexVec[1]
indexVec[2]
indexVec[1:3] #범위도 가능함
indexVec[3:1] #역순도 가능함
indexVec[indexVec < 4]

#데이터 백터는 요소값에 이름 부여 가능
score <- c(90,85,70)
names(score) <- c("John","Tom","Jane")
print(score)
#데이터벡터에서 값 추출
GNP <- c(2090,2450,960)
names(GNP) <- c("Korea","Japan","Nepal")
GNP[1]
GNP["korea"]
GNP["Korea"]
GNP[c("Korea","Nepal")]

##example 
d <- c(101:200)
typeof(d)
d[10]
d[100:91]
d[2:100]
d[d%%2==0]#짝수만 출력
d20 <- d[1:20]
print(d20)
d20[-5]
d20[c(-5,-7,-9)]

##ch2.자료구조

##matrix
#여러 개의 벡터(단일 유형)를 합쳐 행렬 생성

nameVec <- c("김상명","조세빈","이준표")
genVec <- c("남","여","남")
matrix_multivec_row <- rbind(nameVec,genVec)
matrix_multivec_col <- cbind(nameVec,genVec)
print(matrix_multivec_row)

##Array
#여러개 행렬들을 쌓아서 올린 형태
#array(c(행렬1,행렬2),c(행 개수, 열 개수, 행렬 개수))
hospitalArray <- array(c(patMatrix,docMatrix),c(2,3,2))

##Dataframe
#다른 유형의 벡터들이 2차원으로 구성되어 있는 자료구조
patDF <- data.frame(patNamVec,patBMIVec)
print(patDF)
#data.frame() 내에 rbind()함수를 활용할 경우, 행 단위 결합 가능
patDF <- data.frame(rbind(patNameVec,patBMIVec))
#데이터프레임 전체 열 추출
patDF$patNameVec #patDF에서 patNameVec 열 전체를 부름

##List
#2차원 형태로 자료를 저장한다는 점에서 벡터와 비슷하지만, 여러 자료구조형을 섞어 가능

##ch3.데이터 파악

#getwd(): 현재 작업중인 dir위치
#setwd(): 새로운 작업 공간 설정
#readLines(): 줄 단위로 읽어 각 줄의 텍스트를 원소로 갖는 벡터로 변환

##read.table(파일위치,어떤 문자기준으로 구분,열의 제목 사용,인코딩 방식)
#read.table("파일명",sep="구분자",header=TRUE,encoding="ANSI")


















