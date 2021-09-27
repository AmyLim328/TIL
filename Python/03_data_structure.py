#-*- Encoding: UTF-8 -*-#

# 리스트 (list)
# 정의: [], list()
# 임의의 객체를 순차적으로 저장하는 자료형

L = [1, 2, 3]
L = list([1, 2, 3])
print(L)
print(type(L))

print(L[0]) # indexing
print(L[0:2]) # slicing
print(L[0:3:2]) # slicing

L[0] = 10
print(L)

#################
s = "hello world"
#s[0] = 'H' # ?? # 불가능, 문자열은 상수이기 때문
s = 'H' + s[1:]
#################

# 튜플 (tuple)
# 리스트랑 유사
# 튜플 내의 원소를 수정할 수 없음 (immutable)
# ex) 1 ~ 12월, 1 ~ 31일
# 정의: (), tuple()
t = ('January','February','March','April','May','June','July','August','September','October','November','  December')
#t[0] = 'Jan' # 불가능, 튜플은 상수이기 때문

print(t[0])
print(t[-1])
print(t[0:2])
print(t[0:5:2])
print(t + t + t)
print(t * 2)
print('July' in t) # membership test (in, not in)

# 사전 (dictionary; dict)
# 키 (key)를 통해 값 (value)을 접근하는 자료 구조
# Map 자료 구조와 유사
# 정의: {}, dict()

d = {'a':'apple','b':'banana'}
print(d['a'])

d['a'] = 'ant' # 원소 수정 가능 (mutable)

# 원소 추가
d['k'] = 'kiwi'

# membership test (키 값을 통해)
print('a' in d)

# 키 추출
print(d.keys())

# 값 추출
print(d.values())

# (키, 값) 튜플 형태 추출
print(d.items())