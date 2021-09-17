-- [조인 (join)]
-- : 테이블을 결합하다

-- RDBMS (Relational DataBase Management System)
-- 테이블이 여러개로 쪼개져있는 특징 (테이블 간에 '관계' (외래키가 기본키가 되어서 검색!)를 지정함)
-- WHY?
-- 데이터의 중복을 제거하기 위해 (중복이 되면 중복된 데이터만큼 수정/삭제가 필요함)

SELECT * FROM TAB;
SELECT * FROM EMP;

-- 1) 조인 VS 집합 연산자 (UNION, INTERSECT, MINUS)

-- 집합 연산자 (두 SELECT문의 결과가 세로로 연결)
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%S%'
UNION
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%A%';

-- 조인 (두 테이블의 데이터가 가로로 연결)
/*
 * WHERE절 추가
 * >> 두 테이블을 연결할 조건을 지정
 * >> 외래키 (외부키) 조건 확률이 높음
 * 
 * */


-- 각 테이블의 동일한 열 이름 (열 이름이 외래키가 되는 경우)이 있다면 
-- 테이블 이름.열 이름 지정
-- 테이블 이름 별칭을 설정할 수 있음 (AS 없이 사용)

SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO; 
-- 하나밖에 없음! (EMP 테이블에)

-- SELECT *
-- => 조인이 될 경우에 출력하고자 하는 열 이름을 다 작성해주시는 게 좋음
-- => WHY?
-- 1) 동일한 열 이름이 있을 경우에 오류 방지
-- 2) SELECT 뒤에 문장만 보고서도 어떤 테이블에서 해당 열이 출력되는지 확인하기 좋음
-- ex) E.EMPNO: E 테이블에 EMPNO가 있구나!
-- => 해당 테이블의 구조 확인 좋음 (직접 내부 구조를 확인하지 않아도 유추할 수 있게)




-- 1) 등가 조인 (equal join) (= 내부 조인 (inner join), 단순 조인 (simple join))
-- : WHERE 조건 부에 '=' 연산자가 있을 경우
-- : '조인' == '등가 조인'

-- Q1. 사원 번호, 이름, 급여 (EMP 테이블), 근무 부서이름 (DNAME) (DEPT 테이블)을 함께 출력
--    급여가 3000 이상인 데이터만 출력

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL >= 3000;


-- Q2. 사원 번호, 이름, 급여 (EMP 테이블), 근무 부서이름 (DNAME) (DEPT 테이블)을 함께 출력
--    사원 번호의 앞 두 자리가 79로 시작 출력

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.EMPNO LIKE '79%';



-- Q3. 각 부서별 부서 번호, 부서 이름, (열 이름) 
-- 다중행 함수
-- 평균 급여 (소수점 2번자리까지 표현 (반올림)), 
-- 최대 급여, 최소 급여, 사원수를 출력
-- EMP, DEPT 테이블
SELECT * FROM EMP;
SELECT * FROM DEPT;


SELECT D.DEPTNO, DNAME,
		ROUND(AVG(SAL), 2) AS AVG_SAL,
		MAX(SAL) AS MAX_SAL,
		MIN(SAL) AS MIN_SAL,
		COUNT(*) AS CNT
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, DNAME;


/* 2) 비등가 조인 (non-equal join)
 * : 등가 조인이 아닌 방식
 * : 조인 조건이 특정 열의 일치 여부를 확인하는 것이 아닌 다른 방식 이용
 * 
 * */

SELECT * FROM SALGRADE;
-- 급여 등급 테이블

-- EX) 각 사원 정보에 대해 각 사원의 급여의 등급 출력
SELECT *
FROM EMP E, SALGRADE S
WHERE SAL >= LOSAL AND SAL <= HISAL;

SELECT *
FROM EMP E, SALGRADE S
WHERE SAL BETWEEN LOSAL AND HISAL;

SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;



/* 3) 자체 조인 (self join)
 *  : 같은 테이블을 조인하는 것
 *  : 별칭을 다르게 주어 논리적으로 다른 테이블인 것처럼 명시
 *  : EMP 테이블에서 사원에 대한 상사 번호 (MGR) 존재
 *  : 상사 번호에 대한 상사 이름을 나란히 출력
 * */

SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
	E2.EMPNO AS MGR_EMPNO,
	E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;
-- EMP 사원 12명 -> 11명
-- 조건에 만족하지 않은 경우가 있기 때문
-- => 조건에 NULL이 들어가는 경우 해당 사원 제외


