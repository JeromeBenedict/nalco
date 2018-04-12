def priority(x):
    if x=='(':
        return 0
    if x=='=':
        return 1
    if x=='+' or x=='-':
        return 2
    if x=='*' or x=='/':
        return 3
    
exp=raw_input('Enter the expression:')
stack=[]
postfix=[]
for i in exp:
    if i.isalnum():
        postfix.append(i)
    elif i=='(':
        stack.append(i)
    elif i==')':
        x=stack.pop()
        while(x!='('):
            postfix.append(x)
            x=stack.pop()
    else:
        while len(stack)!=0 and priority(stack[-1])>=priority(i):
            y=stack.pop()
            postfix.append(y)
        stack.append(i)

while(len(stack)!=0):
    z=stack.pop()
    postfix.append(z)

print postfix
