/* 1) 사용자 관리
 * - 사용자 (user)
 * : DB에 접속해서 데이터를 관리하는 계정
 * 
 * - 사용자 관리
 * : 업무 역할이나 보안을 고려해서 사용자를 나눔
 * 
 * 2) 스키마 (schema)
 * : 데이터 간의 구조, 제약조건, 관계를 정의한 범위
 * 
 * - 사용자는 데이터 사용/관리를 위해 DB 접속
 * - 스키마는 DB에 접속한 사용자와 연결된 객체
 * 
 * EX) 
 * 사용자
 * : SCOTT
 * 
 * 스키마
 * : SCOTT 만든 뷰, 테이블, 제약조건, 인덱스, 시퀀스, 동의어 등
 * : SCOTT이 생성한 객체 
 */


-- 사용자 생성
/* 형식)
 * CREATE USER 사용자 이름 (필수)
 * IDENTIFIED BY 패스워드 (필수)
 * DEFAULT TABLESPACE 테이블 스페이스 이름 (선택)
 * TEMPORARY TABLESPACE 테이블 스페이스 (그룹) 이름 (선택)
 * QUOTA 테이블 스페이스 크기 ON 테이블 스페이스 이름 (선택)
 * PASSWORD EXPIRE (만료되다) (선택)
 * ACCOUNT [LOCK/UNLOCK] (선택, 기본값 UNLOCK);
 * */

/* 테이블 스페이스
 * : 오라클 서버가 데이터를 저장하는 구조
 * : 각 개체마다 테이블 스페이스를 지정할 수 있음
 * 
 * oracle - ...oradata/[SID]/
 * oracle xe - ...oracl/xe/oradata/XE/
 * 
 * 만약에 지정하지 않으면 시스템 테이블스페이스 -> 시스템이 단편화
 * 각 사용자가 소유한 데이터와 객체를 
 * 저장할 저장 공간을 별도로 만들어주는 것이 좋음
 * 
 * */

CREATE USER EUNBINCHOI
IDENTIFIED BY 1234;

SELECT * FROM ALL_USERS;

/* CREATE USER는 DBA 권한을 가지고 있는 계정만 가능
 * SQLPLUS
 * SYSTEM/oracle
 * create user ~~~~
 * identified by ~~~;
 * 
 * */

/* 만들어진 계정에 SESSION 만들 수 있는 권한 줘야함!
 * SQLPLUS
 * SYSTEM/oracle
 * GRANT CREATE SESSION TO _____ (유저 이름);
 * */

-- 사용자 정보 수정 (패스워드) (DBA 권한을 가진 사람)
-- 현재 연결된 계정: EUNBINCHOI/1234 (수정 불가)
-- DBA 권한을 가지고 있는 계정 접속

ALTER USER EUNBINCHOI
IDENTIFIED BY eunbinchoi;

-- DBA 권한을 다른 계정에 부여
-- GRANT DBA TO ____ (유저 이름);

-- 사용자 삭제
DROP USER EUNBINCHOI;

-- 사용자로 접속해서 만들어논 객체 (테이블, 뷰, 시퀀스, 인덱스 ...)
-- 를 같이 삭제 하고 싶을 경우
DROP USER EUNBINCHOI CASCADE;

-- 2) 권한 관리
-- : 사용자에 따라서 데이터 사용하거나 관리할 수 있는 보안 장치 -> 권한
-- : 접속 사용자에 따라 접근할 수 있는 데이터 영역과 권한을 지정
-- : A. 시스템 권한 (system privilege)
-- : B. 객체 권한 (object privilege)

-- A. 시스템 권한 (system privilege)
-- : 사용자 생성, 정보 수정/삭제, 데이터베이스 접근
-- : 시스템 권한 분류
-- : USER: CREATE/ALTER/DROP USER
-- : SESSION: CREATE/ALTER SESSION
-- : TABLE: CREATE TABLE -- 자신의 테이블 생성하는 권한
--			CREATE/ALTER/DROP/INSERT/UPDATE/DELETE/SELECT 
--			ANY TABLE 
			-- 임의 소유 테이블 생성/수정/삭제/데이터삽입/수정/삭제/조회 권한
-- : INDEX
-- : VIEW
-- : SEQUENCE
-- : SYNONYM

