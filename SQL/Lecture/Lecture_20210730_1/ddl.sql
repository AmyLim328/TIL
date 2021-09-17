/* 데이터 정의어 (DDL, Data Definition Language)
 * : 여러 객체 (object)의 생성, 변경, 삭제 관련 기능
 * ※ 객체 ? 테이블
 * 
 * : 객체 생성: CREATE
 * : 객체 변경: ALTER
 * : 객체 삭제: DROP
 * 
 * ** 수행 내용이 바로 반영 (바로 자동 COMMIT, ROLLBACK 불가)
 * 
 * 
 */


-- 객체 생성 (CREATE)
/* CREATE TABLE 소유계정(SYSTEM/SCOTT).테이블명 (
 * 	열이름 자료형,
 *  열이름 자료형,
 *  열이름 자료형
 * );
 * 
 * 
 * - 테이블명 명명법
 * 1) 테이블명 중복 X
 * 2) 30byte 이하 (영어 30글자, 한글 15글자)
 * 3) 테이블 이름 사이에 특수문자가 들어갈 수 있음 (_, #, $)
 *  -> 첫 문자는 문자! (EMP11(O), 11EMP(X))
 * 4) 키워드 사용 불가 (SELECT, DROP, FROM ..)
 * 
 * 
 * - 열 이름 만드는 규칙
 * 1) 첫문자 문자 시작
 * 2) 30byte 이하
 * 3) 하나의 테이블 안에서 열 이름 중복 X (EMPNO, EMPNO (X))
 * 4) 열 이름 사이에 특수문자가 들어갈 수 있음 (_, #, $)
 * 5) 키워드 사용 불가
 * */


-- [CREATE]
-- 테이블 정의하는 명령어

SELECT * FROM TAB;
-- Q1. CREATE TABLE ATTENDANCE
-- 열 1: 출석날짜
-- 열 2: 출석한 사람 이름
-- 열 3: 출석 인원
-- 열 4: 신체 온도



DROP TABLE ATTENDANCE;


CREATE TABLE ATTENDANCE(
	ATTENDDATE DATE,
	PARTICIPANT VARCHAR2(10),
	ID NUMBER(10),
	TEMP NUMBER(10, 2)
);

-- 데이터 3명 정도 ATTENDANCE 테이블에 추가! (DML)
INSERT INTO ATTENDANCE
VALUES (TO_DATE('2021-07-30', 'YYYY-MM-DD'), -- SYSDATE
		'홍길동', 1, '35.5');
INSERT INTO ATTENDANCE
VALUES (TO_DATE('2021-07-30', 'YYYY-MM-DD'), -- SYSDATE
		'박박박', 2, '35.2');
INSERT INTO ATTENDANCE
VALUES (TO_DATE('2021-07-30', 'YYYY-MM-DD'), -- SYSDATE
		'홍홍홍', 3, '34.5');
COMMIT
	
SELECT * FROM ATTENDANCE;	
	
-- 기존 ATTENDANCE 테이블 복사 (모든 데이터)
DROP TABLE ATTENDANCE_TEMP;
CREATE TABLE ATTENDANCE_TEMP
AS SELECT * FROM ATTENDANCE;

SELECT * FROM ATTENDANCE_TEMP;

-- 기존 테이블 구조만 복사 (열 이름만 가지고 옴)
DROP TABLE ATTENDANCE_TEMP2;
CREATE TABLE ATTENDANCE_TEMP2
AS SELECT * FROM ATTENDANCE WHERE 1 <> 1;
-- 조건문이 false가 되는 조건을 추가하면 구조만 복사할 수도 있음

SELECT * FROM ATTENDANCE_TEMP2;

-- 일부 데이터만 복사 (ID = 1인 사람만 복사)해서 새로운 테이블 생성
DROP TABLE ATTENDANCE_TEMP3;
CREATE TABLE ATTENDANCE_TEMP3
AS SELECT * FROM ATTENDANCE WHERE ID = 1;

SELECT * FROM ATTENDANCE_TEMP3;

-- [ALTER]
-- 테이블 변경하는 명령어

CREATE TABLE ATTENDANCE_ALTER
AS SELECT * FROM ATTENDANCE;

SELECT * FROM ATTENDANCE_ALTER;

-- 테이블 중 열 이름 관련

-- 1) 열 이름 추가 ADD
-- : 과제제출여부 (ISSUBMITTED, VARCHAR2(1))
ALTER TABLE ATTENDANCE_ALTER
ADD ISSUBMITTED VARCHAR2(1);

SELECT * FROM ATTENDANCE_ALTER;

-- 2) 열 이름 수정 RENAME
ALTER TABLE ATTENDANCE_ALTER
RENAME COLUMN ISSUBMITTED TO ISSUBMIT;

-- 3) 열 데이터 자료형 변경 MODIFY ('O', 'X' -> 1, 0)
ALTER TABLE ATTENDANCE_ALTER
MODIFY ISSUBMIT NUMBER(1);

-- 4) 열 삭제 DROP (DROP TABLE / "DROP COLUMN")
ALTER TABLE ATTENDANCE_ALTER
DROP COLUMN ISSUBMIT;

SELECT * FROM ATTENDANCE_ALTER;


-- 테이블 관련
-- 1) 테이블 이름 변경 RENAME (RENAME COLUMN - 테이블 열 이름 변경)
RENAME ATTENDANCE_ALTER TO ATTENDANCE_RENAME;

SELECT * FROM ATTENDANCE_ALTER; -- 사용 불가
SELECT * FROM ATTENDANCE_RENAME;

-- 2) 테이블 내부 모든 데이터 삭제 TRUNCATE
TRUNCATE TABLE ATTENDANCE_RENAME;

SELECT * FROM ATTENDANCE_RENAME;

/* TRUNCATE VS DELETE
 * - TRUNCATE (DDL) - 자동 COMMIT (ROLLBACK 불가) 
 * 							    (되돌릴 수 .. 없음)
 * - DELETE (*) (DML) - 우리가 COMMIT을 해줘야 DB 적용!
 * */

-- 3) 테이블 삭제 DROP (DROP TABLE ~~)
DROP TABLE SSS; 
-- TABLE DOES NOT EXIST! (에러)
-- 만약 해당하는 테이블 이름이 없을 경우

DROP TABLE ATTENDANCE_RENAME;
SELECT * FROM ATTENDANCE_RENAME;
-- TABLE DOES NOT EXIST! (에러)
-- 만약 해당하는 테이블이 DROP 되었을 경우

