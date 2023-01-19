vec <- c("hello","world","bigdata")
typeof(vec)

vec <- c("pi",3.14,TRUE)
typeof(vec)

a <- c(1,2,3)
b <- c(2,3,4)

a+b
a-b
a*b
a/b
a%%b

#Vector Recycling
a <- c(8,10,12,14,16)
b <- c(2,3,4) #(2,3,4, 2,3) 요소를 순서대로 반복
a/b

#숫자형 벡터 관련함수
vec <- c(1.53,3.15,3.28,4.49)
rep(vec,2)
seq(1,10,by=2)
round(vec)

#vector indexing
vec <- c(1,3,5,7,9)
vec[2]
vec[2:4]
vec[4:2]
vec[vec<6]

#week03project
budae <- c("햄","소시지","라면","떡","만두","양배추")
#1
budae[3]
#2
sangmyung <- budae[1:5]
#3
length(sangmyung)
