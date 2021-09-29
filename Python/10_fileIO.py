#-*- coding: euc-kr -*-#

# ���� �����

import os 
print(os.getcwd())

# ���� ó�� ��� ����
# 1) �б� ���� 'r'
# 2) ���� ���� 'w'
# - ���� ������ ���� ��쿡�� ���ο� ������ �����ؼ� �ۼ�
# - ���� ���� ������ ���� ��쿡�� �̹� �����ϴ� ������ ��� ���ְ� �ۼ�
# 3) ���� ���� �߰� 'a'

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

# with ~ as ~ ���� (close() �ڵ����� ȣ��)
with open('test.txt', 'r') as f:
    s = f.read()
    print(s)

# read(): �ѹ��� ���� ��ü�� �� ���� (��뷮 ������ ��� ��� ����õ)
# readline(): �ѹ��� ���پ� ����
# readlines(): ���� ��ü�� ���� ������ �о ����Ʈ�� ���� (��뷮 ������ ��� ��� ����õ)

s = """aaaaaaaaaaaa
bbbbbbbbbbbb
cccccccccccc"""

with open('readTest.txt', 'w') as f:
    f.write(s)

with open('readTest.txt', 'r') as f:
    rs = f.readline() # ���ͱ��� ����
    while rs:
        print(rs)
        rs = f.readline()

with open('readTest.txt', 'r') as f:
    rs = f.readlines()
    print(rs) 


# write()
# writelines(): ����Ʈ �ȿ� �ִ� �� ���ڿ��� ���Ϸ� ���
li = ['first\n', 'second\n', 'third\n']
with open('writeTest.txt', 'w') as f:
    f.writelines(li)

import pickle
# ���̽��� �Ϲ� ��ü �Ӹ� �ƴ϶�
# ����ڰ� ������ ������ ��ü�� ���Ͽ� ���� (����Ʈ, Ʃ��, ���� ���� ��ü)
# ���� ���: ���� ���� (wb, rb)

# when? (pick ��� ����)
# ���� ���Ͽ��� ���� �ִ� ��ü�� �ٸ� ���Ͽ����� ����ϰ� ���� �� 
# (���Ӽ�, persistence)

# 10�� ���Ͽ��� ����ϰ� �ִ� ��ü (li, phone) -> pickle.txt (pickle.dump())
# 11�� ���Ͽ��� pickle.txt�� load�ؼ� ����� �� ���� (pickle.load())

li = [1234, 5678]
phone = {'tom':1234, 'jack':4567, 'jim':7894}

with open('pickle.txt', 'wb') as f:
    pickle.dump((li, phone), f) # ���� ���� (pickling)

with open('pickle.txt', 'rb') as f:
    x, y = pickle.load(f) # ���� ����

print(x)
print(y)