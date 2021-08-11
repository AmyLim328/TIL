/* 객체 (object) 종류
 * 
 * - 테이블 (table): 데이터 저장 공간
 * - 데이터 사전 (data dictionary)
 * - 인덱스 (index)
 * - 뷰 (view)
 * - 시퀀스 (sequence)
 * - 동의어 (synonym)
 * 
 * */

-- [데이터 사전]
-- DB 운영하는데 중요한 데이터 보관
-- 문제가 생기면 DB 사용 불가능
-- 데이터 사전 뷰 (view)로 열람
-- ※ 뷰 (view): 테이블 일부/전체를 가상의 테이블로 볼 수 있게 객체

-- USER_XXXX: DB 접속 중인 사용자 객체 정보
-- ALL_XXXX: 모두 사용 가능한 객체 정보
-- DBA_XXXX: DB 관리/운용을 위한 정보 
      -- (SYSTEM, SYS와 같은 DBA 열람 가능)
-- V$_XXXX: DB 성능 관련 (X$_XXXX 테이블 뷰)

-- SCOTT 계정에서 사용 가능한 데이터 사전
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

SELECT * FROM DBA_USERS;


-- USER_: SCOTT이 가지고 있는 객체
SELECT TABLE_NAME
FROM USER_TABLES;

-- ALL_: SCOTT 계정이 볼 수 있는 모든 객체
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- DBA_: DBA을 가진 사용자만 볼 수 있는 객체
-- SCOTT DBA 권한이 없는 경우에는 TABLE DOES NOT EXIST!
-- "나는 테이블이 있지만 넌 볼 수 없어!"
SELECT *
FROM DBA_TABLES;

-- DBA 권한을 가지고 있는 유저 확인
SELECT *
FROM DBA_USERS;


-- [인덱스 (index)]
-- : DB에서 데이터 검색 성능 향상
-- "INDEX SCAN" (인덱스를 통해 데이터 확인)
-- VS "TABLE FULL SCAN" (전부 다 확인)

-- 테이블에 인덱스는 누굴까요 ?
-- => 기본키 (primary key)

-- SCOTT 계정이 가진 인덱스 정보 확인
-- 인덱스가 속한 테이블 검색 
SELECT *
FROM USER_INDEXES;

-- 인덱스가 지정한 열 이름 확인
SELECT *
FROM USER_IND_COLUMNS;

-- * 인덱스 열을 따로 지정하지 않으면
-- 기본키로 자동으로 생성

-- 1) 인덱스 생성
/* 형식)
 * 
 * CREATE INDEX 인덱스 이름
 * ON 테이블 이름 (열 이름1 ASC OR DESC, -- 기본: ASC
 *             열 이름2 ASC OR DESC,
 *             ...
 *             열 이름N ASC OR DESC)
 * 
 * */
SELECT * FROM EMP;

CREATE INDEX IDX_EMP_ENAME
ON EMP(ENAME);

SELECT * FROM USER_IND_COLUMNS;

-- SAL, COMM 인덱스로 지정 (IDX_EMP_SAL_COMM)
CREATE INDEX IDX_EMP_SAL_COMM
ON EMP(SAL, COMM);

-- 인덱수 추가: CREATE
-- 인덱스 삭제: DROP
-- 인덱스 수정: ALTER

/* 인덱스 사용 장점 
 * : 데이터 조회 속도 (SELECT) 향상
 * : 시스템의 부하 줄일 수 있음
 * : 사이즈가 큰 테이블에 좋음
 * : 추가/수정/삭제 자주 발생하지 않은 열
 * : JOIN, WHERE에 자주 사용되는 열
 * 
 * 인덱스 사용 단점
 * : 추가 작업이 필요
 * : 인덱스를 위한 저장공간이 따로 필요 (10%)
 * : 인덱스 잘못 사용할 경우 성능 오히려 역효과
 * */

-- CREATE, DELETE ('사용하지 않음'), UPDATE
-- 가 빈번한 속성에 인덱스 사용하게 되면
-- 인덱스의 크기가 커짐





-- 1) 뷰 생성
-- : 뷰 생성 권한 (SCOTT 뷰 생성 권한을 줘야 함)
-- sqlplus 
-- system/oracle
-- grant create view to scott;
-- exit

