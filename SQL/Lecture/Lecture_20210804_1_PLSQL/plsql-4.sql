/*
저장 서브 프로그램

-- 지금까지 작성한 PL/SQL 블록은 이름없이 작성 (익명 블록 (anonymous block))
-- : 오라클 DB에 저장되는 건 아님

-- 저장 서브 프로그램 (stored subprogram)
-- : PL/SQL에 이름을 붙여 오라클에 저장하는 프로그램
-- : EX) 프로시저 (procedure), 함수 (function), 패키지 (package), 트리거 (trigger)

-- 장점 ?
-- 1) 필요할 때마다 재사용할 수 있음
-- 2) 이름이 있어서 다른 사람에게 공유하기 쉬움
-- 3) 다른 프로그램에서 호출하기 쉬움

*/

/* 
1) 프로시저

CREATE [OR REPLACE] PROCEDURE 프로시저 이름
IS | AS -- 선언부 (DECLARE 대신 사용, 선언부가 없어도 무조건 작성)
BEGIN
EXCEPTION -- 생략 가능
END [프로시저 이름]; -- 프로시저 이름은 생략 가능

ON REPLACE: 같은 이름의 프로시저가 있는 경우 현재 프로시저로 대체

*/

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE PRO_TEST
IS
    DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT * INTO DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
END;
/
-- DEPTNO가 10인 부서정보를 ROWTYPE형 변수 (DEPT_ROW)에 저장하는 프로시저

-- 프로시저 실행 (EXECUTE 프로시저 이름;)
EXECUTE PRO_TEST;

-- 익명 블록 내에서 프로시저 실행
BEGIN
    PRO_TEST;
END;
/

-- 프로시저 목록 확인
SELECT * FROM USER_SOURCE;

-- 프로시저 내용 확인
SELECT * FROM USER_SOURCE
WHERE NAME = 'PRO_TEST';

-- 프로시저 삭제 (DROP PROCEDURE)
DROP PROCEDURE PRO_TEST;

-- 파라미터를 사용하는  프로시저
-- : 프로시저를 실행하기 위해 입력 데이터가 필요한 경우 파라미터 정의

/*
형식)

CREATE [OR REPLACE] PROCEDURE 프로시저 이름
[(파라미터 이름1[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
  파라미터 이름2[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
 .......
 )]

IS | AS -- 선언부 (DECLARE 대신 사용, 선언부가 없어도 무조건 작성)
BEGIN
EXCEPTION -- 생략 가능
END [프로시저 이름]; -- 프로시저 이름은 생략 가능

ON REPLACE: 같은 이름의 프로시저가 있는 경우 현재 프로시저로 대체
[modes]: 
IN: 프로시저 호출 시 필요한 값 (기본값)
OUT: 프로시저 반환 시 필요한 값
IN OUT: 호출 시 값 입력을 받고 결과 반환할 값
*/


