#-*- Encoding: UTF-8 -*-#

s = 'i like python'
print(s.upper())
print(s.lower())

s = 'i like python, i like java'
print(s.count('like'))
print(s.find('like')) # ó������ ���� like�� ��ġ (�ε���) ��ȯ

print(s.startswith('i like')) 
print(s.endswith('java'))
print('java' in s)

u = '         spam              '
print(u.strip()) # �¿� ���� ����
print(u.lstrip()) # �� ���� ����
print(u.rstrip()) # �� ���� ����

u = '<><><><><>spam<><><><>'
print(u.strip('<>')) # �¿� <> ����

print(u.replace('spam', 'egg').strip('<>')) # function chaining

u = 'spam and egg'
print(u.split()) # ���� �������� ���ڿ� �ڸ� (����Ʈ�� ��ȯ)
print(u.split('and')) # 'and' �������� ���ڿ� �ڸ� (����Ʈ�� ��ȯ)


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

# isdigit(): ��� ���ڿ����� ��������?
# isalpha(): ��� ���ڿ����� ����������?
# isalnum(): ��� ���ڿ����� ������ �Ǵ� ��������?
# islower(): ��� ���ڿ����� �ҹ�������?
# isupper(): ��� ���ڿ����� �빮������?

