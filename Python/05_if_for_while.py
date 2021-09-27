#-*- Encoding: UTF-8 -*-#
# python은 들여쓰기 민감한 언어

a = 1
# a = 1

# if문
score = 90
if score >= 90:
    print('A! pass! congrat!')
elif score >= 80:
    print('B!')
elif score >= 70:
    print('C!')
else:
    print('fail!')

# for문 (for each문 좀 더 유사)
li = ['a', 'b', 'c']
for i in li:
    print(i)

# for문 + range()
######################################################
# range(start, stop, step)
# range(stop)
# range(start, stop)
# default: start - 0, stop - len(), step - 1
######################################################
print(range(10))
print(list(range(10)))
print(list(range(1, 10, 2)))

# 1 ~ 10 총합
sum = 0
for i in range(1, 11):
    sum = sum + i
print(sum)

li = ['a', 'b', 'c']
for i in li:
    print(i)

for i in range(len(li)): # 0 ~ 2
    print(li[i]) 

# for + enumerate() : 인덱스 + 원소 값 함께 반환
for i, al in enumerate(li):
    print(i, ":", al)

# break, continue

for i in range(1, 11):
    if(i % 3 == 0): continue
    print(i) 

# for ~ else: for문이 정상적으로 모두 수행되면 else 블럭이 실행
# (중간에 break에 의해서 for문이 중단되지 않으면)
li = [1, 2, 4, 20, 6]
for i in li:
    if(i > 10): break
    print(i)
else:
    print('else block')

# 1)
# 두 리스트의 원소가 동일한지 확인
li1 = [10, 20, 30, 40, 50]
li2 = [10, 20, 30, 30, 50]

# 1. 리스트의 길이가 다르면 동일하지 않음
# 2. 리스트의 원소 하나씩 비교해야함

def listEquals(li1, li2):
    if(len(li1) != len(li2)): return False

    for i in range(len(li1)):
        if(li1[i] != li2[i]): return False
    else: return True

print(listEquals(li1, li2))
print(listEquals(li1, li2))

# 2) 2 ~ 9단 구구단 출력
for i in range(2, 10): # 2 ~ 9
    for j in range(1, 10): # 1 ~ 9
        print(i, '*', j, '=', i * j)
        #print(str(i) + '*' + str(j) + '=' + str(i * j))
    print()

for i in range(2, 10):
    for j in range(1, 10):
        print("{0} * {1} = {2}".format(i, j, i * j))
    print()

for i in range(2, 10):
    for j in range(1, 10):
        print("%d * %d = %d" % (i, j, i * j))
    print()


# while문
# 초기화, 조건식, 증감식
sum = 0
i = 1
while i <= 10:
    sum = sum + i
    i = i + 1
print(sum)

# while ~ else문
sum = 0
i = 1
while i <= 10:
    if(i == 5): break
    sum = sum + i
    i = i + 1
else:
    print('else block')

print(sum)
