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
 * 				열 이름2 ASC OR DESC,
 * 				...
 * 				열 이름N ASC OR DESC)
 * 
 * */
SELECT * FROM EMP;

CREATE INDEX IDX_EMP_ENAME
ON EMP(ENAME);

SELECT * FROM USER_IND_COLUMNS;

-- SAL, COMM 인덱스로 지정 (IDX_EMP_SAL_COMM)
CREATE INDEX IDX_EMP_SAL_COMM
ON EMP(SAL, COMM);

SELECT * FROM USER_IND_COLUMNS;


-- 인덱스 삭제
-- 형식) DROP INDEX 인덱스 이름;
DROP INDEX IDX_EMP_SAL_COMM;
SELECT * FROM USER_IND_COLUMNS;

DROP INDEX IDX_EMP_ENAME;

-- 인덱스 추가: CREATE
-- 인덱스 삭제: DROP
-- 인덱스 이름 변경: ALTER
-- 인덱스 열 수정: 불가 (DROP -> CREATE)

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

-- 수정이 잦은 속성 (열)에 인덱스 사용하게 되면
-- 인덱스의 크기가 커짐 (바로 삭제되는 게 아니라 로그에 남음)


-- [뷰 (view)]
-- : 가상 테이블
-- : 하나 이상의 데이터 조회 (SELECT) 저장한 객체

/* 왜 쓸까요 ? 
 * 1. SELECT 문장이 간단해짐
 * 2. 보안성: 테이블의 특정 열을 숨기고 싶을 때 (정보보호)
 * ex) EMP 테이블의 SAL, COMM
 * 
 * */

SELECT * FROM DEPT; -- 실제 테이블
SELECT * FROM EMP; -- 실제 테이블

-- VIEW에 다가 저장 (VM_DEPT)
SELECT DEPTNO, DNAME -- LOC열 (정보보호)을 외부에 숨길 수 있음
FROM DEPT
WHERE DEPTNO = 10;

-- 열 숨길 수 있음 (특정 열만 보여줄 수 있음)
SELECT *
FROM VW_DEPT;

-- => 서브쿼리를 사용한 것처럼 표현
SELECT *
FROM (SELECT DEPTNO, DNAME
	FROM DEPT
	WHERE DEPTNO = 10);


-- 1) 뷰 생성
-- : 뷰 생성 권한 (SCOTT 뷰 생성 권한을 줘야 함)

-- scott 계정에 뷰 생성 권한 주는 방법
-- cmd 창에서
-- sqlplus
-- system/oracle
-- grant create view to scott;
-- exit;

/* 형식)
 * 
 * CREATE [OR REPLACE (선택)] [FORCE | NOFORCE (선택)] 
 * VIEW 뷰 이름
 * (열 이름1, 열 이름 2 ... (선택))
 * AS (SELECT 문장)
 * 
 * [WITH CHECK OPTION (CONSTRAINT 제약조건) (선택)]
 * [WITH READ ONLY (CONSTRAINT 제약조건) (선택)]
 * 
 * 
 * * OR REPLACE: 같은 이름이 존재할 경우 해당 이름으로 뷰 대체 (선택)
 * * FORCE: SELECT문 기반 테이블이 없어도 강제 생성 (선택)
 * * NOFORCE: SELECT문 기반 테이블이 없으면 생성 X (기본값) (선택)
 * * 뷰 이름: 생성할 뷰 이름 지정 (필수)
 * * 열 이름: SELECT문 명시된 이름 대신 사용할 열 이름 지정 (생략가능, 선택)
 * * 저장할 SELECT문: 생성할 뷰에 저장할 SELECT문 (필수)
 * * WITH CHECK OPTION: DML 작업 가능하도록 뷰 생성 (선택)
 * * WITH READ ONLY: 뷰 열람만 가능하도록 뷰 생성 (선택)
 * */

-- 뷰 생성
SELECT * FROM EMP;

CREATE VIEW VW_EMP
AS (SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
	FROM EMP);

-- USER_VIEWS 데이터 사전 조회
SELECT * FROM USER_VIEWS; 


SELECT * FROM VW_EMP;

-- 2) 뷰 삭제 (=> EMP 테이블 삭제되는 건 아님!)
DROP VIEW VW_EMP;

SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP;

-- Q1. 뷰 (VW_EMP) 생성
-- EMPNO, ENAME, HIREDATE => NO, NAME, HDATE (뷰 열 이름 변경)
-- WITH READ ONLY
-- EMPNO, ENAME, HIREDATE (1500 <= SAL <= 2500)
SELECT * FROM EMP;

