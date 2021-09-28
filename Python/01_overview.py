#-*- Encoding: UTF-8 -*-#

# single line comment
"""
multiple line comment
multiple line comment
multiple line comment
"""

# 파이썬 (Python)
# 스크립트 (Script) 언어
# 컴파일 언어와 달리 소스코드를 한줄 한줄 읽어서 바로 실행 (인터프리터)
# 장점: 개발 시간 단축, 소스 코드 수정이 빠름
# 단점: 실행 속도 오래 걸림

# ex) JavaScript, Python, Ruby 

print("hello world")
print('hello world')

# 동적인 데이터 타입 결정 
a = 10 # data type이 없음
print(a)
print(type(a))

a = "string"
print(a)
print(type(a))

def add(a, b):
    return a + b

print(add(3, 5))
print(add("abc", "def"))

# 연산자 (+, -, *, /, **)
print(3 / 5) # 정수 / 정수 = 실수
print(3 ** 3) # 3의 3승

# 사용자에게 데이터 입력 (input() => 무조건 string으로 들어옴!)
name = input('name ? ') 
print(name)
print(type(name)) # class 'str'

age = int(input('age ? '))
print(age)
print(type(age)) # class 'int'


# 변수 생성
test = 10

# 변수 삭제
del test
#print(test) # 사용 불가

# 두 수를 swap 코드
x = 10
y = 20
tmp = x
x = y
y = tmp

x, y = y, x # 동시 치환 가능

# 내장 함수 (built-in function)
# 별도 모듈 추가 없이 기본 제공 함수

# 절대값 반환
print(abs(3))
print(abs(-3))

print(max(3, 5))
print(min(3, 5))

print(3 ** 3)
print(pow(3, 3))
