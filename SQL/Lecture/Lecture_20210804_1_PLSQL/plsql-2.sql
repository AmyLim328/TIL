/*
변수의 자료형
1) 스칼라형 (SCALAR TYPE)
-- : 오라클에서 제공하는 기본형
-- : 내부에 들어갈 값이 오직 하나
-- EX) VARCHAR, NUMBER, DATE, BOOLEAN (PL/SQL)

2) 참조형 (REFERENCE TYPE, %ROWTYPE, %TYPE)
-- : 행 참조 (테이블이름%ROWTYPE): 테이블에 들어간 자료형 모두 참조 (SELECT * INTO 변수명) (순서/자료형/개수 모두 일치)
-- : 열 참조 (테이블이름.열이름%TYPE): 열에 들어간 자료형 참조 (열의 자료형은 무조건 1개)

3) 복합형 (COMPOSITE TYPE)
-- : 여러 종류의 개수 데이터를 저장할 수 있는 자료형
-- A. 레코드 (RECORD): 테이블의 행 (데이터의 자료형이 여러 개 일수도 있음)
-- B. 컬렉션 (COLLECTION): 데이블의 열 (데이터의 자료형이 하나)

A. 레코드
형식)
TYPE 레코드이름 IS RECORD(
    변수이름 자료형 NOT NULL := (또는 DEFAULT) 값 
);

-- 변수이름: 레코드 안에 들어갈 변수 지정 (여러 개 올 수 있음 (, 구분))
-- 자료형: 변수의 자료형 지정 (%TYPE, %ROWTYPE 가능)
-- NOT NULL, DEFAULT 생략 가능
*/

DECLARE
    -- 레코드도 하나의 자료형 (클래스)
    TYPE REC_TEST IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE, 
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_TEST; -- 레코드 타입을 갖는 DEPT_REC 변수 지정
    DEPT_REC2 REC_TEST; -- 레코드 타입을 갖는 DEPT_REC2 변수 지정
BEGIN
    -- 각 레코드에 포함된 변수는 레코드이름.변수이름으로 사용 가능
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'DB';
    DEPT_REC.LOC := 'USA';
    
    -- 본인이 원하는 걸로 지정!
    DEPT_REC2.DEPTNO := 60;
    DEPT_REC2.DNAME := 'WEB DEVELOPER';
    DEPT_REC2.LOC := 'SEOUL';
    
    -- 출력
    /*
    DBMS_OUTPUT.PUT(): print()
    DBMS_OUTPUT.PUT_LINE(): println()
    */
    DBMS_OUTPUT.PUT_LINE('DEPT_REC.DEPTNO : ' || DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC.DNAME : ' || DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC.LOC : ' || DEPT_REC.LOC);
    
    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.DEPTNO : ' || DEPT_REC2.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.DNAME : ' || DEPT_REC2.DNAME);
    DBMS_OUTPUT.PUT_LINE('DEPT_REC2.LOC : ' || DEPT_REC2.LOC);
    
END;
/

SELECT * FROM DEPT;

-- 레코드를 이용해서 TABLE에 INSERT, UPDATE문 가능
-- 1) DEPT_RECORD 테이블 생성 (DEPT 테이블의 구조와 데이터를 모두 가지고 옴)
DROP TABLE DEPT_RECORD;
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;


-- 2) 레코드 이용해서 데이터를 INSERT
DECLARE
    -- 레코드도 하나의 자료형 (클래스)
    TYPE REC_TEST IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE, 
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_TEST; -- 레코드 타입을 갖는 DEPT_REC 변수 지정
    DEPT_REC2 REC_TEST; -- 레코드 타입을 갖는 DEPT_REC2 변수 지정
BEGIN
    -- 각 레코드에 포함된 변수는 레코드이름.변수이름으로 사용 가능
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'DB';
    DEPT_REC.LOC := 'USA';
    
    -- 본인이 원하는 걸로 지정!
    DEPT_REC2.DEPTNO := 60;
    DEPT_REC2.DNAME := 'WEB DEVELOPER';
    DEPT_REC2.LOC := 'SEOUL';
    
    -- VALUES 통해 데이터를 넣을 때 하나하나 데이터 명시
    -- VALUES에 레코드를 통해 행 전체를 삽입 (레코드 이름만 명시)
    INSERT INTO DEPT_RECORD
    VALUES DEPT_REC;
    
    INSERT INTO DEPT_RECORD
    VALUES DEPT_REC2;
