/* [트랙잭션]
 * : transaction 
 * : 더 이상 분할할 수 없는 최소 수행 단위
 * : 한 개 이상의 데이터 조작어 (DML)로 구성
 * 
 * 트랜잭션을 왜 쓸까요 ?
 * ex) 농협 계좌 내역 DB
 * 1) A계좌 (현재 잔액 200)
 * UPDATE 200 -> 0
 * 
 * 2) B계좌 (현재 잔액 0)
 * UPDATE 0 -> 200
 * 
 * -> 1), 2)은 같이 수행! (트랜젝션으로 묶어야 함)
 * -> 'ALL OR NOTHING'
 * -> 트랜잭션 제어 명령어 : TCL 
 * (Transaction Control Language)
 * -> 트랜잭션 상태
 * 1) 정상 수행
 * 2) 취소 
 * 
 * 트랙젝션의 특징 (ACID)
 * 1) 원자성 (Atomicity) - 회복
 * : 트랜젝션을 이루는 DML 코드를 하나의 원자로 보겠다!
 * : "ALL OR NOTHING"
 * 
 * 2) 일관성 (Consistency) - 동시성 제어 (LOCKING), 무결정 제약조건
 * : 트랜젝션 실행되기 전 오류가 없는 DB  
 *  => 트랜젝션 실행 후 오류가 없는 DB
 * 
 * 3) 고립성 (Isolation) - 동시성 제어 (LOCKING)
 * : 트랜젝션 실행 도중에 다른 트랜젝션 영향을 받아 결과가 잘못되면 안된다!
 * 
 * 4) 지속성 (Durability) - 회복
 * : 트랙젝션이 성공적으로 수행되면 해당 트렌젝션이 
 *   갱신한 DB 내용은 영구적으로 저장
 */

-- DEPT 테이블 복사해서 DEPT_TCL 테이블 만듦

DROP TABLE DEPT_TCL2;

CREATE TABLE DEPT_TCL2
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL2;



-- 50번 부서 추가
INSERT INTO DEPT_TCL2 VALUES(50, 'DEVELOPER', 'SEOUL');
SELECT * FROM DEPT_TCL2;


-- 40번 부서 DNAME을 FACTORY로 수정
UPDATE DEPT_TCL2 SET DNAME = 'FACTORY' WHERE DEPTNO = 40;
SELECT * FROM DEPT_TCL2;

SAVEPOINT point1
-- 부서 DNAME RESEARCH인 부서 삭제
DELETE FROM DEPT_TCL2 WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL2;

-- 1) 트랜젝션 취소 ROLLBACK
ROLLBACK TO SAVEPOINT point1
-- 세미콜론 없이 작성
SELECT * FROM DEPT_TCL2;
SELECT * FROM DEPT;

/* 하나의 트랜젝션 단위:
 * TCL을 실행할 때 기존 트랜젝션 끝남
 * */


-- 2) 트랜젝션을 영원히 반영하는 COMMIT
-- : COMMIT 하시면 ROLLBACK 불가!


SELECT * FROM DEPT_TCL2;
COMMIT -- TCL (구분선)

INSERT INTO DEPT_TCL2 VALUES(60, 'NETWORK', 'BUSAN');
ROLLBACK -- TCL (구분선)

UPDATE DEPT_TCL2 SET LOC = 'SEOUL' WHERE DEPTNO = 30;
--DELETE FROM DEPT_TCL2 WHERE DEPTNO = 60;
SELECT * FROM DEPT_TCL2;
COMMIT -- TCL (구분선)

ROLLBACK
SELECT * FROM DEPT_TCL2;
/* 만약 COMMIT이 되면 더이상 ROLLBACK할 수가 없음 */

-- Q1. 은행 계좌 문제 
-- TABLE ACCOUNT_A
-- 소유자 이름 (NAME, VARCHAR(10))
-- 계좌번호 (ACCOUNT, VARCHAR(20))
-- 잔액 (BALANCE, VARCHAR(20))

-- TABLE ACCOUNT_B
-- 소유자 이름 (NAME, VARCHAR(10))
-- 계좌번호 (ACCOUNT, VARCHAR(20))
-- 잔액 (BALANCE, VARCHAR(20))

