#-*- Encoding: UTF-8 -*-#

# ���ڿ� ����
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

# ���ڿ� �ε��� (indexing)
s = "hello world"
print(s[0])
print(s[1])
print(s[-1])
print(s[-2])
print(s[len(s)-1])
print(s[len(s)-2])

# ���ڿ� �����̽� (slicing)
# [start(included):stop(excluded)] # start ~ stop-1 ���ڿ� ����
# �⺻�� (default): start - 0, stop - ���ڿ��� ���� (len(s))

s = "hello world"
print(s[:2]) # index 0 ~ 1 ���ڿ� ����
print(s[:5]) # index 0 ~ 4 ���ڿ� ����
print(s[1:]) # index 1 ~ len(s)-1 ���ڿ� ����
print(s[6:]) # index 6 ~ len(s)-1 ���ڿ� ����

# [start(included):stop(excluded):step] 
# start ~ stop-1 ���ڿ� step��ŭ �ǳʶٸ� ����
s = "hello world"
print(s[::2])
print(s[::-1])

# ���ڿ� ����: len()
print(len(s))

# ���ڿ� ����
print("hello" + " world")
print("hello" * 5)
print("-" * 60)

# ���ڿ� ������ �Ϻ� ���ڿ��� �ִ��� Ȯ��
s = "hello world"
print("hello" in s)
print("h" in s)
print("h" not in s)