END;
/

SELECT * FROM DEPT_RECORD;


-- 3) 레코드 이용해서 데이터를 UPDATE
DECLARE
    -- 레코드도 하나의 자료형 (클래스)
    TYPE REC_TEST IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE, 
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_TEST; -- 레코드 타입을 갖는 DEPT_REC 변수 지정
    DEPT_REC2 REC_TEST; -- 레코드 타입을 갖는 DEPT_REC2 변수 지정
    DEPT_REC_REVISED REC_TEST; -- 레코드 타입을 갖는 DEPT_REC_REVISED 변수 지정 (수정할 데이터를 담음)
BEGIN
--    -- 각 레코드에 포함된 변수는 레코드이름.변수이름으로 사용 가능
--    DEPT_REC.DEPTNO := 50;
--    DEPT_REC.DNAME := 'DB';
--    DEPT_REC.LOC := 'USA';
--    
--    -- 본인이 원하는 걸로 지정!
--    DEPT_REC2.DEPTNO := 60;
--    DEPT_REC2.DNAME := 'WEB DEVELOPER';
--    DEPT_REC2.LOC := 'SEOUL';

    DEPT_REC_REVISED.DEPTNO := 50;
    DEPT_REC_REVISED.DNAME := 'DATABASE';
    DEPT_REC_REVISED.LOC := 'BUSAN';
    
    
    -- VALUES에 레코드를 통해 행 전체 수정 (UPDATE ~~  SET + ROW 키워드)
    UPDATE DEPT_RECORD
    SET ROW = DEPT_REC_REVISED
    WHERE DEPTNO = 50;
    
END;
/

SELECT * FROM DEPT_RECORD;


-- Q1. 테이블 생성 (GOOTT_STUDENT)
-- 속성: ID, NUMBER(4)
--      NAME, VARCHAR(10)
--      SEATNUM, NUMBER(2)

-- 테이블의 열 이름을 지정할 때는 명확하게 지정하는 것이 좋음 
--(많이 사용하는 ID, NAME .... 사용하지 않는 게 좋음)

DROP TABLE GOOTT_STUDENT;
CREATE TABLE GOOTT_STUDENT(
    STUID NUMBER(4),
    STUNAME VARCHAR(10),
    SEATNUM NUMBER(2)
);

-- 테이블의 데이터를 삽입하기 위해 레코드를 생성하고 레코드를 통해 데이터를 삽입
-- (1, 'EUNBIN', 0)
-- (2, 'GILDONG', 5)

DECLARE
    TYPE STUDENT IS RECORD(
        STUID GOOTT_STUDENT.STUID%TYPE,
        STUNAME GOOTT_STUDENT.STUNAME%TYPE,
        SEATNUM GOOTT_STUDENT.SEATNUM%TYPE
    );  
    STUDENT_REC1 STUDENT;
    STUDENT_REC2 STUDENT;
BEGIN
    STUDENT_REC1.STUID := 1;
    STUDENT_REC1.STUNAME := 'EUNBIN';
    STUDENT_REC1.SEATNUM := 0;

    STUDENT_REC2.STUID := 2;
    STUDENT_REC2.STUNAME := 'GILDONG';
    STUDENT_REC2.SEATNUM := 1;
    
    INSERT INTO GOOTT_STUDENT
    VALUES STUDENT_REC1;

    INSERT INTO GOOTT_STUDENT
    VALUES STUDENT_REC2;
    
END;
/
SELECT * FROM GOOTT_STUDENT;

-- 생성한 레코드를 통해 데이터를 수정
DECLARE
    TYPE STUDENT IS RECORD(
        STUID GOOTT_STUDENT.STUID%TYPE,
        STUNAME GOOTT_STUDENT.STUNAME%TYPE,
        SEATNUM GOOTT_STUDENT.SEATNUM%TYPE
    );
    
    STUDENT_REC_REVISED STUDENT;
BEGIN
    STUDENT_REC_REVISED.STUID := 2;
    STUDENT_REC_REVISED.STUNAME := 'GILDONG';
    STUDENT_REC_REVISED.SEATNUM := 5;

    UPDATE GOOTT_STUDENT
    SET ROW = STUDENT_REC_REVISED
    WHERE STUID = 2;