CREATE OR REPLACE VIEW VW_EMP (NO, NAME, HDATE)
AS (SELECT EMPNO, ENAME, HIREDATE
	FROM EMP
	WHERE SAL BETWEEN 1500 AND 2500)
WITH READ ONLY; -- SELECT만 가능한 뷰 생성 (뷰 열람만 가능)

SELECT * FROM VW_EMP;


-- 02. 뷰 (VW_EMP) 생성
-- 동일한 이름이 있다면 REPLACE 옵션을 통해 VW_EMP 현재 뷰를 대체
-- WITH CHECK OPTION (DML 사용 가능)
-- SMITH보다 연봉 (SAL * 12 + COMM)을 
-- 조금 받는 EMPNO, ENAME, SAL 열을 가진 뷰 생성

-- WITH CHECK OPTION 기능은 VIEW에 DML 사용 가능
-- 1) 뷰에 데이터 삽입 테스트 해보기 (2021, GILDONG, 1000) -- ERROR
-- 2) 뷰에 데이터 삽입 테스트 해보기 (2025, GILSUN, 500) -- ERROR
DROP VIEW VW_EMP;

CREATE OR REPLACE VIEW VW_EMP
AS (SELECT EMPNO, ENAME, SAL
	FROM EMP
	WHERE SAL * 12 + NVL(COMM, 0) 
	< (SELECT SAL * 12 + NVL(COMM, 0)
		FROM EMP
		WHERE ENAME = 'SMITH'))
WITH CHECK OPTION CONSTRAINT VIEW_CHECK_OPTION; 


-- DML 데이터 조작 가능! (조건절에 만족하면!)

SELECT * FROM  EMP;
SELECT * FROM  VW_EMP;

INSERT INTO VW_EMP
VALUES (2021, 'GILDONG', 1000); -- 문제! (조건절에 만족하지 못해)

INSERT INTO VW_EMP
VALUES (3001, 'GILDONG2', 1000);

INSERT INTO VW_EMP
VALUES (2025, 'GILSUN', 500); -- 정상적 (조건절에 만족함)

INSERT INTO VW_EMP
VALUES (3000, 'GILSUN2', 500); -- 정상적 (조건절에 만족함)

DROP VIEW VW_EMP;

CREATE OR REPLACE VIEW VW_EMP
AS (SELECT EMPNO, ENAME, SAL
	FROM EMP
	WHERE SAL * 12 + NVL(COMM, 0) 
	< (SELECT SAL * 12 + NVL(COMM, 0)
		FROM EMP
		WHERE ENAME = 'SMITH'));
	
INSERT INTO VW_EMP
VALUES (2010, 'GILSUN', 2000); 
-- CHECK OPTION이 없어서 오류 발생 X

SELECT * FROM VW_EMP;
DROP VIEW VW_EMP;

-- 3) 인라인 뷰를 이용한 TOP-N SQL문
-- : 인라인 뷰 (inline view) (VS 뷰)
-- : 일회성으로 만들어서 사용하는 뷰 (WITH ~~ AS ~~)
COMMIT
-- 1-1. 인라인 뷰 + ROWNUM 사용
SELECT ROWNUM, E.*
FROM EMP E;

-- 의사 열 (PSEUDO COLUMN) (ROWNUM)
-- 실제 테이블에 존재하지는 않지만 특수 목적을 위해서 열처럼 사용

-- cf) 의사 코드 (PSEUDO CODE)
-- : 실제 코드는 아니고 알고리즘 (방법)을 표현하기 위한 언어

-- 인라인 뷰를 이용한 TOP-N 추출
-- ex) 급여가 높은 상위 세 명 데이터 출력 (ROWNUM)

