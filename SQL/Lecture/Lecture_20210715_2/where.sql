-- 1) WHERE절
-- : SELECT문으로 데이터를 조회할 때 특정 조건을 기준으로 원하는 행 출력

-- 형식
-- SELECT [열1 이름], [열2 이름]... [열N 이름]
-- FROM [조회할 테이블 이름] 
-- WHERE [조회할 행 선별하기 위한 조건식];

SELECT * FROM EMP;

-- : EMP 테이블에서 부서 번호 (DEPTNO) 30인 행 조회
SELECT * FROM EMP WHERE DEPTNO = 30;

-- : EMP 테이블에서 부서 번호 (DEPTNO) 30인 아닌 행 조회
SELECT * FROM EMP WHERE DEPTNO != 30; -- ISO 표준 X
SELECT * FROM EMP WHERE DEPTNO <> 30; -- ISO 표준 O
-- 부서 번호가 30 초과거나 미만 (30이 아닌 행 조회)

-- 2) AND, OR 연산자
-- : WHERE문에 조건식 추가
SELECT * FROM EMP WHERE DEPTNO = 30 AND JOB = 'salesman'; -- 검색 X
select * from emp where deptno = 30 and job = 'SALESMAN'; -- 검색 가능
-- <주의!>
-- SQL 문장은 대소문자 구별 X
-- 테이블 안의 문자(열) 데이터는 대소문자 구별

SELECT * FROM EMP;
-- 실습)
-- EMP 테이블에서
-- 사원 번호가 7499이고 (AND) 부서 번호가 30인 
-- 사원 번호, 사원 이름, 부서 번호만 나오도록 출력

SELECT EMPNO, ENAME, DEPTNO 
FROM EMP 
WHERE EMPNO = 7499
AND DEPTNO = 30;

-- EMP 테이블에서
-- 부서 번호가 20이거나 (OR) 직업이 SALESMAN인
-- 사원 번호, 사원 이름, 부서 번호, 직업이 나오도록 출력

SELECT EMPNO, ENAME, DEPTNO, JOB 
FROM EMP 
WHERE DEPTNO = 20
OR JOB = 'SALESMAN';


-- 3) 연산자 종류
-- a. 논리 연산자: AND, OR
-- b. 산술 연사자: +, -, *, /

SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL * 12 + COMM AS ANNSAL 
FROM EMP;
-- NULL?
-- 데이터가 없는 의미 (값이 없음)
-- 아직 확정되지 않은 값

-- NULL == 0 ??
-- NULL: 데이터 자체가 없음
-- 0: 데이터는 있는데 그 값이 0 의미

-- NULL + 1 = NULL
-- 무한대 + 1 = 무한대
-- NULL > 100 = NULL
-- NULL > NULL = NULL
-- 무한대 > 1000 = 무한대

-- * NULL이나 무한대는 어떤 산술/비교 연산을 만나도 각각 NULL, 무한대 나옴


SELECT * 
FROM EMP 
WHERE SAL * 12 = 36000;

-- c. 비교 연산자
-- >, <, >=, <=

SELECT *
FROM EMP
WHERE SAL > 3000;

-- 실습)
-- 급여가 2500 달러 이상이고 직업이 ANALYST인 
-- 사원 번호, 사원 이름, 급여, 직업 출력

SELECT EMPNO, ENAME, SAL, JOB
FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST'; 

SELECT *
FROM EMP
WHERE ENAME >= 'F';
-- 사전 순서로 문자열을 생각했을 때
-- 사원의 이름이 첫 문자가 F이거나 F보다 뒤쪽인 것만 검색

-- c. 논리 부정 연산자 (NOT)
-- : 조건의 결과 T -> F
-- :          F -> T
-- : 전체 조건문 반전시키는 연산자
-- : 일일이 조건문을 바꾸는 것보다 작성 시간이 줄어듦

SELECT *
FROM EMP
WHERE SAL != 3000;

