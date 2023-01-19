#for문
for(i in 1:5){
  print(i)
}
#while 문
i <- 0
while(i<=5){
  print(i)
  i=i+1
}

#break 문 
i <- 0
while(i<=10){
  i=1+i**2
  print(i)
  if(i>=5){
    print("코드를 강제 종료합니다.")
    break
  }
}

#apply(df,행(1)/열(2)방향 지정, 적용함수)

#샘플 데이터 준비
populationDF <- read.csv("populationDF.csv",header=TRUE)

#사용자 정의 함수
mymax <- function(value1,value2){
  if(value1>value2){
    print("첫번째 입력값이 더 큽니다.")
    return(value1)
  }
  else if(value2>value1){
    print("두번째 입력값이 더 큽니다.")
    return(value2)
  }
  else{
    print("두 값의 크기가 동일해서 반환 값이 없습니다.")
  }
}

#변수 값이 사전 입력된 함수
presetFunc <- function(value1=1,value2=2){
  print(value1)
  print(value2)
}

