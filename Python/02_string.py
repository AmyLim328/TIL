#-*- coding: euc-kr -*-#

# 파이썬에서는 문자, 문자열의 구분이 없음
# 'a' => type str
# "a" => type str
# 문자열 정의할 때 '', "" 둘 다 사용 가능

# 문자열 정의
s = "hello world"
s = 'hello world'
s = """
asdasdasd
asdadasasdasd
asdasdasdasd
asdasdasd
"""
s = '''
asdadasd
asdasdasdasd
asdasdasd
asdasdasdasd
'''

# 문자열 인덱싱 (indexing)
s = "hello world"
print(s[0])
print(s[1])
print(s[-1])
print(s[-2])
print(s[len(s)-1])
print(s[len(s)-2])

# 문자열 슬라이싱 (slicing)
# [start(included):stop(excluded)] # start ~ stop-1 문자열 추출
# 기본값 (default): start - 0, stop - 문자열의 길이 (len(s))

s = "hello world"
print(s[:2]) # index 0 ~ 2-1 문자열 추출
print(s[:5]) # index 0 ~ 5-1 문자열 추출
print(s[1:]) # index 1 ~ len(s)-1 문자열 추출
print(s[6:]) # index 6 ~ len(s)-1 문자열 추출

# [start(included):stop(excluded):step] 
# start ~ stop-1 문자열 step만큼 건너뛰며 추출
s = "hello world"
print(s[1:5:2]) # el
print(s[::2]) # hlowrd
print(s[::-1]) # dlrow olleh (역순 출력)

# 문자열 길이: len()
print(len(s))

# 문자열 연산
print("hello" + " world")
print("hello" * 5)
print("-" * 60)

# 문자열 내에서 일부 문자열이 있는지 확인 (membership test)
s = "hello world"
print("hello" in s)
print("h" in s)
print("h" not in s)