-- IN 모드 파라미터
CREATE OR REPLACE PROCEDURE PRO_TEST_PRAM_IN
(
    -- NUMBER(max length): 어떤 값이 올 지 모름 (최대 길이를 제약 X)
   PARAM1 IN NUMBER,
   PARAM2 NUMBER DEFAULT 3,
   PARAM3 NUMBER,
   PARAM4 NUMBER DEFAULT 4
   -- * 기본값 (디폴트값) 뒤에서부터 순서대로 (연속적으로) 할당 (예전 버전)
   -- * 오라클 11 버전 이상부터 디폴트 값을 연속적으로 주지 않아도 됨 (인자로 데이터를 전달할 때 매개변수 이름을 같이 명시해줘야 함)
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 : ' || TO_CHAR(PARAM1));
    DBMS_OUTPUT.PUT_LINE('PARAM2 : ' || TO_CHAR(PARAM2));
    DBMS_OUTPUT.PUT_LINE('PARAM3 : ' || TO_CHAR(PARAM3));
    DBMS_OUTPUT.PUT_LINE('PARAM4 : ' || TO_CHAR(PARAM4));
END;
/
SET SERVEROUTPUT ON;
EXECUTE PRO_TEST_PRAM_IN(10, 20, 30, 40);
EXECUTE PRO_TEST_PRAM_IN(10, 20); -- PARAM1: 10, PARAM2: 20, PARAM3 데이터가 오지 않음, PARAM4 : 4
EXECUTE PRO_TEST_PRAM_IN(10, 20, 30); -- PARAM1: 10, PARAM2: 20, PARAM3: 30, PARAM4 : 4
EXECUTE PRO_TEST_PRAM_IN(PARAM1 => 10, PARAM3 => 20); -- 오라클 11 이상부터 가능!

-- PARAM3, PARAM4 기본값 지정

-- OUT모드 파라미터
-- : 프로시저 실행 후 호출한 프로그램으로 값 반환

CREATE OR REPLACE PROCEDURE PRO_TEST_PRAM_OUT(
    IN_EMP IN EMP.EMPNO%TYPE, -- IN은 생략 가능! (프로시저 호출할 때 전달되는 값)
    OUT_EMP OUT EMP.ENAME%TYPE, -- 반환값
    OUT_SAL OUT EMP.SAL%TYPE -- 반환값
)
IS
BEGIN
    SELECT ENAME, SAL INTO OUT_EMP, OUT_SAL
    FROM EMP
    WHERE EMPNO = IN_EMP;
END PRO_TEST_PRAM_OUT; -- 반환 값이 있을 경우
/

-- PROCEDURE(사원번호, 사원이름, 급여)

DECLARE
    PRO_OUTPUT_ENAME EMP.ENAME%TYPE;
    PRO_OUTPUT_SAL EMP.SAL%TYPE;
    
BEGIN
    PRO_TEST_PRAM_OUT(7369, PRO_OUTPUT_ENAME, PRO_OUTPUT_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || PRO_OUTPUT_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || TO_CHAR(PRO_OUTPUT_SAL));
END;
/

SELECT * FROM EMP;

-- PRO_TEST_PRAM_OUT 프로시저 이용해서 7566 사원의 이름과 급여를 출력!
DECLARE
    PRO_OUTPUT_ENAME EMP.ENAME%TYPE;
    PRO_OUTPUT_SAL EMP.SAL%TYPE;
    
BEGIN
    PRO_TEST_PRAM_OUT(7566, PRO_OUTPUT_ENAME, PRO_OUTPUT_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || PRO_OUTPUT_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || TO_CHAR(PRO_OUTPUT_SAL));
END;
/

-- IN OUT 모드 파라미터
-- : IN, OUT 동시에 수행

-- 프로시저 하나 만듦, 파라미터 INOUT_NUM NUMBER 
CREATE OR REPLACE PROCEDURE PRO_TEST_IN_OUT(
    INOUT_NUM IN OUT NUMBER
)
IS
BEGIN
    INOUT_NUM := INOUT_NUM * 100;
END PRO_TEST_IN_OUT; -- 반환값이 있을 경우에는 END 뒤에 프로시저 이름 작성!
/

DECLARE
    NUM NUMBER := 5;
BEGIN
    PRO_TEST_IN_OUT(NUM);
    DBMS_OUTPUT.PUT_LINE('NUM : ' || TO_CHAR(NUM));
END;
/

-- 프로시저 오류 생겼을 때
CREATE OR REPLACE PROCEDURE PRO_ERROR
IS -- 선언부
    ERROR_NO NUMBER;
BEGIN
    ERROR_NO = 100; -- 대입 연산자 잘못 작성 (:= -> =)
    DBMS_OUTPUT.PUT_LINE('ERROR_NO : '|| TO_CHAR(ERROR_NUM));
END;
/

-- 컴파일러 로그 확인법
SHOW ERRORS;
SHOW ERR;

SHOW ERRORS PROCEDURE PRO_ERROR;
-- SHOW ERRORS/ERR 프로그램 종류 프로그램 이름;

SELECT *
FROM USER_ERRORS -- 데이터 사전 (SQL DEVELOPER 조회 불가)
WHEN NAME = 'PRO_ERROR';

/*
2) 함수 (FUNCTION)
프로시저 VS 함수 (SUBSTR, MAX, MIN, .... 내장 함수 / 사용자 정의)
프로시저: PL/SQL 호출 가능, 파라미터 모드 (IN, OUT, IN OUT), 반환값 (OUT 모드 파라미터)이 여러 개일 수 있음
함수: SQL, PL/SQL 호출 가능, 파라미터 모드 (IN, 생략), 반환값이 오직 하나 (RETURN문에 작성)

*/

/* 사용자 정의 함수 생성

형식)
CREATE [OR REPLACE] FUNCTION 함수 이름
[(파라미터 이름1[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
  파라미터 이름2[modes (생략 가능)] 자료형 [ := | DEFAULT 기본값 (생략 가능)],
 .......
 )]
RETURN 자료형; -- 반환값의 자료형

IS | AS -- 선언부 (DECLARE 대신 사용, 선언부가 없어도 무조건 작성)
BEGIN
    RETURN (반환값);
EXCEPTION -- 생략 가능
END [프로시저 이름]; -- 프로시저 이름은 생략 가능

*/

-- 함수 생성 (두 정수를 덧셈)
CREATE OR REPLACE FUNCTION ADD_FUNC(
    ANUMBER NUMBER,
    BNUMBER NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN ANUMBER + BNUMBER;
END ADD_FUNC;
/


DECLARE
    RESNUMBER NUMBER;
BEGIN
    RESNUMBER := ADD_FUNC(10, 20);
    DBMS_OUTPUT.PUT_LINE('두 수의 합 : ' || TO_CHAR(RESNUMBER));
END;
/

-- 함수 생성
-- SAL * 12 + COMM
-- 소수점 두번째 자리까지만 표현 (세번째 자리에서 반올림)

CREATE OR REPLACE FUNCTION ANNSAL(
    EMP_SAL EMP.SAL%TYPE,
    EMP_COMM EMP.COMM%TYPE
)
RETURN NUMBER
IS
BEGIN
    RETURN (ROUND(EMP_SAL * 12 + NVL(EMP_COMM, 0), 2)); -- RETURN 뒤에 소괄호! 필요
END ANNSAL;
/

-- 프로시저 (PLSQL에서만 사용할 수 있음)랑 다르게 함수는 PLSQL, SQL에서도 사용이 가능!
SELECT EMPNO, ENAME, ANNSAL(SAL, COMM)
FROM EMP;

-- 함수 삭제
DROP FUNCTION ANNSAL;


/*
3) 패키지 (package)
: 기능 상으로 비슷한 프로시저, 함수 등을 하나로 묶어서 관리하는 객체
: 패키지 = 프로시저1, 프로시저2, 함수1, 함수2 .... (비슷한 기능을 하는 프로그램을 묶어서 관리)

장점?
1) 관리 쉬움 (패키지를 하나의 모듈로써 표현)
2) 각 서브 프로그램의 정보 은닉 (외부 노출 / 접근 여부)
*/

-- 패키지
-- 1) 명세 (선언부)
/*
형식)
CREATE [OR REPLACE] PACKAGE 패키지 이름
IS | AS
    서브 프로그램 선언
END [패키지 이름];
*/

CREATE OR REPLACE PACKAGE PKG_TEST
IS
    FUNCTION ANNSAL(EMP_SAL EMP.SAL%TYPE, EMP_COMM EMP.COMM%TYPE) RETURN NUMBER;
    /*IN (패키지 명세 작성시 IN 부분만 파라미터 작성), OUT (패키지 본문 작성시 파라미터 작성)*/
    PROCEDURE PRO_EMP(EMP_EMPNO EMP.EMPNO%TYPE); -- EMPNO (IN 모드 파라미터)를 통해 사원 이름, 급여 (OUT 모드 파라미터)를 반환
    PROCEDURE PRO_DEPT(DEPT_DEPTNO DEPT.DEPTNO%TYPE); -- DEPTNO (IN 모드 파라미터)를 통해 부서 이름, 부서 위치 (OUT 모드 파라미터)를 반환
END;
/

-- 패키지 조회 (USER_SOURCE 데이터 사전 조회 OR DESC 명령어)
SELECT * 
FROM USER_SOURCE
WHERE TYPE = 'PACKAGE';

DESC PKG_TEST;
-- DESCRIBE 명령어 (객체의 구조 확인)
DESC EMP;
DESC DEPT;

-- 2) 본문 (body)
/*
형식)
CREATE [OR REPLACE] PACKAGE BODY 패키지 이름
IS | AS
   패키지 명세에서 선언한 서브프로그램을 정의
END [패키지 이름];
*/