END;
/



-- 레코드 안에 레코드 (중첩 레코드, nested record)
-- class Student{
--      int id;
--      String name;
--      Department department; 
--}


DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );                
    TYPE REC_EMP IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DEPART REC_DEPT -- 레코드 안에 레코드가 들어간 형태
    );
    EMP_INFO REC_EMP;
BEGIN
    -- EMP 테이블에서 사원 번호 7654인 사원의 정보 (EMPNO, ENAME, DEPART (DEPTNO, DNAME, LOC))
    SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
    INTO EMP_INFO.EMPNO, EMP_INFO.ENAME, EMP_INFO.DEPART.DEPTNO, EMP_INFO.DEPART.DNAME, EMP_INFO.DEPART.LOC
    -- 열 이름 순서, 개수, 자료형 일치
    
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE E.EMPNO = 7654;
    
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || EMP_INFO.EMPNO);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_INFO.ENAME);
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || EMP_INFO.DEPART.DEPTNO);
END;
/

SELECT * FROM EMP;

-- B. 컬렉션
-- : 데이터 자료형이 동일한 데이터만 저장할 수 있음
-- : 테이블의 열과 같은 형태

-- 연관 배열 (+ 반복문)
-- : associative array (or index by table)
-- : 키 (key)(인덱스) + 값 (value)
-- : 키 (인덱스) 중복 X

/*
형식)
TYPE 연관 배열 이름 IS TABLE OF 자료형 [NOT NULL (생략 가능)] -- 자료형: 스칼라형, 참조형 (%TYPE, %ROWTYPE)
INDEX BY 인덱스 자료형; -- 정수 (BINARY_INTEGER, PLS_INTEGER) (PL/SQL 데이터 자료형) (**), 문자형 (VARCHAR, VARCHAR2)
*/


DECLARE
    -- 컬렉션 (자료형)
    TYPE ARRAY_TEST IS TABLE OF VARCHAR(20)
    INDEX BY PLS_INTEGER;
    -- 인덱스 (정수)를 통해 ARRAY_TEST 배열 원소를 접근
    -- 인덱스 (정수): -1, 0, 1, 2, .....100
    ARRAY_TEST1 ARRAY_TEST;
BEGIN
    ARRAY_TEST1(0) := '0번 데이터';
    ARRAY_TEST1(2) := '2번 데이터';
    ARRAY_TEST1(3) := '3번 데이터';
    
    DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(0));
    DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(2));
    DBMS_OUTPUT.PUT_LINE(ARRAY_TEST1(3));
END;
/

-- 연관 배열이 반복문과 만나면 응용할 수 있는 게 많음!
DECLARE
    -- 연관 배열 + 레코드 (record)
    -- 연관 배열 안에 데이터 자료형이 레코드가 될 수가 있음 (테이블의 정보를 저장할 수 있는 자료형)
--    TYPE REC_DEPT IS RECORD (
--        DEPTNO DEPT.DEPTNO%TYPE,
--        DNAME DEPT.DNAME%TYPE,
--        LOC DEPT.LOC%TYPE
--    );

    
--    TYPE ASSARRAY IS TABLE OF REC_DEPT
--    INDEX BY PLS_INTEGER;
--    
    -- 연관 배열 안에 데이터 자료형이 ROWTYPE (행 참조형)이 올 수도 있음 
    -- (참조할 테이블이 있고, 해당 테이블의 구조를 가지고 오고 싶으면)
    TYPE ASSARRAY IS TABLE OF DEPT%ROWTYPE
    INDEX BY PLS_INTEGER;
    DEPT_ARRAY ASSARRAY;
    idx PLS_INTEGER := 0;
    
BEGIN
    -- i (counter): %ROWTYPE
    FOR i IN (SELECT DEPTNO, DNAME, LOC FROM DEPT) LOOP
        idx := idx + 1;
        DEPT_ARRAY(idx).DEPTNO := i.DEPTNO;
        DEPT_ARRAY(idx).DNAME := i.DNAME;
        DEPT_ARRAY(idx).LOC := i.LOC;
        
        DBMS_OUTPUT.PUT_LINE(DEPT_ARRAY(idx).DEPTNO || ' ' || DEPT_ARRAY(idx).DNAME || ' ' || DEPT_ARRAY(idx).LOC);
        
    END LOOP;

