#-*- coding: euc-kr -*-#

# 파일 입출력

import os 
print(os.getcwd())

# 파일 처리 모드 종류
# 1) 읽기 전용 'r'
# 2) 쓰기 전용 'w'
# - 만약 파일이 없을 경우에는 새로운 파일을 생성해서 작성
# - 만약 기존 파일이 있을 경우에는 이미 존재하는 내용을 모두 없애고 작성
# 3) 파일 끝에 추가 'a'

# file write
s = "hello python"
f = open('test.txt', 'w')
f.write(s)
f.close()

s = "hello java"
f = open('test.txt', 'w')
f.write(s)
f.close()

s = "hihihi"
f = open('test.txt', 'a')
f.write(s)
f.close()

# file read
f = open('test.txt', 'r')
s = f.read()
print(s)
f.close()

# with ~ as ~ 구문 (close() 자동으로 호출)
with open('test.txt', 'r') as f:
    s = f.read()
    print(s)

# read(): 한번에 파일 전체를 다 읽음 (대용량 파일인 경우 사용 비추천)
# readline(): 한번에 한줄씩 읽음
# readlines(): 파일 전체를 라인 단위로 읽어서 리스트에 저장 (대용량 파일인 경우 사용 비추천)

s = """aaaaaaaaaaaa
bbbbbbbbbbbb
cccccccccccc"""

with open('readTest.txt', 'w') as f:
    f.write(s)

with open('readTest.txt', 'r') as f:
    rs = f.readline() # 엔터까지 읽음
    while rs:
        print(rs)
        rs = f.readline()

with open('readTest.txt', 'r') as f:
    rs = f.readlines()
    print(rs) 


# write()
# writelines(): 리스트 안에 있는 각 문자열을 파일로 출력
li = ['first\n', 'second\n', 'third\n']
with open('writeTest.txt', 'w') as f:
    f.writelines(li)

import pickle
# 파이썬의 일반 객체 뿐만 아니라
# 사용자가 정의한 복잡한 객체를 파일에 저장 (리스트, 튜플, 사전 복합 객체)
# 저장 모드: 이진 파일 (wb, rb)

# when? (pick 사용 이유)
# 현재 파일에서 쓰고 있는 객체를 다른 파일에서도 사용하고 싶을 때 
# (지속성, persistence)

# 10번 파일에서 사용하고 있는 객체 (li, phone) -> pickle.txt (pickle.dump())
# 11번 파일에서 pickle.txt를 load해서 사용할 수 있음 (pickle.load())

li = [1234, 5678]
phone = {'tom':1234, 'jack':4567, 'jim':7894}

with open('pickle.txt', 'wb') as f:
    pickle.dump((li, phone), f) # 파일 쓰기 (pickling)

with open('pickle.txt', 'rb') as f:
    x, y = pickle.load(f) # 파일 읽음

print(x)
print(y)