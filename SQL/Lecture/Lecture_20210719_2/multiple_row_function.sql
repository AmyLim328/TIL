-- [다중행 함수와 데이터 그룹화]
-- : 다중행 함수 + 데이터 그룹화

-- ● 다중행 함수 (multiple-row function)
-- : 그룹행 또는 복수행 함수
-- : 여러 행 (입력)을 바탕으로 하나의 결과 (출력)값으로 도출되는 함수
-- EX) AVG(), SUM(), COUNT(), MIN(), MAX()

-- ● 다중행 함수 특징
-- : 데이터 안에 NULL 포함 -> NULL 제외하고 계산
-- : 중복되는 데이터가 있으면 중복 허용 (ALL)

-- 1) SUM(): 합계

SELECT SUM(SAL)
FROM EMP;

SELECT SAL
FROM EMP;

SELECT SAL, SUM(SAL)
FROM EMP;
-- * ORA-00937 (** 자주 발생)
-- not a single-group function
-- 다중행 함수 (SUM(SAL))를 여러 행 (SAL)이 나올 수 있는 
-- 데이터/열 이름과 함께 명시하는 경우

SELECT SAL, SUM(SAL)
OVER()
FROM EMP;
-- 오류 발생 안함!
-- 데이터를 분석하기 위해 사용 (이후 학습!)
-- SUM() 함수를 분석하는 용도로만 사용하려면 OVER와 같이 작성할 수 있음

SELECT SUM(COMM)
FROM EMP;
-- 정상적으로 실행될까요 ? (COMM에 NULL값이 들어가 있음)
-- SUM(): 만약에 데이터에 NULL값이 존재하면 NULL을 제외하고 합계 구함
-- (결과값이 NULL이 나오는 것을 방지)

SELECT SUM(SAL), SUM(ALL SAL), SUM(DISTINCT SAL)
FROM EMP;
-- DISTINCT: SAL값 중에서 중복값 제외 (1250를 한번만 계산)
-- 아무런 키워드없이 사용 - SUM(ALL SAL) = SUM(SAL)

-- 형식) SUM([ALL/DISTINCT (선택)], [열/데이터])
--      OVER(분석을 위한 문법) (선택)
-- 기본값: ALL
-- DISTINCT: 중복 제거


-- Q1. EMP 테이블에서 DEPTNO가 30인 사원들의 근무 일수 총합
SELECT SUM(TRUNC(SYSDATE - HIREDATE)) AS SUM_WORKINGDAYS
FROM EMP
WHERE DEPTNO = 30;


-- 2) COUNT(): 개수
-- 형식) COUNT([ALL/DISTINCT (선택)], [열/데이터])
--      OVER(분석을 위한 문법) (선택)
-- 기본값: ALL
-- DISTINCT: 중복 제거
-- COUNT(*): 조건에 맞는 테이블 행 개수 반환

SELECT COUNT(*) AS NUMBEROFEMP
FROM EMP;

SELECT COUNT(SAL), COUNT(ALL SAL), COUNT(DISTINCT SAL) 
FROM EMP;

-- 1
SELECT COUNT(*)
FROM EMP
WHERE COMM IS NOT NULL;

-- 2
SELECT COUNT(COMM)
FROM EMP;
-- COUNT([열 이름]) 함수 사용할 때 
-- 열에 해당하는 데이터 중 NULL값이 있으면 NULL 제외한 후 개수를 반환
-- 1 = 2

-- 3) MAX(), MIN()
-- MAX(): 최댓값 반환
-- MIN(): 최솟값 반환

-- 형식) MAX([ALL/DISTINCT (선택)], [열/데이터])
--      OVER(분석을 위한 문법) (선택)

-- 형식) MIN([ALL/DISTINCT (선택)], [열/데이터])
--      OVER(분석을 위한 문법) (선택)

-- ALL/DISTINCT를
-- MAX(), MIN() 사용할 경우 ..?
-- => 결과가 같음 (사용 무의미함)

-- Q1. 부서 번호가 30인 사원들 중 제일 최근 입사일 출력 (MAX())
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 30;

-- Q2. 부서 번호가 10인 사원들 중 제일 오래된 입사일 출력 (MIN())
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 10;

