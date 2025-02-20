num=1260
coin_list=[500,100,50,10]
count=0
for i in coin_list:
    print(i)
    count+=num//i
    num%=i
    
print(count)