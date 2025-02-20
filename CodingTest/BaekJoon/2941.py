grade={"A+":4.5,"A0":4.0,"B+":3.5,"B0":3.0,"C+":2.5,"C0":2.0,"D+":1.5,"D0":1.0,"F":0}
rate=0
scoreSum=0

for _ in range(20):
    subj,score,rating = input().split()
    if rating == "P":
        continue
    rate+=float(score)*grade[rating]
    scoreSum+=float(score)
    
print(rate/scoreSum)