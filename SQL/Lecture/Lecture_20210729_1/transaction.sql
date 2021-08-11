/* [트랜잭션]
 * : transaction
 * : 더 이상 분할할 수 없는 최소 수행 단위
 * : 한 개 이상의 데이터 조작어 (DML) 구성
 * 
 * 트랜잭션을 왜 쓸까?
 * EX) 농협 계좌 내역 DB
 * 1) A계좌 (현재 잔액 200)
 * UPDATE 200 -> 0
 * 
 * 2) B계좌 (현재 잔액 0)
 * UPDATE 0 -> 200
 * 
 * -> 1), 2)은 같이 수행! (트랜잭션으로 묶어야 함)
 * -> 'ALL OR NOTHING'
 * -> 트랜잭션 제어 명령어 : TCL
 * (Transaction Control Language)
 * -> 트랜잭션 상태
 * 1) 정상 수행
 * 2) 취소
 * 
 * 트랜잭션의 특징 (ACID)
 * 1) 원자성 : (Atomicity)
 * : 트랜잭션을 이루는 DML 코드를 하나의 원자로 보겠다!
 * : "ALL OR NOTHING"
 * 
 * 2) 일관성 (Consistency)
 * : 트랜잭션 실행되기 전 오류가 없는 DB
 * => 트랜잭션 실행 후 오류가 없는 DB
 * 
 * 3) 고립성 (Isolation)
 * : 트랜잭션 실행 도중에 다른 트랜잭션 영향을 받아 결과가 잘못되면 안된다!
 * 
 * 4) 지속성 (Durability)
 * : 트랜잭션이 성공적으로 수행되면 해당 트랜잭션이 갱신한 DB 내용은 영구적으로 저장
 */

-- DEPT 테이블 복사해서 DEPT_TCL 테이블 만듦
CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

-- 50번 부서 추가
INSERT INTO DEPT_TCL VALUES (50, 'DEVELOPER', 'SEOUL');

-- 40번 부서 DNAME을 FACTORY
UPDATE DEPT_TCL SET DNAME = 'FACTORY' WHERE DEPTNO = 40;

SAVEPOINT point1
-- 부서 DNAME RESEARCH인 부서 삭제 
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

-- 1) 트랜잭션 취소 (ROLLBACK)
ROLLBACK TO SAVEPOINT point1-- 세미콜론 없이 작성

DROP TABLE DEPT_TCL

/* 하나의 트랜잭션 단위 :
 * TCL을 실행할 때 기존 트랜잭션 끝남
 * */

-- 2) 트랜잭션을 영원히 반영하는 COMMIT
-- : COMMIT 하면 ROLLBACK 불가!
SELECT * FROM DEPT_TCL;
COMMIT -- TCL (구분선)

INSERT INTO DEPT_TCL VALUES (60, 'NETWORK', 'BUSAN');
ROLLBACK -- TCL (구분선)

UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;
COMMIT -- TCL (구분선)

ROLLBACK
SELECT * FROM DEPT_TCL;
-- 만약 COMMIT이 되면 더이상 ROLLBACK 할 수가 없음

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
 *    열 이름 자료형,
 *  열 이름 자료형,
 * 
 *  열 이름 자료형
 * };
 * 
 * ACCOUNT_A (200), ACCOUNT_B (0) 각각 데이터를 입력
 * A -> B 계좌 200만원 이체 (COMMIT)
 * */

CREATE TABLE ACCOUNT_A (
   NAME   VARCHAR(10),
   ACCOUNT VARCHAR(20),
   BALANCE NUMBER(30)
);

CREATE TABLE ACCOUNT_B (
   NAME   VARCHAR(10),
   ACCOUNT VARCHAR(20),
   BALANCE NUMBER(30)
);

-- 0. INSERT INTO 잔액을 입력
--  A: 200만 원, B: 0원 가정
INSERT INTO ACCOUNT_A VALUES ('A', '1234-5678', 2000000);
COMMIT -- 세미콜론 없이 작성

INSERT INTO ACCOUNT_B VALUES ('B', '1234-5678', 0);
COMMIT  -- 세미콜론 없이 작성

SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;

ROLLBACK
-- 세미콜론 없이 작성
-- COMMIT 뒤에 작성한 DML(UPDATE, DELETE, INSERT)이 없어서 ROLLBACK할 코드가 없음


-- 1. A가 이체하려고 하는 금액을 잘못 입력했을 때 (100만원)
SAVEPOINT WITHDRAW;
UPDATE ACCOUNT_A SET BALANCE = 1000000;
UPDATE ACCOUNT_B SET BALANCE = 1000000;
ROLLBACK TO SAVEPOINT WITHDRAW

-- 2. A -> B 정상적으로 이체되었을 때
UPDATE ACCOUNT_A SET BALANCE = 0;
UPDATE ACCOUNT_B SET BALANCE = 2000000;
COMMIT

/* [세션 (SESSION)]
 * 
 * 
 * 
 * 
 */

CREATE TABLE SESSION_TEST AS SELECT * FROM DEPT

INSERT INTO SESSION_TEST
VALUES (50, 'DEVELOPER', 'SEOUL');

COMMIT

UPDATE SESSION_TEST
SET LOC = 'JEJU'
WHERE DEPTNO = 50;