CREATE OR REPLACE PACKAGE BODY PKG_TEST
IS
    FUNCTION ANNSAL(EMP_SAL EMP.SAL%TYPE, EMP_COMM EMP.COMM%TYPE) RETURN NUMBER
        IS
        BEGIN
            RETURN (ROUND(EMP_SAL * 12 + NVL(EMP_COMM, 0), 2));
    END ANNSAL;
    
    /*IN (패키지 명세 작성시 IN 부분만 파라미터 작성), OUT (패키지 본문 작성시 파라미터 작성)*/
    PROCEDURE PRO_EMP(EMP_EMPNO EMP.EMPNO%TYPE) -- EMPNO (IN 모드 파라미터)를 통해 사원 이름, 급여 (OUT 모드 파라미터)를 반환
        IS
            EMP_ENAME EMP.ENAME%TYPE; -- OUT 모드를 작성하지 않아도 패키지 본문에서 정의되는 파라미터는 OUT 모드이기 떄문에 생략 가능
            EMP_SAL EMP.SAL%TYPE;
        BEGIN
            SELECT ENAME, SAL INTO EMP_ENAME, EMP_SAL
            FROM EMP
            WHERE EMPNO = EMP_EMPNO;
            
            DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_ENAME);
            DBMS_OUTPUT.PUT_LINE('SAL : ' || TO_CHAR(EMP_SAL));
    END PRO_EMP;
    
    PROCEDURE PRO_DEPT(DEPT_DEPTNO DEPT.DEPTNO%TYPE) -- DEPTNO (IN 모드 파라미터)를 통해 부서 이름, 부서 위치 (OUT 모드 파라미터)를 반환
        IS
            DEPT_DNAME DEPT.DNAME%TYPE;
            DEPT_LOC DEPT.LOC%TYPE;
        BEGIN
            SELECT DNAME, LOC INTO DEPT_DNAME, DEPT_LOC
            FROM DEPT
            WHERE DEPTNO = DEPT_DEPTNO;
            
            DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT_DNAME);
            DBMS_OUTPUT.PUT_LINE('LOC: ' || DEPT_LOC);
    END PRO_DEPT; -- 프로시저 정의 끝