-- 4) AVG()
-- : 평균값 반환
-- 형식) AVG([ALL/DISTINCT (선택)], [열/데이터])
--      OVER(분석을 위한 문법) (선택)
-- 기본값: ALL

SELECT AVG(SAL), AVG(ALL SAL), AVG(DISTINCT SAL)
FROM EMP;


-- ● GROUP BY절
-- : 데이터를 그룹으로 묶어서 출력
-- : 다중행 함수과 함께 사용해서 데이터를 하나의 결과로 출력
-- EX) 부서별로 평균 급여 산출
SELECT DEPTNO, AVG(SAL) OVER() FROM EMP WHERE DEPTNO = 10
UNION
SELECT DEPTNO, AVG(SAL) OVER() FROM EMP WHERE DEPTNO = 20
UNION
SELECT DEPTNO, AVG(SAL) OVER() FROM EMP WHERE DEPTNO = 30;
-- OVER() : 프로그래머들이 분석하기 위해 사용하는 함수
-- 코드가 복잡 (SELECT 3개 UNION)

SELECT * FROM EMP ORDER BY DEPTNO;

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO; 
-- 동작 순서
-- 1. DEPTNO 기준으로 데이터 묶음 (10, 20, 30 그룹별로 생각)
-- 2. 같은 그룹 (동일 DEPTNO)의 AVG를 구함
-- * GROUP BY의 기준에 해당하는 열 이름은 SELECT 문장에 작성할 수 있음
-- * 기준에 해당하는 열의 이름이 아니면 SELECT 문장에 작성할 수 없음 (SAL 오류!)
-- * GROUP BY 쓰실 때는 SELECT 부분도 확인 필요!

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-- 동작 순서
-- 1. DEPTNO 기준으로 데이터 묶음 (10, 20, 30 그룹별로 생각)
-- 2. 동일 DEPTNO를 가진 사원들 중에 JOB으로 다시 나눔
-- 3. 같은 그룹 (동일한 DEPTNO - 동일한 JOB)의 AVG를 구함

-- 출력 방법
-- DEPTNO를 기준으로 오름차순, JOB을 기준으로 오름차순

-- GROUP BY에서 조건식을 결정하는 HAVING절
-- : GROUP BY를 통해 그룹핑할 때 그룹에 대한 조건 추가

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB AS GROUP_STD
HAVING AVG(SAL) >= 2000 AS GROUP_FILTER 
ORDER BY DEPTNO, JOB;
-- GROUP 할 때 잠깐 쓰이는 GROUP BY, HAVING은 AS가 불가능!

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
-- ORA-00934: group function is not allowed here
WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;


/* HAVING절 형식
 * 
 * SELECT [열 이름], [열 이름] . . .
 * FROM [테이블 이름]
 * GROUP BY[그룹화할 열 (여러 개 지정 가능)]
 * HAVING [그룹화 조건식]
 * ORDER BY [정렬할 열]
 * */

/* WHERE VS HAVING 
 * - HAVING VS WHERE
   - HAVING 실행 순서: GROUP BY (기준 열 지정) -> HAVING (그룹 필터) -> 출력
   - WHERE 실행 순서: WHERE (행 필터) -> 출력
   - HAVING + WHERE: WHERE (행 필터) 
               -> GROUP BY (기준 열 지정) 
               -> HAVING (그룹 필터)
               -> 출력 
               >> WHERE절은 HAVING보다 먼저 실행
 * * 
 * */

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB 
HAVING AVG(SAL) >= 2000 
-- ORDER BY DEPTNO, JOB
MINUS
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000  -- 1
GROUP BY DEPTNO, JOB 
HAVING AVG(SAL) >= 2000 -- 2 
FROM EMP;
ORDER BY DEPTNO, JOB;

-- Q1. 같은 직책 (JOB)에 종사하는 사원이 3명 이상인 직책과 인원수 출력
-- 그룹 기준: 직책
SELECT JOB, COUNT(*) AS COUNT_SAME_JOB
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- Q2. 이름의 길이가 같은 사원별로 그룹핑해서 동일한 이름의 길이를 가진 이름 길이와 사원수 출력 
-- 그룹 기분 : 이름의 길이 LENGTH(ENAME)
SELECT LENGTH(ENAME), COUNT(*) AS COUNT_SAME_LENGTH_ENAME
FROM EMP
GROUP BY LENGTH(ENAME);

