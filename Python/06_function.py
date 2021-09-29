#-*- coding: euc-kr -*-#

# 함수 (재사용, 가독성)
def add(a, b=1): # 디폴트 값 지정 가능
    #print("a :", a, ", b: ", b)
    return a + b

res = add(3, 5)
print(res)

print(add(3, 5))
print(add(a=3, b=5)) # 인자 이름과 함께 인자 값 전달 가능
print(add(b=5, a=3)) # 인자 이름과 함께 인자 값 전달 가능
print(add(10))
print(add("abc", "def"))

# 두 개 이상의 값을 반환할 수 있음 (튜플 형태로 반환)
def arithCalc(x, y):
    return x + y, x - y

res = arithCalc(3, 5)
print(type(res)) # tuple
print(res[0]) # +, 8
print(res[1]) # -, -2

plus, minus = arithCalc(3, 5)
# plus, minus = res # tuple unpacking

# plus = res[0]
# minus = res[1]

print(plus)
print(minus)