END; -- 패키지 바디 끝
/

SHOW ERRORS;

-- 패키지 사용 (패키지 이름.함수/프로시저 이름 (IN모드 파라미터))
DECLARE
    IN_SAL EMP.SAL%TYPE;
    IN_COMM EMP.COMM%TYPE;
BEGIN
    SELECT SAL, COMM INTO IN_SAL, IN_COMM
    FROM EMP
    WHERE EMPNO = 7839;

    DBMS_OUTPUT.PUT_LINE('ANNSAL :  ' || TO_CHAR(PKG_TEST.ANNSAL(IN_SAL, IN_COMM))); -- 사원 번호 해당하는 사원의 연봉 계산 (SAL * 12 + COMM)
    PKG_TEST.PRO_EMP(7839); -- EMPNO를 IN으로 넘겨주면 ENAME, SAL 반환
    PKG_TEST.PRO_DEPT(10); -- DEPTNO를 IN으로 넘겨주면 DNAME, LOC 반환
    
END;
/

SELECT * FROM EMP;

-- 패키지 삭제
-- DROP PACKAGE 패키지 이름; -- 명세 + 본문 한꺼번에 삭제
-- DROP PACKAGE BODY 패키지 이름 -- 본문만 삭제

DROP PACKAGE PKG_TEST;

-- 4) 트리거 (trigger)
-- : 동작이나 이벤트가 발생할 경우에 자동으로 실행되는 기능
-- EX) 서버 업데이트를 시간 주중만 할 수 있게 만든다거나 DML 작업을 하려고 하는데 막아놓을 수도 있음

-- : 데이터 관련 작업을 간편하게 수행할 순 있지만 너무 많이 작성을 하면 DB 성능을 저하

-- 트리거로 지정할 수 있는 동작
/*
1) DML: INSERT, UPDATE, DELETE
2) DDL: CREATE, DROP, ALTER
3) DB 동작: SERVERERROR, LOGON, LOGOFF, STARTUP, SHUTDOWN
*/

/*
1) DML 트리거

형식)
CREATE [OR REPLACE] TRIGGER 트리거 이름
BEFORE | AFTER -- BEFORE: DML 명령어 실행 전, AFTER: DML 명령어 실행 후 시점에 트리거 동작
INSERT | UPDATE | DELETE ON 테이블 이름
FOR EACH ROW WHEN 조건식
*/

-- 트리거 제작 및 사용 (BEFORE)
CREATE TABLE EMP_TRG
AS SELECT * FROM EMP;

CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE -- 명령어 사용 전에 실행
INSERT OR UPDATE OR DELETE ON EMP_TRG   
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') NOT IN ('토', '일') THEN
        IF INSERTING THEN
--            DBMS_OUTPUT.PUT_LINE('주말 사원정보 추가 불가!');
               RAISE_APPLICATION_ERROR(-20000, '주말 사원정보 추가 불가!'); -- 사용자의 정의 예외 (-20000 ~ 20999)
        ELSIF UPDATING THEN
--            DBMS_OUTPUT.PUT_LINE('주말 사원정보 수정 불가!');
            RAISE_APPLICATION_ERROR(-20001, '주말 사원정보 수정 불가!');
        ELSIF DELETING THEN
--            DBMS_OUTPUT.PUT_LINE('주말 사원정보 삭제 불가!');
              RAISE_APPLICATION_ERROR(-20002,  '주말 사원정보 삭제 불가!');
        ELSE
--            DBMS_OUTPUT.PUT_LINE('주말 사원정보 변경 불가!');
               RAISE_APPLICATION_ERROR(-20003, '주말 사원정보 변경 불가!');
        END IF;
    END IF;
END;
/

UPDATE EMP_TRG
SET SAL = 3000
WHERE EMPNO = 7566;

SELECT * FROM EMP_TRG;

-- 트리거 제작 및 사용 (AFTER)
-- : DML 명령된 후에 작동
-- : DML 명령어 로그에 저장

CREATE TABLE EMP_TRG_LOG(
    TABLENAME VARCHAR2(10), 
    DMLTYPE VARCHAR2(10), 
    EMPNO NUMBER,
    USERNAME VARCHAR2(20), 
    CHANGEDATE DATE 
);
-- DML이 수행된 테이블 이름
-- DML 명령어 종류
-- DML을 수행한 사용자 이름
-- DML 수행된 날짜