-- Q3. 사원의 입사일 (HIREDATE)를 기준으로 입사연도 (HIREYEAR)를 구하고 해당 연도에 부서별 몇 명이 입사했는 지 출력
-- 그룹 기준 입사연도 HIREYEAR, 부서

-- HIREDATE : DATE -> CHAR
-- DATE -> NUMBER (바로 형 변환 불가)
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIREYEAR, 
		DEPTNO, COUNT(*) AS COUNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
-- GROUP BY, HAVING절은 AS 별칭 지정할 수 없음!

-- Q4. 부서별 추가수당을 받는 사원 수 출력
-- 그룹 기준 : 부서, 추가수당 여부
SELECT DEPTNO, COUNT(*) AS GOT_COMM
FROM EMP
WHERE COMM IS NOT NULL AND COMM > 0
GROUP BY DEPTNO;

-- Q4-1. 부서별 추가수당 여부에 따른 사원 수 출력
-- 추가수당 0 포함
SELECT DEPTNO, NVL2(COMM, 'O', 'X') AS ISCOMM, COUNT(*) AS COUNT
FROM EMP
GROUP BY DEPTNO, NVL2(COMM, 'O', 'X')
ORDER BY DEPTNO, NVL2(COMM, 'O', 'X');

-- 추가수당 0 제외 (DECODE(), CASE절)
-- DECODE()
-- 1) COMM = NULL (X) => COMM IS NULL
-- 2) 반환되는 값의 데이터 타입 달라도 내부적으로 암시적 형 변환 (만약 가능하면)
-- NUMBER, NUMBER, '1111' => 1111
-- => 유지 보수가 힘듦
-- => DECODE() -> CASE절 대체
SELECT DEPTNO, DECODE(COMM, 0, 'X', NULL, 'X', 'O') AS ISCOMM, COUNT(*) AS COUNT
FROM EMP
GROUP BY DEPTNO, DECODE(COMM, 0, 'X', NULL, 'X', 'O')
ORDER BY DEPTNO, DECODE(COMM, 0, 'X', NULL, 'X', 'O');

-- CASE
SELECT DEPTNO, (CASE
					WHEN COMM = 0 THEN 'X'
					WHEN COMM IS NULL THEN 'X'
					ELSE 'O'
				END) AS ISCOMM,
		COUNT(*) AS COUNT
FROM EMP
GROUP BY DEPTNO, (CASE
						WHEN COMM = 0 THEN 'X'
						WHEN COMM IS NULL THEN 'X'
						ELSE 'O'
					END)
ORDER BY DEPTNO, (CASE
						WHEN COMM = 0 THEN 'X'
						WHEN COMM IS NULL THEN 'X'
						ELSE 'O'
					END);

-- CASE 2		
-- 실행되지만 좋은 방법은 아님
-- NULL은 따로 빼주는 것이 좋음
SELECT DEPTNO, (CASE
					WHEN COMM > 0 THEN 'O'
					ELSE 'X'
				END) AS ISCOMM,
		COUNT(*) AS COUNT
FROM EMP
GROUP BY DEPTNO, (CASE
						WHEN COMM > 0 THEN 'O'
						ELSE 'X'
					END)
ORDER BY DEPTNO, (CASE
						WHEN COMM > 0 THEN 'O'
						ELSE 'X'
					END);					
				

-- Q5. 추가수당 (COMM)을 받는 사원수와 받지 않는 사원수 출력
-- 그룹 기준: 추가 수당 여부

SELECT NVL2(COMM, 'O', 'X') AS ISCOMM, COUNT(*) AS COUNT
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

SELECT * FROM EMP;

-- Q5-1. 추가수당 (COMM)을 받는 사원수와 받지 않는 사원수 출력 (0도 포함하려면 ?)
-- 그룹 기준

SELECT (CASE 
      WHEN COMM IS NULL THEN 'X'
      WHEN COMM = 0 THEN 'X'
      ELSE 'O'
     END) AS ISCOMM, COUNT(*) AS COUNT
FROM EMP
GROUP BY (CASE 
      WHEN COMM IS NULL THEN 'X'
      WHEN COMM = 0 THEN 'X'
      ELSE 'O'
     END);

