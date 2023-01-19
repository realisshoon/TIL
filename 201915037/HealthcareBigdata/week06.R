#샘플 데이터 준비
##기초 데이터 프레임 cf) 인코딩 문제로 다음 코드를 추가함 
patientDF <- read.csv("patientDF.csv" , header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
##행 결합 데이터프레임
patientDF_row <- read.csv("patientDF_row.csv",header = TRUE,fileEncoding = "CP949", encoding = "UTF-8")
##열 결합 데이터프레임
patientDF_col <- read.csv("patientDF_col.csv",header = TRUE,fileEncoding = "CP949", encoding = "UTF-8")

##결측값 샘플데이터 준비
missingTable <- read.csv("missingData.csv",header=TRUE,fileEncoding = "CP949", encoding = "UTF-8")
