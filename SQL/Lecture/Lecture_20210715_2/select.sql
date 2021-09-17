-- EMP 테이블

-- NAME			NULL		TYPE
-----------------------------------
-- EMPNO		NOT NULL 
-- (사원 번호)

-- ENAME
-- (사원 이름)

-- JOB
-- (직책)

-- MGR (MANAGER)
-- (매니저의 사원 번호)

-- HIREDATE
-- (입사일)

-- SAL
-- (급여)

-- COMM (COMMISSION)
-- (추가 수당)

-- DEPTNO
-- (부서 번호)


-- 1) SELECT절과 FROM절 (SELECT ~~~ FROM ~~~~)
-- : 데이터를 조회
-- SELECT [열1 이름], [열2 이름]... [열N 이름]
-- FROM [조회할 테이블 이름]; (**)

-- a. EMP 테이블 중 EMPNO만 확인
-- b. EMP 테이블 중 EMPNO, ENAME, DEPTNO 확인

SELECT * FROM EMP;
SELECT EMPNO FROM EMP;
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- 2) SELECT DISTINCT ~~~ FROM ~~~ (중복 데이터 삭제)
-- : SELECT문으로 데이터 조회한 후 DISTINCT 중복 데이터 삭제

SELECT DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

-- 열 여러 개인 경우에 (DEPTNO, JOB) 둘 다 일치해야만 중복 제거
SELECT DISTINCT DEPTNO, JOB FROM EMP;

-- 중복 제거 없이 출력
SELECT DEPTNO FROM EMP;
SELECT ALL DEPTNO FROM EMP;

-- SELECT문 + 연산식
SELECT * FROM EMP;
SELECT ENAME, SAL, COMM, SAL*12+COMM FROM EMP;

-- 연산식 대신에 별칭 (alias, as)
SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNUALSAL FROM EMP;
SELECT ENAME, SAL, COMM, SAL*12+COMM AS "ANNUALSAL" FROM EMP;
-- ex) String sql = 
-- "SELECT ENAME, SAL, COMM, SAL*12+COMM AS "ANNUALSAL" FROM EMP";

-- 별칭을 사용하는 이유 ?
-- A. 가독성, 불편함
-- B. 정보보안
