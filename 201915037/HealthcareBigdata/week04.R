#스칼라
patientScalar <- c("한승훈")
is(patientScalar) #scalar는 R에서 vector

#vector
patientVector <- c("한승훈","조세빈","문정현")
is(patientVector)

#factor
patientFactorVec<- c("성별","혈액형","체력수준")
patientFactor <- factor(patientFactorVec)
is(patientFactor)

#matrix
vec <- c("김상명","조세빈","이준표","남","여","남")
matrix_onevec <- matrix(vec,nrow=3,ncol=2) #T:행기준, F:열기준
print(matrix_onevec)

vec <- c("김상명","조세빈","이준표","남","여","남")
matrix_onevec <- matrix(vec,nrow=2,ncol=3,byrow=T) #T:행기준, F:열기준
print(matrix_onevec)

#행 기준: rbind(), 열 기준: cbind()
nameVec <- c("김상명","조세빈","이준표")
genVec <- c("남","여","남")
matrix_multivec_row <- rbind(nameVec,genVec)
print(matrix_multivec_row)

#array
patNamevec<- c("김상명","조세빈","이준표")
patGenvec <- c("남","여","남")
patMatrix <- rbind(patNamevec,patGenvec)

docNamevec<- c("한승훈","이재건","김세진")
docMajorvec<- c("내과","외과","산부인과")
docMatrix <- rbind(docNamevec,docMajorvec)

hospitalArray <- array(c(patMatrix,docMatrix),c(2,3,2)) #행,열,행의 갯수 기입 필수 
print(hospitalArray)

#Dataframe  data.frame()은 열단위로 vector를 합쳐서 생성
patNamevec<- c("김상명","조세빈","이준표")
patBMIvec <- c(19.1, 21.5, 23)
patDF <- data.frame(rbind(patNamevec,patBMIvec))
print(patDF)

#dataframe 추출
patNamevec<- c("김상명","조세빈","이준표")
patBMIvec <- c(19.1, 21.5, 23)
patDF <- data.frame(patNamevec,patBMIvec)
patDF_name <- patDF$patNamevec #$: solidus
patDF_indexing <- patDF[2,1]
print(patDF_indexing)

#list
atom <- "헬스케어 빅데이터 구조"
vec1 <- c("김상명","조세빈","이준표")
vec2 <- c(19.1,21.5,23)
df <- data.frame(vec1,vec2)
entireList <- list(atom,vec1,vec2,df)
vecone_indexing <- entireList[[2]]
print(vecone_indexing)


#Homework
customerName <- c("김윤하","박경민","이세화")
customerObesity <- c(FALSE,TRUE,TRUE)

trainerName <- c("케빈","조나단","엘라")
trainerWokrYear <- c(4,3,5)
#1.
customerDF <- data.frame(customerName,customerObesity)
#2.
trainerDF <- data.frame(trainerName,trainerWokrYear)
#3.
customerDF_name <- customerDF$customerName 
print(customerDF_name)
#4.
ptList <- list(customerDF,trainerDF)
print(ptList)
#5.
listIndexing <- ptList[[1]]
print(listIndexing)