/* 4) 외부 조인 (아우터 조인, outer join)
 * : 앞에서 MGR이 NULL인 경우 제외
 * : KING 사원은 PRESIDENT기 때문에 직속 상관이 없음
 * : 조인 조건식이 NULL을 가지기 때문에 제외
 * : KING의 직속 상관이 공백을 가지더라도 출력해주고 싶을 떄
 * 
 * : 조인 조건식에서 NULL이 나와도 강제로 출력
 * 
 * A. 왼쪽 외부 조인 (Left Outer Join)
 * >> WHERE TABEL1.COL1 = TABLE2.COL2(+)
 * 
 * B. 오른쪽 외부 조인 (Right Outer Join)
 * >> WHERE TABEL1.COL1(+) = TABLE2.COL2
 * 
 * C. 전체 외부 조인 (Full Outer Join)
 * >> 왼쪽 외부 조인, 오른쪽 외부 조인의 결과 합집합
 * 
 * 외부 조인 VS 내부 조인 (등가 조인)
 * 내부 조인: 외부 조인을 사용하지 않은 등가 조인 (데이터가 있을 때만 출력)
 * 
 * */

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
	E2.EMPNO AS MGR_EMPNO,
	E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
	E2.EMPNO AS MGR_EMPNO,
	E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+); -- 왼쪽 아우터 조인
-- 'E1.MGR' 값과 동일한 'E2.EMPNO'에 없어도 포함시키겠다
-- 해당 사원보다 상급자가 존재하지 않은 사원 출력


SELECT E1.EMPNO, E1.ENAME, E1.MGR,
	E2.EMPNO AS MGR_EMPNO,
	E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO; -- 오른쪽 아우터 조인
-- 'E2.EMPNO'이 'E1.MGR'에 없어도 포함시키겠다
-- 부하 직원이 없는 (말단 사원) 사람 출력



-- [SQL 표준 문법]
-- : 대부분의 RDBMS에서 사용할 수 있음 (호환성) (**)
-- : SQL-82 -> SQL-92 -> SQL-99 (9 버전부터)
-- : ISO/ANSI에서 지정

-- 1) 등가 조인
-- : NATURAL JOIN
-- : 조인 대상이 되는 두 테이블에서 이름, 자료형이 같은 열을 찾은 후
--   그 열을 기준으로 등가 조인

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
-- ** 동일한 열이 있다면 테이블 명을 붙여야 함!! **

SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E NATURAL JOIN DEPT D;
-- ** 표준 SQL에서는 기준 열에 테이블 명을 붙이면 오류 (DEPTNO) **

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;
-- 조인 조건식과 SELECT 조건식이 헷갈림

SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E NATURAL JOIN DEPT D
-- DEPTNO 열을 기준으로 조인하겠다! 명시하지 않아도 됨
WHERE SAL >= 3000;
-- SELECT 조건식이 헷갈리지 않음


-- JOIN ~ USING
-- : USING 키워드에 조인 기준으로 사용할 열 명시
-- : FROM TABLE1 JOIN TABLE2 USING (기준 열)

SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D USING (DEPTNO)
WHERE SAL >= 3000;

-- 오류 (기준 열에 테이블 이름 지정 불가)
SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D USING (E.DEPTNO)
WHERE SAL >= 3000;

-- JOIN ~ ON
-- : 많이 사용
-- : 조인 기준 조건식 ON 뒤에 명시
-- : 조인 조건식에 기준이 되는 열의 테이블 이름을 작성
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE SAL >= 3000;

-- 2) OUTER JOIN
-- : 외부 조인
-- : WHERE절이 아니라 FROM절에 조인 조건 작성
-- : 키워드 이용
-- : A. 왼쪽 아우터 조인 = LEFT OUTER JOIN
-- : B. 오른쪽 아우터 조인 = RIGHT OUTER JOIN
-- : C. 전체 아우터 조인 = FULL OUTER JOIN

-- A. 왼쪽 아우터 조인 
-- (사원 번호, 사원 이름, 매니저 번호, 매니저 이름)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- SQL-99 표준
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);




-- B. 오른쪽 아우터 조인
-- (사원 번호, 사원 이름, 매니저 번호, 매니저 이름)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO

-- SQL-99 표준
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);

-- C. 전체 아우터 조인
-- (사원 번호, 사원 이름, 매니저 번호, 매니저 이름)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO(+);
-- 지원 안함

SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
UNION
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- SQL-99 표준
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
		E2.EMPNO AS MGR_EMPNO,
		E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);



-- SQL-99 사용하는 이유?
-- 1) 간략, 명시적 (어떤 종류의 조인인지 확인 쉬움)
-- 2) 조인 조건식 (ON)과 출력 행을 결정하는 조건식 (WHERE)을 구별할 수 있음


-- 세 개 이상의 테이블 조인
/* [기존 SQL]
 * FROM TABLE1, TABLE2, TABLE3
 * WHERE TABLE1.COL = TABLE2.COL
 * AND TABLE2.COL = TABLE3.COL
 * 
 * [SQL-99]
 * FROM TABLE1 JOIN TABLE2 ON (조건식)
 * 			   JOIN TABLE3 ON (조건식)
 * 
 * */



-- (단 SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성하세요)
-- Q1 ~ Q4. 책에 있는 문제
-- Q1. 급여 (SAL) 가 2000 초과인 사원들의 
-- 부서 정보, 사원 정보를 같이 출력해 보세요.
-- DEPTNO, DNAME, EMPNO, ENAME, SAL
-- EMP 테이블: EMPNO, ENAME, SAL, DEPTNO
-- DEPT 테이블: DEPTNO, DNAME


