a,b,c = input().split(" ")

a = int(a)
b = int(b)
c = int(c)

MaiorAB = (a+b+abs(a-b))/2

if c > MaiorAB:
    maior = c
else:
    maior = MaiorAB
    
print(f"{int(maior)} eh o maior")