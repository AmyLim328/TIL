-- [서브쿼리 (subquery)]

/* : SQL문 안에 SQL문
 * 
 * -- 메인쿼리
 * -- : 서브쿼리를 이용해서 기능 수행하는 영역
 * SELECT 열 이름
 * FROM 테이블 이름
 * WHERE 조건식 (SELECT 열 이름
 * 				FROM 테이블 이름
 * 				WHERE 조건식) -- 서브쿼리
 * */

-- [단일행 서브쿼리]
-- : single-row subquery
-- : 실행 결과가 하나의 행으로 나오는 서브쿼리
-- : 연산자 : 비교연산자

-- EX) 사원 이름이 'JONES'인 사원보다 급여가 높은 사원 조회

-- 1) 사원 이름이 'JONES'인 사원의 급여
SELECT SAL 
FROM EMP
WHERE ENAME = 'JONES';

-- 2) 2975 달러보다 급여가 높은 사원 조회
SELECT *
FROM EMP
WHERE SAL > 2975;

/* 코드에 상수 값이 들어가있을 경우 단점 !!
 * 1) JONES의 급여 변경 => 코드 수정이 많아짐 => 유지보수가 힘듦
 * 2) 독립적으로 사용할 수 없음 (1) + 2))
 *  SELECT *
	FROM EMP
	WHERE SAL > 2975;
 * */

-- => 하나의 쿼리문으로 합칠 수 있음!
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL 
			FROM EMP
			WHERE ENAME = 'JONES');
			
/* 특징
 * A. 서브쿼리는 ()를 통해 작성
 * B. 서브쿼리 열 이름은 메인쿼리의 비교 대상과 같은 자료형 / 개수를 가짐
 * C. 서브쿼리에서는 ORDER BY 사용 불가 
* */
			
-- Q1. 사원 이름이 ALLEN인 사원보다 추가 수당을 많이 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM
			FROM EMP
			WHERE ENAME = 'ALLEN');
			
/* 문제점
 * 1) 'ALLEN' 동명이인 
 * => 다중행 서브쿼리(multiple-row subquery) 사용
 * ↔ 단일행 서브쿼리 (single-row subquery)
 * 
 * 2) COMM이 NULL일 수도 있음
 * 
 * */
		
-- Q2. 사원 이름이 SMITH인 사원보다 추가 수당을 많이 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM
			FROM EMP
			WHERE ENAME = 'SMITH');
			
SELECT *
FROM EMP
WHERE COMM > (SELECT NVL(COMM, 0)
			FROM EMP
			WHERE ENAME = 'SMITH');
			
SELECT *
FROM EMP
WHERE COMM > (SELECT NVL2(COMM, COMM, 0)
			FROM EMP
			WHERE ENAME = 'SMITH');

-- Q3. 사원 이름이 SMITH인 사원보다 먼저 입사한 사원들의 목록 조회
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
			FROM EMP
			WHERE ENAME = 'SMITH');
			
SELECT *
FROM EMP
ORDER BY HIREDATE

-- [단일행 서브쿼리 + 다중행 함수]
-- : 다중행 함수 (입력 여러 개 -> 출력 하나)

-- Q1. 사원 이름, 사원에 대한 부서 정보 출력 (JOIN)
-- 1) 사원 중에서 부서 20번에 속하는
-- 2) 전체 사원의 평균 급여가 넘는 

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, 
	D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE E.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL) FROM EMP); 

-- [다중행 서브쿼리]
-- : multiple-row subquery
-- : 실행 결과가 여러 개의 행이 나오는 서브쿼리
-- : 단일행 서브쿼리 연산자 (비교 연산자 (<, <=, >, >=)) 사용 불가

-- 다중행 연산자
-- 1) IN 연산자
SELECT * 
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;

SELECT * 
FROM EMP
WHERE DEPTNO IN (20, 30);

-- Q1. 각 부서별 최고 급여를 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
				FROM EMP
				GROUP BY DEPTNO);
				
SELECT * 
FROM EMP
WHERE SAL = 2850 OR SAL = 3000 OR SAL = 5000;
			
-- 2) ANY, SOME 연산자
-- : ANY == SOME 완전히 일치 (바꿔 쓸 수 있음)
-- : 서브쿼리의 결과값 중 하나라도 true면 true 반환하는 연산자
SELECT * 
FROM EMP 
WHERE SAL = ANY (SELECT MAX(SAL)
				FROM EMP
				GROUP BY DEPTNO);
				