END;
/

-- EMP 테이블의 EMPNO, ENAME, JOB의 데이터 자료형을 참조하는 RECORD 만들고, 
-- 해당 RECORD를 하나의 요소로 갖는 연관 배열을 만들어보자!

-- 그리고 EMP 테이블의 EMPNO, ENAME, JOB을 복사해서 연관배열에 저장 및 출력해보자!

DECLARE
    TYPE REC_EMP IS RECORD (
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        JOB EMP.JOB%TYPE
    );
    TYPE ASSARRAY IS TABLE OF REC_EMP -- (EMP%ROWTYPE 가능할까요 ? 어려움 (열의 개수가 안 맞음))
    INDEX BY PLS_INTEGER;
    
    EMP_ARRAY ASSARRAY;
    idx PLS_INTEGER := 0;
    
BEGIN
    FOR i IN (SELECT EMPNO, ENAME, JOB FROM EMP) LOOP
        idx := idx + 1;
        EMP_ARRAY(idx).EMPNO := i.EMPNO;
        EMP_ARRAY(idx).ENAME := i.ENAME;
        EMP_ARRAY(idx).JOB := i.JOB;
        
        DBMS_OUTPUT.PUT_LINE(EMP_ARRAY(idx).EMPNO || ' ' || EMP_ARRAY(idx).ENAME || ' ' || EMP_ARRAY(idx).JOB);
        
    END LOOP;

END;
/


SELECT * FROM EMP;


-- 컬렉션 메소드
/*
1) EXISTS(n): n 인덱스의 데이터 존재하면 true, 존재하지 않으면 false
2) COUNT: 저장된 요소 개수 반환
3) FIRST: 첫번째 인덱스 번호 반환
4) LAST: 마지막 인덱스 번호 반환
5) PRIOR(n): n 인덱스 바로 앞 인덱스 값 반환 (없으면 NULL 반환)
6) NEXT(n): n 인덱스 바로 다음 인덱스 값 반환 (없으면 NULL 반환)
7) DELETE: 저장된 요소를 지움
DELETE: 모든 요소 삭제
DELETE(n): n 인덱스의 요소를 삭제
DELETE(n, m): n 인덱스 ~ m 인덱스 요소를 삭제

* 컬렉션 이름.메소드 이름 호출 (메소드 이름에 () 없음)
*/

DECLARE
    TYPE ARRAY_METHOD IS TABLE OF VARCHAR(20)
    INDEX BY PLS_INTEGER;
    
    TEST_ARRAY ARRAY_METHOD;
BEGIN
    TEST_ARRAY(1) := '1번 데이터';
    TEST_ARRAY(2) := '2번 데이터';
    TEST_ARRAY(3) := '3번 데이터';
    TEST_ARRAY(-50) := '-50번 데이터';
    TEST_ARRAY(100) := '100번 데이터';
    
    IF TEST_ARRAY.EXISTS(1) THEN
        DBMS_OUTPUT.PUT_LINE('1번 인덱스 요소 존재!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('1번 인덱스 요소 존재 X');
    END IF;
    
    IF TEST_ARRAY.EXISTS(-50) THEN
        DBMS_OUTPUT.PUT_LINE('-50번 인덱스 요소 존재!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('-50번 인덱스 요소 존재 X');
    END IF;
    
    IF TEST_ARRAY.EXISTS(100) THEN
        DBMS_OUTPUT.PUT_LINE('100번 인덱스 요소 존재!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('100번 인덱스 요소 존재 X');
    END IF;

    TEST_ARRAY.DELETE(1); -- 1번 요소 삭제
    IF TEST_ARRAY.EXISTS(1) THEN
        DBMS_OUTPUT.PUT_LINE('1번 인덱스 요소 존재!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('1번 인덱스 요소 존재 X');
    END IF;
    
    TEST_ARRAY.DELETE(2, 3); -- 2 ~ 3번 요소 삭제
    
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.COUNT);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.FIRST);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.LAST);
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE(TEST_ARRAY.NEXT(-100));
END;
/