-- 인라인 뷰 (WHERE) => 가독성 떨어짐
SELECT ROWNUM, E.*
FROM (SELECT *
	FROM EMP
	ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

-- 인라인 뷰 (WITH ~ AS) => 가독성 높임
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 3;

-- Q1. 사원의 매너저의 입사일이 최근 5명 추출 (DESC)
WITH E AS (SELECT * FROM EMP E1 JOIN EMP E2 
			ON (E1.MGR = E2.EMPNO) ORDER BY E2.HIREDATE DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 5;

-- ROWNUM : 행 번호

-- Q2. COMM이 NULL인 사람들 중에 EMPNO가 높은 사람 3명 추출 (DESC)
WITH E AS (SELECT * FROM EMP 
			WHERE COMM IS NULL 
			ORDER BY EMPNO DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 3;


SELECT * FROM EMP;


/* 시퀀스 (sequence)
 * : 연속되는 숫자 생성 객체
 * : 지속적으로 효율적인 번호 생성 가능
 * 
 * ex) 게시한 글 목록 1, 2, 3, 4...
 * 	쇼핑몰 장바구니, 찜 목록 1, 2, 3, 4..
 * 
 * SELECT MAX(목록) + 1
 * FROM 게시판 테이블 
 * 
 * 문제점 ?
 * - MAX(목록): 게시판 글 1000개 넘어감 (1000개를 다 봐야함)
 * >> 테이블의 사이즈가 커지면 질의 속도 느려짐
 * */

/* 시퀀스 생성
 * 
 * 형식)
 * CREATE SEQUENCE 시퀀스 이름
 * [INCREMENT BY n] - 번호의 증가값 (기본값 1) (선택)
 * [START WITH n] - 번호 시작값 (기본값 1) (선택)
 * [MAXVALUE n | NOMAXVALUE] (선택) 
 * - MAXVALUE: 시퀀스의 최댓값
 * - NOMAXVALUE: 오름차순 10^27, 내림차순 -1 
 * [MINVALUE n | NOMINVALUE] (선택)
 * - MINVALUE: 시퀀스의 최솟값
 * - NOMINVALUE: 오름차순 1, 내림차순 10^-26 == 1/10^26
 * [CYCLE | NOCYCLE] (선택)
 * - CYCLE: 최댓값 도달했을 경우 다시 시작값으로 돌아감
 * - NOCYCLE: 최댓값 도달했을 경우 번호 생성 중단 (오류 발생)
 * [CACHE n | NOCACHE] (선택) (기본값 20)
 * - CACHE: 생성할 번호 미리 지정
 * - NOCACHE: 미리 지정 X
 * 
 * */

-- 실습 DEPT_SEQUENCE 테이블 (구조만 복사)
CREATE TABLE DEPT_SEQUENCE
AS SELECT *
	FROM DEPT 
	WHERE 1 <> 1;

SELECT * FROM DEPT_SEQUENCE;

-- DEPTNO를 시작값 10, 10씩 증가할 수 있도록 시퀀스 생성
CREATE SEQUENCE SEQ_DEPTNO
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 20;

SELECT * FROM USER_SEQUENCES;

/* 시퀀스 사용
 * 
 * 시퀀스 이름.CURRVAL => 마지막으로 생성한 번호 반환
 * ※ 아직 시퀀스를 사용한 적이 없을 때에는 CURRVAL가 없음
 * => 사용하면 오류가 남
 * => 시퀀스를 생성하자마자 바로 CURRVAL 사용할 수가 없음
 * 
 * 시퀀스 이름.NEXTVAL => 다음 생성할 번호 반환
 * 
 * */


INSERT INTO DEPT_SEQUENCE (DEPTNO)
VALUES (SEQ_DEPTNO.NEXTVAL);
-- 최댓값을 넘게 될 경우에는 오류 발생!

SELECT * FROM DEPT_SEQUENCE;

SELECT SEQ_DEPTNO.CURRVAL
FROM DUAL; -- 연산 확인용 테이블 (DUMMY TABLE)



/* 시퀀스 수정 (START WITH는 수정 불가)
 * ALTER SEQUENCE 시퀀스 이름 
 * [INCREMENT BY n] - 번호의 증가값 (기본값 1) (선택)
 * [MAXVALUE n | NOMAXVALUE] (선택) 
 * - MAXVALUE: 시퀀스의 최댓값
 * - NOMAXVALUE: 오름차순 10^27, 내림차순 -1 
 * [MINVALUE n | NOMINVALUE] (선택)
 * - MINVALUE: 시퀀스의 최솟값
 * - NOMINVALUE: 오름차순 1, 내림차순 10^-26 == 1/10^26
 * [CYCLE | NOCYCLE] (선택)
 * - CYCLE: 최댓값 도달했을 경우 다시 시작값으로 돌아감
 * - NOCYCLE: 최댓값 도달했을 경우 번호 생성 중단 (오류 발생)
 * [CACHE n | NOCACHE] (선택) (기본값 20)
 * - CACHE: 생성할 번호 미리 지정
 * - NOCACHE: 미리 지정 X
 **/

-- 시퀀스에 CYCLE 추가, 증가값 2, 최댓값 99
ALTER SEQUENCE SEQ_DEPTNO
INCREMENT BY 2
MAXVALUE 99
CYCLE;


SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPT_SEQUENCE (DEPTNO)
VALUES (SEQ_DEPTNO.NEXTVAL);

SELECT * FROM DEPT_SEQUENCE;

/* 시퀀스 삭제
 * DROP SEQUENCE
 * 
 * DEPTNO 
 * => 시퀀스 통해 생성 (시퀀스를 삭제해도 DEPTNO 데이터는 사라지지 않음)
 * */

DROP SEQUENCE SEQ_DEPTNO;

SELECT * FROM USER_SEQUENCES;
SELECT * FROM DEPT_SEQUENCE;


/* 동의어 (synonym)
 * : 테이블, 뷰, 시퀀스의 객체 이름 대신 사용할 수 있는 다른 이름 부여
 * ex) 테이블의 이름이 길 경우 동의어를 만듦
 * 
 * 동의어 생성법
 * CREATE [PUBLIC] SYNONYM 동의어 이름
 * FOR [사용자.][객체이름];
 * 
 * PUBLIC - DB 내의 모든 사용자가 사용할 수 있도록 생성
 * (생략할 경우, 동의어를 생성한 사용자만 사용이 가능) (선택)
 * 동의어 이름 - 생성할 동의어 이름 (필수)
 * 사용자. - 생성할 동의어의 소유 사용자 지정
 * (생략할 경우, 현재 접속한 사용자 지정) (선택)
 * 객체 이름 - 동의어를 생성할 객체 이름 (테이블, 뷰, 시퀀스) (필수)
 * 
 * 동의어 VS 테이블 별칭 (FROM 테이블 이름 별칭)
 * : 동의어는 DB에 저장되는 객체 (일회성 X)
 * : 테이블 별칭은 일회성
 * 
 * */

-- SCOTT 계정에 동의어를 생성할 수 있는 권한 부여 (SQLPLUS)
-- sqlplus
-- system/oracle
-- 1) 동의어 생성 권한 부여: 
-- >> grant create synonym to scott;
-- 2) 동의어 PUBLIC 권한 부여: 
-- >> grant create public synonym to scott;

-- 동의어 생성 (EMP -> E)
CREATE SYNONYM E
FOR EMP;

SELECT * FROM E;

-- 동의어 생성 (DEPT -> D)
CREATE SYNONYM D
FOR DEPT;

SELECT * FROM D;

-- 동의어 이용! 
-- 두 문제 (JOIN VS JOIN X)로 풀어보세요!
-- Q1. 부서가 RESEARCH에서 일하는 사원 정보 출력 
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 조인 이용 O
SELECT E.*
FROM E JOIN D ON (E.DEPTNO = D.DEPTNO)
WHERE D.DNAME = 'RESEARCH';

-- 조인 이용 X
SELECT *
FROM E
WHERE DEPTNO = (SELECT DEPTNO
				FROM D
				WHERE DNAME = 'RESEARCH');

-- Q2. 부서가 SALES에서 일하는 사원 평균 연봉 (SAL * 12 + COMM) 출력
-- * NULL값 처리!
SELECT * FROM E;

-- 조인 이용 O
SELECT AVG(E.SAL*12+E.COMM) 
FROM E JOIN D ON (E.DEPTNO = D.DEPTNO)
WHERE D.DNAME = 'SALES';
-- COMM이 NULL이 되면 E.SAL*12+E.COMM가 NULL
-- AVG(): NULL인 값을 제외하고 평균을 계산
-- => COMM이 NULL인 사람의 연봉은 제외


SELECT E.SAL*12+E.COMM
FROM E;

SELECT ROUND(AVG(E.SAL*12+NVL(E.COMM, 0)), 2)
FROM E JOIN D ON (E.DEPTNO = D.DEPTNO)
WHERE D.DNAME = 'SALES';


-- 조인 이용 X
SELECT ROUND(AVG(SAL*12+NVL(COMM, 0)), 2)
FROM E
WHERE DEPTNO = (SELECT DEPTNO
				FROM D
				WHERE DNAME = 'SALES');

-- 동의어 삭제
DROP SYNONYM E;
DROP SYNONYM D;

-- 동의어 조회
SELECT * FROM ALL_SYNONYMS WHERE OWNER='SCOTT';
SELECT * FROM ALL_SYNONYMS WHERE TABLE_NAME='DEPT';
