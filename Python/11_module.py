#-*- coding: euc-kr -*-#

# 모듈 (module)
# 함수, 변수, 클래스를 묶어놓은 파일
# 1) 표준 모듈 (파이썬 언어 패키지에서 기본 제공)
# ex) import os, import shutil .....
# 2) 사용자 생성 모듈 (개발자가 직접 정의한 모듈)

# 이름 공간 (namespace, scope)
# 현재 변수가 존재하는 장소 (지역 (local), 전역 (global))

g = 10 # global
h = 5 # global

def f(a): # a: local
    h = a + 10 # h: local
    print(g) # global
    print(h) # global, local (우선순위: local > global)

f(1)
print(h) # global # 5

#######################################
print() # enter
print() # enter

g = 10 # global
h = 5 # global

def f(a): # a: local
    global h # global 변수인 h를 함수 내에서 사용하겠다!
    h = a + 10 # h: global
    print(g) # global
    print(h) # global

f(1)
print(h) # global # 11

#####################################

g = 10

def f():
    global g
    a = g # g: global
    g = 20

f()
print(g)

#################################

import mymath # 사용자 정의 모듈

print(mymath.mypi)
print(mymath.area(5))


########################################
# 모듈 import 방법

# import 모듈명 [as mm] # 모듈 별칭
import mymath as mm
print(mm.mypi) # 모듈 이름 작성 필요
print(mm.area(5)) # 모듈 이름 작성 필요

# from 모듈명 import 이름 
from mymath import *
print(mypi) # 모듈 이름 없이 직접 사용 가능
print(area(5)) # 모듈 이름 없이 직접 사용 가능