/* 형식)
 * CREATE [OR REPLACE] [FORCE | NOFORCE] 
 * VIEW 뷰 이름
 * (열 이름1, 열 이름2 ...)
 * AS (SELECT 문장) 
 * 
 * [WITH CHECK OPTION (CONSTRAINT 제약조건) (선택)]
 * [WITH READ ONLY (CONSTRAINT 제약조건) (선택)]
 * 
 * * OR REPLACE: 같은 이름이 존재할 경우 뷰 대체 (선택)
 * * FORCE: SELECT문 기반 테이블이 없어도 강제 생성 (선택)
 * * NOFORCE: SELECT문 기반 테이블이 없어도 강제 생성 X (기본값) (선택)
 * * 뷰 이름: 생성할 뷰 이름 지정 (필수)
 * * 열 이름: SELECT문 명시된 이름 대신 사용할 열 이름 지정 (생략 가능, 선택)
 * * 저장할 SELECT문: 생성할 뷰에 저장할 SELECT문 (필수)
 * * WITH CHECK OPTION: DML 작업 가능하도록 뷰 생성 (선택)
 * * WITH READ ONLY: 뷰 열람만 가능하도록 뷰 생성 (선택)
 * */

-- 뷰 생성
SELECT * FROM EMP;

CREATE VIEW VW_EMP 
AS (SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP);

 -- USER_VIEWS 데이터 사전 조회
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP;
		
-- 뷰 삭제 (=> EMP 테이블 삭제되는 건 아님!)
DROP VIEW VW_EMP;

SELECT * FROM USER_VIEWS;

-- Q1. 뷰 (VW_EMP) 생성
-- EMPNO, ENAME, HIREDATE => NO, NAME, HDATE (뷰 열 이름 변경)
-- WITH READ ONLY
-- EMPNO, ENAME, HIREDATE (1500 <= SAL <= 2500)

CREATE OR REPLACE VIEW VW_EMP (NO, NAME, HDATE)
AS (SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE SAL BETWEEN 1500 AND 2500)
WITH READ ONLY; - SELECT만 가능한 뷰 생성 (뷰 열람만 가능)

SELECT * FROM VW_EMP;

-- Q2. 뷰 (VW_EMP) 생성
-- 동일한 이름이 있다면 REPLACE 옵션을 통해 VW_EMP 현재 뷰로 생성
-- WITH CHECK OPTION (DML 사용 가능)
-- SMITH보다 연봉 (SAL * 12 + COMM)을 
-- 조금 받는 EMPNO, ENAME, SAL 열을 가진 뷰 생성

-- WITH CHECK OPTION 기능은 VIEW에 DML 사용 가능
-- 1) 뷰에 데이터 삽입 테스트 해보기 (2021, GILDONG, 1000) -- ERROR
-- 2) 뷰에 데이터 삽입 테스트 해보기 (2025, GILSUN, 500) -- ERROR

CREATE OR REPLACE VIEW VW_EMP
AS (SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL * 12 + NVL(COMM, 0) < (SELECT SAL * 12 + NVL(COMM, 0) FROM EMP WHERE ENAME = 'SMITH'))
WITH CHECK OPTION; -- DML 데이터 조작 가능! (조건절 만족하면)

INSERT INTO VW_EMP
VALUES (2021, 'GILDONG', 1000); -- 조건절 만족 X

INSERT INTO VW_EMP
VALUES (2022, 'GILSOON', 500);

-- 3) 인라인 뷰를 이용한 TOP-N SQL문
-- : 인라인 뷰 (inline view) (VS뷰)
-- : 일회성으로 만들어서 사용하는 뷰 (WITH ~~ AS ~~)

-- 1-1. 인라인 뷰 + ROWNUM 사용
SELECT ROWNUM, E.*
FROM EMP E;

-- 의사 열(PSEUDO COLUNM) (ROWNUM) 
-- 실제 테이블에 존재하지는 않지만 특수 목적을 위해서 열처럼 사용

-- cf) 의사 코드 (PSEUDO CODE)
-- : 실제 코드는 아니고 알고리즘(방법)을 표현하기 위한 언어

-- 급여가 높은 상위 3명 데이터 출력 (ROWNUM 이용)
-- 인라인 뷰 (WHERE) => 가독성 떨어짐
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

-- 인라인 뷰 (WITH ~ AS) => 가독성 높임
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 3;

-- Q1. 사원의 매니저의 입사일이 최근인 5명 추출
WITH E AS (SELECT * FROM EMP E1 JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E2.HIREDATE DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 5;

-- Q2. COMM이 NULL인 사람들 중에 EMPNO가 높은 사람 3명 추출
WITH E AS (SELECT * FROM EMP WHERE COMM IS NULL ORDER BY EMPNO DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 3;