cod1,n1,valor1 = input().split(" ")

cod2,n2,valor2 = input().split(" ")


valaorTotal = (float(valor1) * int(n1)) + (float(valor2) * int(n2))

print(f"VALOR A PAGAR: R$ {valaorTotal:.2f}")