SELECT *
FROM EMP
WHERE NOT SAL = 3000;

SELECT *
FROM EMP
WHERE SAL = 3000
AND JOB = 'SALESMAN';

SELECT * FROM EMP;

SELECT *
FROM EMP
WHERE SAL != 3000
OR JOB != 'SALESMAN';

SELECT *
FROM EMP
WHERE NOT (SAL = 3000
AND JOB = 'SALESMAN');

-- d. IN 연산자
-- : 특정 열에 해당하는 조건을 여러 개 지정할 수 있음

-- 조건식이 늘어날수록 조건식을 많이 사용 (JOB = )
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
OR JOB = 'SALESMAN'
OR JOB = 'CLERK';

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');


-- 형식)
-- SELECT [열1 이름], ... [열N 이름]
-- FROM [테이블 명]
-- WHERE 열 이름 IN (데이터 1, 데이터 2, ... 데이터 N);

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 비교 연산자
SELECT *
FROM EMP
WHERE JOB <> 'MANAGER' -- ISO 표준
AND JOB != 'SALESMAN'
AND JOB ^= 'CLERK';

-- 실습)
-- IN 연산자 이용해서 부서 번호가 20이거나 30인 사원 정보만 나오도록 코드 작성

SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30);

SELECT *
FROM EMP
WHERE DEPTNO NOT IN (20, 30);


-- e. BETWEEN A AND B 연산자
-- : 특정 범위 내에서 데이터 조회

-- EX) 급여가 2000 ~ 3000인 사원 조회
SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;


SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000; -- 2000, 3000 포함
-- BETWEEN A AND B: A <= SAL <= B

-- 실습)
-- 1)
-- 사원 정보 테이블에서 JOB이 'MANAGER'거나 (IN)
-- SAL가 2000 <=  <= 3000 사원 정보 조회 (BETWEEN AND)
SELECT * FROM EMP
WHERE JOB IN 'MANAGER'
OR SAL BETWEEN 2000 AND 3000;

-- 2)
-- NOT BETWEEN A AND B 연산자를 쓰지 않고
-- 사원 정보 테이블에서 급여 (SAL) 열 값이
-- 2000 이상 3000 이하 범위 이외 값 데이터 출력
SELECT * FROM EMP
WHERE SAL < 2000 OR SAL > 3000;

SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 3) 아픈 동물 찾기

-- 4) 어린 동물 찾기


-- g. LIKE 연산자와 와일드 카드
-- : 일부 문자열 (숫자나 문자)이 포함된 데이터 조회
-- : 데이터 조회시 와일드 카드 (Wild Card) 
-- >> 특정 문자(열) 대체하거나 
-- 문자열의 데이터 패턴을 표기하는 특수문자
-- >> 자바에서 와일드 카드는 '?'
-- 데이터의 형 지정되지 않음 (데이터 형 대체)
-- 1) _: 어떤 값이든 상관없는 한 개의 문자 데이터
-- 2) %: 길이와 상관없이 모든 문자 데이터

-- 사원 이름 중에서 첫 문자가 s로 시작하는 사원 정보 출력
-- s_: sa, sb, sc, ss, .....
-- s%: s, sa, sabc, ssss, sebfd

SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- 사원 중에서 해당 사원의 매니저 번호가 
-- 79로 시작되는 사원 정보 출력
SELECT *
FROM EMP
WHERE MGR LIKE '79%';

SELECT *
FROM EMP
WHERE MGR LIKE '79__';

-- 사원 이름 중에서 두 번째 글자가 L인 사원 데이터 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '_l%'; -- ?

select *
from emp
where Ename like '_L%';

-- 1) 사원 이름에 'E'라는 문자(열)을 포함하는 이름 검색
SELECT *
FROM EMP
WHERE ENAME LIKE '%E%';


-- 2) 입사일 2월인 사원 정보 검색 // ?