SELECT * 
FROM EMP 
WHERE SAL = SOME (SELECT MAX(SAL)
				FROM EMP
				GROUP BY DEPTNO);
-- IN()과 동일하게 실행 (= ANY(), = SOME())

-- EX) 30번 부서 사원들의 최대 급여보다 적은 급여 받는 사원 정보 출력
-- 1) 단일행 서브쿼리 + 다중행 함수
SELECT *
FROM EMP
WHERE SAL < (SELECT MAX(SAL)
					FROM EMP
					WHERE DEPTNO = 30);
-- 2)		
SELECT *
FROM EMP
WHERE SAL < SOME (SELECT MAX(SAL)
					FROM EMP
					WHERE DEPTNO = 30);
-- 3)
SELECT *
FROM EMP
WHERE SAL < SOME (SELECT SAL
					FROM EMP
					WHERE DEPTNO = 30);
					
-- SOME(950, 1250, 1500, 1600, 2850)
-- ()에 속한 값 중 최소 하나의 값이 조건식에 만족하면 true
-- SAL < 950 OR
-- SAL < 1250 OR
-- SAL < 1500 OR
-- SAL < 1600 OR
-- SAL < 2850
-- => 30번 부서 사원들의 최대 급여 (2850) 보다 적은 급여를 받는 사원 출력

SELECT *
FROM EMP
WHERE SAL > SOME (SELECT SAL
					FROM EMP
					WHERE DEPTNO = 30);
-- SAL > 950 OR
-- SAL > 1250 OR
-- SAL > 1500 OR
-- SAL > 1600 OR
-- SAL > 2850
-- => 30번 부서 사원들의 최소 급여 (950) 보다 많은 급여를 받는 사원 출력

-- 3) ALL 연산자
-- : 서브쿼리의 모든 결과가 조건식에 만족하면 출력
			
-- Q1.	부서 번호가 30번인 사원들의 최소 급여보다 더 적은 급여 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL < ALL (SELECT SAL
					FROM EMP
					WHERE DEPTNO = 30);
-- SAL < 950 AND
-- SAL < 1250 AND
-- SAL < 1500 AND
-- SAL < 1600 AND
-- SAL < 2850

-- Q2.	부서 번호가 30번인 사원들의 최대 급여보다 더 많은 급여 받는 사원 정보 출력
SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL
					FROM EMP
					WHERE DEPTNO = 30);
-- SAL > 950 AND
-- SAL > 1250 AND
-- SAL > 1500 AND
-- SAL > 1600 AND
-- SAL > 2850

-- 4) EXISTS 연산자
-- : 서브쿼리 결과 값이 하나 이상 존재하면 true
-- : 존재하지 않으면 false가 되는 연산자

SELECT * 
FROM EMP
WHERE EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO = 10);
-- DNAME ACCOUNTING 존재하기 때문에 true 반환

SELECT * 
FROM EMP
WHERE EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO = 40);
-- DNAME OPERATION 존재하기 때문에 true 반환

SELECT * 
FROM EMP
WHERE EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO = 50);
-- DEPTNO = 50인 DNAME 없음 => false 반환	

SELECT * 
FROM EMP
WHERE EXISTS(SELECT COMM FROM EMP WHERE COMM IS NULL);

SELECT * 
FROM EMP
WHERE EXISTS(SELECT JOB FROM EMP WHERE JOB = 'DEVELOPER');

-- 자주 사용 X
-- 서브쿼리 결과값의 존재 유무에 따라 메인쿼리의 데이터 노출 여부를 결정할 때 사용

-- Q1. 10번 부서에 속한 모든 사원들보다 일찍 입사한 사원 정보 출력
SELECT * 
FROM EMP
WHERE HIREDATE < ALL (SELECT HIREDATE
					FROM EMP
					WHERE DEPTNO = 10);

-- => 10번 부서 사원 입사날 중에서 가장 마지막으로 들어온 사원보다 먼저 입사한 사원 출력					
SELECT * 
FROM EMP
WHERE HIREDATE < ANY (SELECT HIREDATE
					FROM EMP
					WHERE DEPTNO = 10);
					
-- => 10번 부서 사원 입사날 중에서 가장 처음 들어온 사원보다 늦게 입사한 사원 출력					
SELECT * 
FROM EMP
WHERE HIREDATE > ANY (SELECT HIREDATE
					FROM EMP
					WHERE DEPTNO = 10);
					
-- => 10번 부서 사원 입사날 중에서 가장 마지막 들어온 사원보다 늦게 입사한 사원 출력
SELECT * 
FROM EMP
WHERE HIREDATE > ALL (SELECT HIREDATE
					FROM EMP
					WHERE DEPTNO = 10);

					      