-- 1) 비표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
AND E.SAL > 2000;
--ORDER BY DEPTNO;

-- 2) 표준 방식
-- 등가 조인 (NATURAL JOIN, JOIN USING (조인 기준 열 이름), JOIN ON (조인 조건식))
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE E.SAL > 2000;


-- Q2. 오른쪽과 같이 
-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력해 보세요.
-- 부서의 부서 번호, 부서 이름 (DEPT)
-- 급여 (EMP)
-- GROUP BY DEPTNO, DNAME

-- 1) 비표준 방식
SELECT D.DEPTNO, D.DNAME,
	TRUNC(AVG(SAL)) AS AVG_SAL,
	MAX(SAL) AS MAX_SAL,
	MIN(SAL) AS MIN_SAL,
	COUNT(*) AS CNT
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;


-- 2) 표준 방식
SELECT DEPTNO, D.DNAME,
	TRUNC(AVG(SAL)) AS AVG_SAL,
	MAX(SAL) AS MAX_SAL,
	MIN(SAL) AS MIN_SAL,
	COUNT(*) AS CNT
FROM EMP E JOIN DEPT D USING (DEPTNO) -- 괄호 생략 불가!
GROUP BY DEPTNO, D.DNAME;


-- Q3. 모든 부서 정보와 사원 정보를 오른쪽과 같이 
-- 부서 번호, 사원 이름순으로 정렬하여 출력해 보세요.
-- 부서 정보 (DEPT)
-- 사원 정보 (EMP)

SELECT D.DEPTNO, D.DNAME, E.ENAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT DEPTNO, DNAME
FROM DEPT;
SELECT DEPTNO
FROM EMP;

-- 가능한 경우에 따라 40번에 모든 사원 정보 다뜸 (CROSS JOIN, 데카르트 곱)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
OR D.DEPTNO = 40;
--ORDER BY D.DEPTNO, E.ENAME;

-- 1) 비표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

-- 2) 표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;



-- Q4. 다음과 같이 모든 부서 정보, 사원 정보, 급여 등급 정보, 
--     각 사원의 직속 상관의 정보를 
--     부서 번호, 사원 번호 순서로 정렬하여 출력해 보세요.
-- 1) 비표준 방식
-- 2) 표준 방식 (먼저)

SELECT * FROM EMP; -- E
SELECT * FROM DEPT; -- D
SELECT * FROM SALGRADE; -- S

-- 1) E - D (RIGHT OUTER JOIN)
-- 2) E - S (LEFT OUTER JOIN)
-- 3) E - E1 (LEFT OUTER JOIN)
-- (매니저가 없어도 출력)

-- 비표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL,
	E.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) = D.DEPTNO 
	AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
	AND E.MGR = E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO;



-- SQL-99 표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL,
	E.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, 
	E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E RIGHT OUTER JOIN DEPT D
			ON (E.DEPTNO = D.DEPTNO)
		   LEFT OUTER JOIN SALGRADE S
		 	ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
		   LEFT OUTER JOIN EMP E2
		 	ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO;



-- Q5. JOIN ~ USING 키워드를 이용해서 등가조인 작성
-- 조건 1. EMP 테이블과 DEPT 테이블의 조인 조건은 
-- 부서 번호 (DEPTNO) 같을 때
-- 조건 2. 급여는 3000 이상이며 매니저가 반드시 있어야 함
-- 조건 3. 출력 순서는 DEPTNO 오름차순, EMPNO 내림차순

-- 1) 표준 방식
-- JOIN ~ ON ()
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DEPTNO, E.SAL, E.MGR
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO) -- 조인 조건식 
WHERE E.SAL >= 3000 AND E.MGR IS NOT NULL
ORDER BY E.DEPTNO, E.EMPNO DESC;

-- JOIN ~ USING ()
SELECT E.EMPNO, E.ENAME, DEPTNO, E.SAL, E.MGR
FROM EMP E JOIN DEPT D USING (DEPTNO) -- 기준 열 이름 (조건식 X) 
WHERE E.SAL >= 3000 AND E.MGR IS NOT NULL
ORDER BY DEPTNO, E.EMPNO DESC;

-- NATURAL JOIN
-- 등가조인 
-- 기준 열을 작성하지 않아도 두 테이블에서 공통된 열 (이름, 자료형) 찾음
-- 기준 열에 테이블 이름 작성 X
SELECT E.EMPNO, E.ENAME, DEPTNO, E.SAL, E.MGR
FROM EMP E NATURAL JOIN DEPT D
WHERE E.SAL >= 3000 AND E.MGR IS NOT NULL
ORDER BY DEPTNO, E.EMPNO DESC;


-- 2) 비표준 방식
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DEPTNO, E.SAL, E.MGR
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO -- 조인 조건식 
AND E.SAL >= 3000 AND E.MGR IS NOT NULL
ORDER BY E.DEPTNO, EMPNO DESC;
