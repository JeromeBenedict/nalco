postfix1=[['y','x','='],['3','y','+','z','=']]
quad=[]
op=[]
k=0
for p in postfix1:
    for v in p:
        if v=='+' or v=='-' or v=='*' or v=='/' or v=='^' or v=='=':
            var=[]
            t='t'+str(k)
            v2=op.pop()
            v1=op.pop()
            var.append(v)
            var.append(v1)
            var.append(v2)
            if v!='=':
                op.append(t)
                var.append(t)
            k=k+1
            quad.append(var)
        else:
            op.append(v)
    op=[]
    k=0

print quad

flag=0
for q in quad:
    if q[0]=='=':
        x=q[1]
        y=q[2]
        for q1 in quad:
            if q1!=q and q1[1]==x:
                q1[1]=y
                flag=1
            elif q1!=q and q1[2]==x:
                q1[2]=y
                flag=1
    if flag==1:
        quad.remove(q)
        flag=0
print quad
