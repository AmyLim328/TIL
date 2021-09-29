#-*- coding: euc-kr -*-#

# 람다 (lambda) 함수 (축약 함수)
# : 일반적인 함수를 한 줄로 정의할 수 있음
# : 함수 이름이 없이 일회성으로 사용할 함수에 대해서 사용 
# (익명 함수)

def incr(x):
    return x + 1

print(incr(1))
print(incr(2))

# lambda function (python)
f = lambda x: x + 1
print(f(1))

# lambda (java)
# (parameter) -> {return}

f = lambda x, y=1: x + y # y default: 1
print(f(1, 2))
print(f(10))

# 가변 인자를 가지는 람다 함수
vargs = lambda *args: args
print(vargs())
print(vargs(1))
print(vargs(1, 2, 3))

func_list = [
    lambda x, y : x + y,
    lambda x, y : x - y,
    lambda x, y : x * y,
    lambda x, y : x / y
]

print(func_list[0](3, 5)) # +
print(func_list[1](3, 5)) # -
print(func_list[2](3, 5)) # *
print(func_list[3](3, 5)) # /

############################################
# lambda + map()

# map(function, sequence 자료형 (list, tuple, string))

def f(x):
    return x * x

l = list(range(1, 6)) # 1 ~ 5
m = list(map(f, l))
print(m)

m = list(map(lambda x: x * x, l))
print(m)

# Q1.
# range(10)의 모든 값 x에 대해 
# f = x * x + 4 * x + 5의 계산 결과 리스트로 반환

f = lambda x: x * x + 4 * x + 5
m = list(map(f, list(range(10))))
print(m)

# Q2.
# ["hello", "python", "java"] 각 단어들의 길이 리스트로 반환
l = ["hello", "python", "java"]
L = [len(i) for i in l] # list comprehension

f = lambda x: len(x)
m = list(map(f, l)) # map
print(m)


# filter(function, sequence 자료형 (list, tuple, string))
f = lambda x: x > 2
fi = list(filter(f, range(10)))
print(fi)

# Q1. range(10) 중에서 짝수만 필터링
f = lambda x: x % 2 == 0
fi = list(filter(f, range(10)))
print(fi)


# Q2. l = ["hello", "python", "java"] 중에서 
# 문자열의 길이가 5 초과인 단어 필터링
l = ["hello", "python", "java"]
f = lambda x: len(x) > 5
fi = list(filter(f, l))
print(fi)

# Q3. s = 'abc123'에서 알파벳만 필터링
s = 'abc123'
#f = lambda x: 'a' <= x.lower() <= 'z'
f = lambda x: x.isalpha() 
fi = list(filter(f, s))
print(fi)

# reduce(function, sequence 자료형 (list, tuple, string))
# python3 -> 내장 함수 아님

from functools import reduce
f = lambda x, y: x + y
re = reduce(f, range(5)) # 0 ~ 4 (0 + 1 + 2 + 3 + 4)
print(re)

"""
x y reduce
0 0 0
0 1 1
1 2 3
3 3 6
6 4 10
"""

f = lambda x, y: x + y
re = reduce(f, range(5), 100) # 0 ~ 4 (0 + 1 + 2 + 3 + 4)
print(re)

"""
x   y  reduce
------------
100 0  100
100 1  101
101 2  103
103 3  106
106 4  110
"""


re = reduce(lambda x, y: y + x, 'abc', "") 
print(re)

"""
x   y  reduce
------------
"" a     a
a  b    ba
ba c   cba
"""
