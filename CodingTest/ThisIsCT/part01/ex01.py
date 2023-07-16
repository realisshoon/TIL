import time
from random import randint

# 시간 측정
start_time=time.time()
end_time=time.time()

print('time : ',end_time-start_time)

# 선택 정렬과 기본 정렬 수행시간 비교
array=[]
for _ in range(10000):
    array.append(randint(1,100))

start_time1=time.time()

for i in range(len(array)):
    min_index=i #가장 작은 원소의 인덱스 
    for j in range(i+1,len(array)):
        if array[min_index]>array[j]:
            min_index=j
    array[i],array[min_index]=array[min_index],array[i] #swap

end_time1=time.time()
print('선택 정렬 성능 측정 : ',end_time1-start_time1)

array=[]
for _ in range(10000):
    array.append(randint(1,100))

start_time2=time.time()

array.sort()

end_time2=time.time()
print('기본 정렬 성능 측정 : ',end_time2-start_time2)
