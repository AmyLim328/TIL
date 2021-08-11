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
