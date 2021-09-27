#-*- Encoding: UTF-8 -*-#

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
print(s[:2]) # index 0 ~ 1 문자열 추출
print(s[:5]) # index 0 ~ 4 문자열 추출
print(s[1:]) # index 1 ~ len(s)-1 문자열 추출
print(s[6:]) # index 6 ~ len(s)-1 문자열 추출

# [start(included):stop(excluded):step] 
# start ~ stop-1 문자열 step만큼 건너뛰며 추출
s = "hello world"
print(s[::2])
print(s[::-1])

# 문자열 길이: len()
print(len(s))

# 문자열 연산
print("hello" + " world")
print("hello" * 5)
print("-" * 60)

# 문자열 내에서 일부 문자열이 있는지 확인
s = "hello world"
print("hello" in s)
print("h" in s)
print("h" not in s)
