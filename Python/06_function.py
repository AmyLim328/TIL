#-*- Encoding: UTF-8 -*-#

# �Լ� (����, ������)
def add(a, b=1): # ����Ʈ �� ���� ����
    #print("a :", a, ", b: ", b)
    return a + b

res = add(3, 5)
print(res)

print(add(3, 5))
print(add(a=3, b=5)) # ���� �̸��� �Բ� ���� �� ���� ����
print(add(b=5, a=3)) # ���� �̸��� �Բ� ���� �� ���� ����
print(add(10))
print(add("abc", "def"))

# �� �� �̻��� ���� ��ȯ�� �� ���� (Ʃ�� ���·� ��ȯ)
def arithCalc(x, y):
    return x + y, x - y

res = arithCalc(3, 5)
print(type(res))
print(res[0]) # +
print(res[1]) # -

plus, minus = arithCalc(3, 5)
# plus = res[0]
# minus = res[1]
print(plus)
print(minus)

