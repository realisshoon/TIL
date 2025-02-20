n,b=input().split()
b=int(b)
result=0

for i,char in enumerate(reversed(n)):
    value = int(char) if char.isdigit() else ord(char) - 55
    result += value * (b ** i )

print(result)