SELECT *
FROM EMP
WHERE COMM > ALL(SELECT COMM
            FROM EMP
            WHERE DEPTNO = 10);
            
SELECT *
FROM EMP
WHERE COMM > ALL(1000, 2000, 3000); 
-- 3000 달러보다 많이 받는 사원 출력

SELECT *
FROM EMP
WHERE COMM < ALL(1000, 2000, 3000); 
-- 1000 달러보다 조금 받는 사원 출력

SELECT *
FROM EMP
WHERE COMM > ANY(1000, 2000, 3000); 
-- 1000 달러보다 많이 받는 사원 출력

SELECT *
FROM EMP
WHERE COMM < ANY(1000, 2000, 3000); 
-- 3000 달러보다 조금 받는 사원 출력

	
/* ALL, ANY/SOME
 * : ALL (교집합): 타이트한 조건 (조건이 참이기 어려움)
 * => >: 서브쿼리 안의 결과가 모두 다 만족 (다 커야 해!, 최댓값보다 커야 해)
 * => <: 서브쿼리 안의 결과가 모두 다 만족 (다 작아야 해!, 최솟값보다 작아야 해)
 * 
 * : ANY/SOME (합집합): 덜 다이트한 조건 (조건이 참이기 덜 어렵다)
 * => >: 서브쿼리 안의 결과가 하나만 만족 (최솟값보다만 크면 가능!)
 * => <: 서브쿼리 안의 결과가 하나만 만족 (최댓값보다만 작으면 가능!)
 * 
 * COMM IN (1000, 2000, 3000)
 * => 서브쿼리 결과 중에 하나만 만족
 * => "여기 중에 하나 동일하니?"
 * 
 * EXIST(SELECT DNAME FROM EMP DEPTNO = 40) => true
 * : 서브쿼리 연산 결과가 존재하면 메인쿼리 출력
 * EXIST(SELECT DNAME FROM EMP DEPTNO = 50) => false
 * : 서브쿼리 연산 결과가 존재하지 않으면 메인쿼리 출력 X
 * */

-- [다중열 서브쿼리]
-- : multiple-column subquery
-- : 메인쿼리의 WHERE절에 비교할 데이터를 여러 개 지정하는 방식 -- 1
-- : 서브쿼리의 SELECT절과 비교할 열을 괄호로 묶어 명시 -- 2
-- : 1번과 2번의 데이터 타입이 동일 (비교가 가능한 타입)

SELECT * 
FROM EMP 
WHERE COMM < ANY(1000, 2000, 3000);
-- => COMM < 3000

-- 그룹별 최대 급여를 받고 있는 사원 정보 출력
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
					FROM EMP
					GROUP BY DEPTNO);
-- 서브 쿼리의 결과행: 다중행, 다중열

-- (30, 2850): (DEPTNO = 30 AND SAL = 2850) OR
-- (20, 3000): (DEPTNO = 20 AND SAL = 3000) OR
-- (10, 5000): (DEPTNO = 10 AND SAL = 5000) 
					
-- [인라인 뷰 (inline view)]
-- : 전체 데이터가 아닌 일부 데이터를 추출하는 방식
-- : 추출된 결과로 만들어진 테이블 별칭을 주어 사용

-- 왜 쓸까요?
-- 1) 데이터 규모가 너무 클 때
-- 2) 원하는 일부 행과 열을 사용하고자 할 때

/* 형식)
 * WITH -- 인라인 뷰 생성
 * [별칭1] AS (SELECT문 1),
 * [별칭2] AS (SELECT문 2),
 * ...
 * [별칭n] AS (SELECT문 n)
 * SELECT
 * FROM 별칭1, 별칭2, ....
 */

-- => 가독성은 좋아짐
-- => 작성이 번거로움
-- => 메인쿼리랑 서브쿼리 분류하기엔 좋음					
WITH 
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

-- 서브쿼리를 FROM절에 작성할 수 있음
-- => 가독성 떨어짐
-- => FROM절이 길어지는 것을 방지하기 위해 WITH 구문 만듦
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
	 (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT 절에 서브쿼리를 작성할 수도 있음
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL,
	(SELECT DEPT.DNAME
	FROM DEPT
	WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME,
	(SELECT DEPT.DEPTNO
	FROM DEPT
	WHERE E.DEPTNO = DEPT.DEPTNO) AS DEPTNO
FROM EMP E;

