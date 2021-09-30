#-*- coding: euc-kr -*-#

# 예외 처리 (exception handling)
# try/except/else/finally


"""
try:
    예외 발생 가능한 문장
except Exception:
    예외 발생시 수행할 문장
else:
    예외 발생하지 않았을 때 수행할 문장
finally:
    예외 발생 유무 관계없이 무조건 수행할 문장

"""

try:
    print(1 / 0)
except ZeroDivisionError as e:
    print(e)

try:
    a()
except NameError as e:
    print(e)

try:
    a = 1
    print(1 / 0) # ZeroDivisionError
    b() # NameError
    print('2' + 2) # str + int (x) # TypeError
except ZeroDivisionError as e:
    print(e)
except NameError as e:
    print(e)
except TypeError as e:
    print(e)
except Exception as e:
    print(e)
else:
    print('success!')
finally:
    print('finally')


# IOError (파일 예외처리)
try:
    with open('test.txt', 'r') as f:
        s = f.read()
        print(s)
except IOError as e:
    print(e)


# 예외 발생
a = 10
b = 0
try:
    if(b == 0):
        raise ArithmeticError('0으로 나누고 있습니다!')
    a / b
except ArithmeticError as e:
    print(e)