#-*- coding: euc-kr -*-#

# 파이썬 클래스

class S1:
    pass # 변수, 함수 정의가 없음 (body가 비어있는 클래스)


class S: # header
    a = 1 # body

    # constructor (생성자)
    def __init__(self, a=None):
        if a:
            self.a = a
            print("constructor")
        else:
            print("constructor")

    # destructor (소멸자)
    def __del__(self):
        print("destructor")

    # toString()
    def __str__(self):
        return "a : " + str(self.a) # str + str(int)  

    # getter, setter
    def setA(self, a): # self: 인스턴스 자신의 레퍼런스를 가지고 있음
        print(self)
        self.a = a
    
    def getA(self):
        print(self)
        return self.a

    @staticmethod # decorator (장식자)
    def method(x, y):
        print('static method : ', x, y)



# 클래스이름.변수이름 직접 접근 
print(S.a) # static variable
S.a = 2
print(S.a)

# 객체를 만들어서 객체이름.변수이름으로 접근
instance1 = S()
print(instance1.a) # instance variable
instance1.a = 3
print(instance1.a) # 3
print(S.a) # 2


# 객체를 만들어서 객체이름.변수이름으로 접근
instance2 = S()
print(instance2.a) # instance variable
instance2.a = 10
print(instance2.a) # 10
print(instance1.a) # 3
print(S.a) # 2

instance3 = S()
# setter
instance3.setA(10) # self => instance3
# getter
res = instance3.getA() # self => instance3
print(res)

# 위의 코드는 아래와 동일
S.setA(instance3, 10)
res = S.getA(instance3)
print(res)

instance4 = S(20)
print(instance4)

###################################################

# class inheritance (상속)

class Person:
    def __init__(self, name, phone):
        self.name = name
        self.phone = phone
    def __str__(self):
        return "<Person {0} {1}>".format(self.name, self.phone)

class Employee(Person): # extends Person (java)
    def __init__(self, name, phone, position, salary):
        super().__init__(name, phone)
        self.position = position
        self.salary = salary

    def __str__(self):
        # \ : 코드의 길이가 길어질 때 코드의 연장을 위해 사용
        return super().__str__().replace("Person", "Employee")[:-1] \
        + " {0} {1}>".format(self.position, self.salary)

# <Person eunbin 1234> -> <Employee eunbin 1234 lecturer 3000>

p = Person("eunbin", "1234")
e = Employee("eunbin", "1234", "lecturer", "3000")
print(p)
print(e)

###################################################
# 다형성 (polymorphism)
# 상속 관계 내에서 다른 클래스들의 인스턴스들이 
# 같은 멤버 함수를 호출해도
# 각각 다르게 반응하는 기능
# ex) 함수의 오버로딩도 다형성 중에 하나
def add(a, b): # str (문자열 결합), int (수치 연산)
    return a + b 

# parent -> {child, child, child ...}

class Animal:
    def cry(self):
        print('....')

class Dog(Animal):
    def cry(self):
        print('멍멍!')

class Cat(Animal):
    def cry(self):
        print('야옹~')

ani = [Dog(), Cat()] # Dog, Cat 객체가 리스트에 순차적으로 저장

for i in ani:
    i.cry()