/* CREATE TABLE 테이블 이름 {
 * 	열 이름 자료형,
 *  열 이름 자료형,
 * 
 *  열 이름 자료형
 * };
 * 
 * ACCOUNT_A (200), ACCOUNT_B (0) 각각 데이터를 입력
 * A -> B 계좌 200만원 이체 (COMMIT)
 * */

DROP TABLE ACCOUNT_A;
DROP TABLE ACCOUNT_B;

CREATE TABLE ACCOUNT_A (
	NAME	VARCHAR(10),
	ACCOUNT VARCHAR(20),
	BALANCE NUMBER(30)
);

CREATE TABLE ACCOUNT_B (
	NAME	VARCHAR(10),
	ACCOUNT VARCHAR(20),
	BALANCE NUMBER(30)
);


-- 0. INSERT INTO 잔액을 입력
--   A: 200만원, B: 0원 가정

INSERT INTO ACCOUNT_A
VALUES ('A', '1234-5678', 2000000);
COMMIT -- 세미콜론 없이 작성

INSERT INTO ACCOUNT_B
VALUES ('B', '1234-5678', 0);
COMMIT -- 세미콜론 없이 작성

SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;

ROLLBACK 
-- 세미콜론 없이 작성
-- COMMIT 뒤에 작성한 DML (UPDATE, DELETE, INSERT)이 없어서
-- ROLLBACK할 코드가 없음


-- 1. A가 이체하려고 하는 금액을 잘못 입력했을 때 (100만원)
SAVEPOINT WITHDRAW;
UPDATE ACCOUNT_A
SET BALANCE = 1000000;
UPDATE ACCOUNT_B
SET BALANCE = 1000000;
ROLLBACK TO SAVEPOINT WITHDRAW

SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;

-- 2. A -> B 정상적으로 이체되었을 때 (200만원)
UPDATE ACCOUNT_A
SET BALANCE = 0;
UPDATE ACCOUNT_B
SET BALANCE = 2000000;
COMMIT


SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;

ROLLBACK

SELECT * FROM ACCOUNT_A, ACCOUNT_B;

/* [세션 (session)]
 * : DB 연결이 되고 연결이 끝나기 전까지 전체 기간
 * ex) 웹 로그인 ~ 로그아웃까지의 기간
 * 
 * : 세션은 여러개의 트랜젝션을 포함
 * 
 * 
 */

CREATE TABLE SESSION_TEST
AS SELECT * FROM DEPT;

SELECT * FROM SESSION_TEST;

INSERT INTO SESSION_TEST
VALUES (50, 'DEVELOPER', 'SEOUL');

SELECT * FROM SESSION_TEST;
COMMIT

UPDATE SESSION_TEST 
SET LOC = 'BUSAN' 
WHERE DEPTNO = 50;

COMMIT

UPDATE SESSION_TEST 
SET LOC = 'JEJU' 
WHERE DEPTNO = 50;



/* 데이터베이스는 여러 곳 동시 접근 (세션 여러개)
 * - COMMIT, ROLLBACK (트랜젝션 완료)이 되지 않으면 
 * 다른 세션에서 데이터의 변경 사항을 알 수 없음 
 * (읽기 일관성, read consistency) => 세션
 * - 다른 세션에서는 변경과 무관한 원래 데이터를 보여줌
 * 
 * - 특정 세션에서 조작 (DML) 중인 데이터는 잠기게 됨 (LOCK)
 * : 트랜젝션이 완료되기 전까지 다른 세션에서 조작할 수 없는 상태
 * : 데이터를 다른 세션이 조작할 수 없도록 보류하는 것
 * 
 * - LOCK 종류
 * 1) ROW LEVEL LOCK (행 레벨 롹)
 * : WHERE을 통해 특정 행만 (변경) 영향을 주면 
 *   특정 행 데이터만 LOCK
 * 2) TABLE LEVEL LOCK (테이블 레벨 롹)
 * : WHERE절이 없는 조작어인 경우 전체 테이블에 대해 LOCK
 * 
 * - HANG (행): A 세션에서 조작 완료까지 기다리는 상태 (현상)
 * - 세션: A, B
 * - A: UPDATE ~~~~ 
 * - B: UPDATE ~~~~ (B는 HANG)
 * - A: COMMIT
 * - B: UPDATE 실행 (DATA에 LOCK 풀림)
 * 
 * */

