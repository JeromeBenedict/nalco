from collections import OrderedDict

def disp(x):

    for i in x:
        print i,"=",x[i]
    print("")

threeadd = []
a = "s"
#while a!='':
#    a = input()
#    threeadd.append(a)
#
#threeadd = threeadd[:-1]

threeadd=[line.strip() for line in open('adcd.txt')]


diction = OrderedDict()
#diction  = {k:v for k,v in (x.split('=') for x in threeadd) }

for x in threeadd:
    k,v = x.split('=')
    diction[k] = v.replace('^@','')

print("3 address code")
disp(diction)
    
for i in diction:
    for j in diction:
        if diction[i] == diction[j] and i != j:
            diction[j] = i

print("Common sub expression elimination")
disp(diction)

for i in diction:
    if diction[i][1:].isdigit():
        for j in diction:
            #print(diction[j].replace(i,"t0"))
            diction[j] = diction[j].replace(i,diction[i])
        
print("Copy propagation elimination")
disp(diction)

l = []
for i in diction:
    flag = 0
    for j in diction:
        if i in diction[j]:
            flag = 1

    if flag == 0:
        l.append(i)


for i in l:
    del(diction[i])
    
print("Dead Code elemination ")
disp(diction)
