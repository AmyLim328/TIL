#-*- coding: euc-kr -*-#

s = 'i like python'
print(s.upper())
print(s.lower())

s = 'i like python, i like java'
print(s.count('like'))
print(s.find('like')) # 처음으로 나온 like의 위치 (인덱스) 반환


print(s.startswith('i like')) 
print(s.startswith('i l')) 
print(s.endswith('java'))
print(s.endswith('a'))

print('java' in s)


u = '         spam              '
print(u.strip()) # 좌우 공백 제거
print(u.lstrip()) # 좌 공백 제거
print(u.rstrip()) # 우 공백 제거

u = '<><><><><>spam<><><><>'
print(u.strip('<>')) # 좌우 <> 제거


print(u.replace('spam', 'egg').strip('<>')) # function chaining

u = 'spam and egg'
print(u.split()) # 공백 기준으로 문자열 자름 (리스트로 반환)
print(u.split('and')) # 'and' 기준으로 문자열 자름 (리스트로 반환)
# ['spam ', ' egg']

res = u.split('and') # ['spam ', ' egg']
print("and".join(res))

# 'spam and egg' -> ['spam ', ' egg']: split (string -> list)
# 'spam and egg' <- ['spam ', ' egg']: join (list -> string)

#u = ['spam ', ' egg']
#print("and".join(u))


# split & join

# Q1
u = ['a', 'b', 'c', 'd'] # 'a:b:c:d'
print(":".join(u))

# Q2
u = 'a b c d' # ['a', 'b', 'c', 'd']
print(u.split())

# Q3
u = ['ramen', 'cheese'] # 'ramen or cheese'
print(" or ".join(u))

# isdigit(): 모든 문자열들이 숫자인지?
# isalpha(): 모든 문자열들이 영문자인지?
# isalnum(): 모든 문자열들이 영문자 또는 숫자인지? (alphabet + number)
# islower(): 모든 문자열들이 소문자인지?
# isupper(): 모든 문자열들이 대문자인지?