-- to_date(): 연도(2)/월(2)/일(2)
SELECT *
FROM EMP
WHERE HIREDATE LIKE '%/02/%';

-- Date 자료형에서 제공하고 있는 함수
SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') = 2;
-- DATE -> STRING/INT

SELECT *
FROM EMP
WHERE TO_CHAR(HIREDATE) LIKE '%02%';

-- 3) 사원 직책에 뒤에서 두번째 글자가 E인 사원 정보 검색
SELECT *
FROM EMP
WHERE JOB LIKE '%E_';

-- 4) 입사일 1981년이 아닌 사원 정보 검색 // ?
SELECT *
FROM EMP
WHERE HIREDATE NOT LIKE '81/%';

SELECT *
FROM EMP
WHERE NOT TO_CHAR(HIREDATE, 'YYYY') = 1981;

SELECT *
FROM EMP
WHERE NOT TO_CHAR(HIREDATE, 'YY') = 81;

-- * 만약에 와일드 카드 문자가 데이터 일부일 경우:
-- 데이터 자체에 _, % 포함
-- "A_A", "30%" >> 와일드 카드 (wild card?)
-- >> "gil\_dong" (\: escape 문자)
-- >> "30\%" (\: escape 문자)


-- g. IS NULL 연산자

SELECT *
FROM EMP
WHERE COMM = NULL; -- 불가능

-- COMM = NULL ?
-- NULL + 연산자 (비교/산술) => NULL

-- 특정 열 데이터가 NULL 구별하기 위해서 IS NULL 연산자 이용
SELECT ENAME, SAL*12+COMM AS ANNSAL
FROM EMP;

SELECT *
FROM EMP
WHERE COMM IS NULL;

SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

SELECT ENAME, SAL*12+COMM AS ANNSAL
FROM EMP
WHERE SAL*12+COMM IS NOT NULL;

-- 조건식에 NULL이 들어가지 않도록 조심!
SELECT *
FROM EMP
WHERE SAL > NULL
AND COMM IS NULL;

SELECT *
FROM EMP
WHERE SAL > NULL
OR COMM IS NULL;

-- i. 집합 연산자
-- : SELECT문을 통해 조회한 결과를 집합으로 표현 연산자

-- [UNION]
-- 합집합
-- 연산의 결과를 합집합으로 묶어줌
-- 출력하려고 하는 열 개수, 각 열의 자료형이 같아야 함

-- 1) 개수와 자료형이 모두 같지만 데이터가 다름
-- 2) 열은 첫번째 SELECT문 따라감
-- 3) 에러 X
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT SAL, ENAME, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- 1) 개수 다름 ==> 에러 발생!
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT SAL, ENAME, EMPNO
FROM EMP
WHERE DEPTNO = 20;

-- 1) 열 개수는 같음
-- 2) 데이터 자료형 순서가 다름 ==> 에러 발생!
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT ENAME, SAL, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- class Employee
-- public Employee(int id, int sal) {...}
-- public Employee(int sal, int id) {...}

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
-- 중복 제거 O

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
-- 중복 제거 X


-- [INTERSECT]
-- 교집합
-- 두 SELECT 문장의 결과 값이 같은 데이터만 출력

SELECT * FROM EMP;

-- SELECT 첫번째: 사원 정보 중에서 이름에 A가 들어가는 사원 출력
-- SELECT 두번째: 사원 정보 중에서 DEPTNO 30인 사원 출력

SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE '%A%'
INTERSECT
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 30;


-- [MINUS]
-- A
-- MINUS
-- B

-- A - B
-- 차집합
-- A의 결과 중 B에 존재하지 않은 데이터만 출력


-- WHY????
-- 1) 다른 테이블에서 사용 가능 

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'SALESMAN'
MINUS
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE ENAME LIKE '%T%';

-- i. 연산자 우선순위
-- WHERE절 조건식에 여러 연산자 사용 하는 경우
-- () 우선순위 제일 높음!



