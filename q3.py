postfix=['z','x','2','y','2','/','x','4','x','+','^','*','+','*','=']
trip=[]
op1=[]
k=1
for v in postfix:
    if v=='+' or v=='-' or v=='*' or v=='/' or v=='^' or v=='=':
        var=[]
        t=str(k)
        v2=op1.pop()
        v1=op1.pop()
        var.append(v)
        var.append(v1)
        var.append(v2)
        if v!='=':
            op1.append(t)
        k=k+1
        trip.append(var)
    else:
        op1.append(v)

print trip
