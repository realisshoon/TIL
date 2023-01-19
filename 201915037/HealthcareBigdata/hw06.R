#데이터프레임
insuranceDF <- read.csv("insuranceDF.csv",header = TRUE,fileEncoding = "CP949",encoding = "UTF-8")
insuranceDF_row <- read.csv("insuranceDF_row.csv",header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
insuranceDF_column <- read.csv("insuranceDF_column.csv",header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")

#과제1 
##dataframe을 cols,rows를 insuranceDF에 결합
bind_colsInsuarnceDF <- bind_cols(insuranceDF,insuranceDF_column)
bind_InuranceDF <- bind_rows(bind_colsInsuarnceDF,insuranceDF_row)

#과제2
##결측치를 보험금 납입액수 평균으로 대체
#console창에서 진행
##>bind_InuranceDF$charges[is.na(bind_InuranceDF$charges)] <- mean(bind_InuranceDF$charges,na.rm = TRUE)