/* 시스템 권한
 * GRANT [시스템 권한] TO [사용자 이름]
 * [WITH ADMIN OPTION];
 * -- SYSTEM: GRANT CREATE SESSION TO EUNBINCHOI WITH ADMIN OPTION
 * -- EUNBINCHOI: GRANT CREATE SESSION TO OTHERUSER
 * -- SYSTEM >> EUNBINCHOI >> OTHERUSER
 * -- 중간에 EUNBINCHOI 계정이 사라져도 OTHERUSER의 권한은 사라있음 
 **/
 

CREATE USER EUNBINCHOI
IDENTIFIED BY 1234;

GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO EUNBINCHOI;
-- RESOURCE: 권한을 하나로 묶어주는 권한
-- GRANT RESOURCE가 없으면 "테이블 스페이스 USER 권한이 없습니다!"

-- 시스템 권한 취소
REVOKE RESOURCE, CREATE SESSION, CREATE TABLE FROM EUNBINCHOI;

SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE ='EUNBINCHOI';
-- 사용자에게 부여된 롤 권한

SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE ='EUNBINCHOI';
-- 타 사용자에게 부여한 객체 권한

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE ='EUNBINCHOI';
-- 사용자에게 부여된 시스템의 권한

/* 객체 권한 (object privilege)
 * : 특정 사용자가 생성한 객체 (테이블/뷰/시퀀스...)과 관련된 권한
 * ex) scott 계정에서 만든 테이블을 
 * eunbinchoi에게 insert, select이 가능하도록 만듦
 * 
 * TABLE: ALTER/DELETE/INDEX (테이블 인덱스 생성 권한)/INSERT/SELECT/UPDATE/REFERENCES
 * VIEW: DELETE/INSERT/SELECT/UPDATE/REFERENCES (참조 데이터 생성 권한)
 * SEQUENCE: ALTER/SELECT (CURRVAL, NEXTVAL 사용 권한)
 * 
 * 
 * 객체 권한 부여
 * GRANT [객체 권한/ALL PRIVILEGES] (필수)
 * ON [객체 이름] (필수)
 * TO [사용자 이름] (필수)
 * [WITH GRANT OPTION];
 * -- SYSTEM: GRANT ____ ON _____ TO EUNBINCHOI WITH GRANT OPTION
 * -- EUNBINCHOI: GRANT CREATE SESSION TO OTHERUSER
 * -- SYSTEM >> EUNBINCHOI >> OTHERUSER
 * -- 중간에 EUNBINCHOI 계정이 사라져도 OTHERUSER의 권한은 사라있음 
 * 
 */

CREATE TABLE PRIV_TEST(
	COL1 VARCHAR(20),
	COL2 VARCHAR(20)
);
 
DROP USER EUNBINCHOI;
CREATE USER EUNBINCHOI
IDENTIFIED BY 1234;

-- 시스템 권한 (CREATE SESSION, CREATE TABLE)
-- 롤 권한 (RESOURCE)
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO EUNBINCHOI;

-- 객체 권한 (SELECT, INSERT, UPDATE)
GRANT SELECT ON PRIV_TEST TO EUNBINCHOI;
GRANT INSERT ON PRIV_TEST TO EUNBINCHOI;
GRANT UPDATE ON PRIV_TEST TO EUNBINCHOI;

-- 객체 권한을 일괄적으로 줄 수도 있음
GRANT SELECT, INSERT, UPDATE ON PRIV_TEST TO EUNBINCHOI;

-- EUNBINCHOI 계정에서 (SQLPLUS EUNBINCHOI/1234)
-- Q1. 데이터를 2개정도 INSERT
INSERT INTO SCOTT.PRIV_TEST
VALUES ('HI', 'HELLO');

INSERT INTO SCOTT.PRIV_TEST
VALUES ('JAVA', 'SQL');

SELECT * FROM SCOTT.PRIV_TEST;

-- Q2. 데이터를 UPDATE
UPDATE SCOTT.PRIV_TEST
SET COL1 = 'ORACLE DB'
WHERE COL1 = 'JAVA';


-- 객체 권한 취소
REVOKE SELECT, INSERT, UPDATE ON PRIV_TEST FROM EUNBINCHOI;
-- SELECT * FROM SCOTT.RPIV_TEST
-- "TABLE OR VIEW DOES NOT EXIST"



