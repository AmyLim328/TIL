-- PL/SQL: SQL만으로는 구현이 어려운 작업을 수행하기 위해서 오라클에서 제공한 언어
-- EX) 조건문, 반복문, 변수설정 ...
-- : DB 작업을 수행하는 명령어 + 실행 명령어
-- : 블록 단위로 작성
-- ※ 블록 (block): PL/SQL 프로그램의 기본 단위

/*
형식)

DECLARE (생략 가능)
[선언부];
BEGIN
[명령어];
EXCEPTION (생략 가능)
[오류 처리];
END;
/

*/

-- 화면에 문자열 출력 (SERVEROUTPUT ON으로 변경)
-- : DB 연결이 끊겼거나 재접속할 때 다시 실행해줘야 함
SET SERVEROUTPUT ON; 

BEGIN
    DBMS_OUTPUT.PUT_LINE('HI ORACLE PL/SQL!');
END;
/
-- /: 작성이 끝났다! 
-- 실행: CTRL + ENTER, F9

-- 변수와 상수
-- 1) 변수 (variable)
-- : 데이터 저장하는 공간 (변수 이름 + 자료형)
-- : DECLARE (선언부)에 작성
-- 형식) 변수 이름 자료형 := 값

DECLARE -- 선언부
    SCOTT_NUM NUMBER(4) := 1234; -- 변수 생성하자마자 데이터 초기화
    SCOTT_BIRTHDAY DATE; -- 변수만 생성
BEGIN -- 실행부
    SCOTT_BIRTHDAY := SYSDATE; -- 실행부에서 데이터 선언
    DBMS_OUTPUT.PUT_LINE('ID: ' || SCOTT_NUM);
    DBMS_OUTPUT.PUT_LINE('BIRTHDAY: ' || SCOTT_BIRTHDAY);
END;
/

-- Q1. 두 수를 저장하는 변수를 만들고 해당 수 더하는 출력문 작성
DECLARE
    NUM_1 NUMBER(5) := 10;
    NUM_2 NUMBER(5) := 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE(NUM_1 + NUM_2);
END;
/
-- Q2. 본인이 좋아하는 음악, 영화를 저장하는 변수를 만들고 그 변수를 출력문 작성
DECLARE
    MY_MUSIC VARCHAR(20) := '신호등';
    MY_MOVIE VARCHAR(50) := '지금 만나러 갑니다';
BEGIN
    DBMS_OUTPUT.PUT_LINE(MY_MUSIC);
    DBMS_OUTPUT.PUT_LINE(MY_MOVIE);
END;
/

-- 2) 상수 (Constant)
-- : 변하지 않는 값 (프로그램이 종료될 때까지 변하지 않음)
-- 형식) 변수 이름 CONSTANT 자료형 := 값;

DECLARE
    PI CONSTANT NUMBER(5, 2) := 3.14;
    RADIUS NUMBER(5) := 5;
BEGIN
    -- 원의 넓이를 구해서 출력
    DBMS_OUTPUT.PUT_LINE('AREA: ' || PI * RADIUS * RADIUS);
    -- 원의 둘레를 구해서 출력
    DBMS_OUTPUT.PUT_LINE('PERI: ' || PI * RADIUS * 2);
END;
/

-- 3) 변수의 기본값 설정
-- : DEFAULT 키워드 사용
-- 형식) 변수 이름 자료형 DEFAULT 디폴트 값;

DECLARE
    SCOTT_ID NUMBER(2) DEFAULT 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_ID);
END;
/

/*
기본값 설정 이유 ? 
만약에 아무런 값이 들어가지 않을 경우 (NULL 값) 출력 오류가 생길 수 있음 => 방지
*/

-- 4) 변수에 NOT NULL 지정
-- : 특정 변수에 NULL값을 넣을 수가 없음
-- : NOT NULL 키워드를 사용하는 변수는 반드시 변수 선언과 동시에 데이터 초기화! (DECLARE 부분에서)
-- 형식) 변수 이름 자료형 NOT NULL := 값;

DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL := ''; -- 오류
    /*
    '' (빈 문자열), NULL, 데이터 입력자체를 안하는 것 => NULL
    */
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
END;
/

DECLARE
    SCOTT_NAME VARCHAR(20) NOT NULL DEFAULT ' '; -- 아무런 값이 들어가지 않을 경우 ' ' 문자로 초기화
    /*
    '' (빈 문자열), NULL, 데이터 입력자체를 안하는 것 => NULL
    */
BEGIN
    DBMS_OUTPUT.PUT_LINE(SCOTT_NAME);
END;
/

/* 변수이름 명명법
1) 같은 블록 내에서 변수이름이 중복될 수가 없음
2) 대소문자 구별 X (ABC = abc)
*/

-- 변수의 자료형 (데이터타입, datatype)
-- 1) 스칼라형 (scalar type): 오라클에서 기본으로 정의한 자료형
-- : 내부에 넣을 수 있는 값이 하나
-- EX) 숫자 (NUMBER), 문자열 (CHAR (고정 길이), VARCHAR (표준), VARCHAR2 (가변 길이, ORACLE 표준)), 날짜 (DATE)
--     논리형 (BOOLEAN) (PL/SQL에만 존재, true, false, NULL)

-- 2) 참조형 (reference type)
-- : 어떤 테이블의 열/행 참조하는 자료형
-- a. 열 참조 (변수 이름 테이블이름.열이름%TYPE): 참조할 테이블 열과 동일한 자료형(크기) (하나의 열)
-- b. 행 참조: (변수 이름 테이블%ROWTYPE): 참조할 테이블의 하나의 행 참조 자료형 (하나의 행)

-- a. 열 참조
DECLARE
    DEPTNO2 DEPT.DEPTNO%TYPE := 50; -- DEPT.DEPTNO 열과 동일한 자료형 사용
    EMPNO2 EMP.EMPNO%TYPE := 7000; -- EMP.EMPNO 열과 동일한 자료형 사용
    SAL2 EMP.SAL%TYPE := 5000; -- EMP.SAL 열과 동일한 자료형 사용
    COMM2 EMP.COMM%TYPE := NULL; -- EMP.COMM 열과 동일한 자료형 사용
    HIREDATE2 EMP.HIREDATE%TYPE := TO_DATE('2001/1/1', 'YYYY/MM/DD'); -- EMP.HIREDATE 열과 동일한 자료형 사용
BEGIN
    DBMS_OUTPUT.PUT_LINE('DEPTNO2: ' || DEPTNO2);
    DBMS_OUTPUT.PUT_LINE('EMPNO2: ' || EMPNO2);
    DBMS_OUTPUT.PUT_LINE('SAL2: ' || SAL2);
    DBMS_OUTPUT.PUT_LINE('COMM2: ' || COMM2);
    DBMS_OUTPUT.PUT_LINE('HIREDATE2: ' || HIREDATE2);
END;
/
-- EMP 테이블의 EMPNO를 참조하는 EMPNO2 (참조형 변수)
-- EMP 테이블의 SAL, COMM을 참조하는 SAL2, COMM2 (참조형 변수)
-- EMP 테이블의 HIREDATE를 참조하는 HIREDATE2 (참조형 변수)

-- b. 행 참조 (전체 테이블 구조를 다 가지고 옴 => 하나의 행이 가지는 자료형을 다 쓸 수 있음)
DECLARE
    DEPT2 DEPT%ROWTYPE;
    -- DEPT 테이블의 모든 속성값을 다 가지고 옴 (DEPTNO, DNAME, LOC)
BEGIN
    -- "하나"의 행을 조회하는 SELECT문
    SELECT * INTO DEPT2
    FROM DEPT
    WHERE DEPTNO = 20;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT2.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DEPT2.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT2.LOC);
END;
/
-- Q1. EMP 테이블을 참조하는 EMP2 (사원 근무 부서 'ACCOUNTING')

-- 오류 발생!
-- SELECT ~~ 의 결과값이 3행
DECLARE
    EMP2 EMP%ROWTYPE; -- EMP 테이블의 행 구조
    -- 참조형 변수에는 결과값이 하나의 행 (ROWTYPE)이거나 하나의 열 (TYPE)이 들어올 수 있음
BEGIN
    SELECT E.* INTO EMP2 -- EMP2가 가지고 있는 열의 개수/자료형과 SELECT문의 결과 열의 개수/자료형 같아야 함!
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
--    WHERE E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING')
    WHERE D.DNAME = 'ACCOUNTING'
    AND E.SAL >= 5000;
    
    DBMS_OUTPUT.PUT_LINE('EMP2_ENAME: ' || EMP2.ENAME);
    DBMS_OUTPUT.PUT_LINE('EMP2_EMPNO: ' || EMP2.EMPNO);
END;
/

-- 3) 복합형 (composite type), LOB (large object) 형
-- : 여러 종류 및 개수의 데이터를 저장하기 위해 사용자가 정의한 자료형
-- EX) 컬렉션 (collection), 레코드 (record) (이후 학습)

-- a. 컬렉션 (collection): 자료형 TABLE (한 가지 자료형의 데이터를 여러 개 저장, = 테이블의 열 유사)
-- b. 레코드 (record): 테이블의 행 (레코드) (자료형이 여러 개 일수도 있음, = 테이블의 행 유사)


-- 조건문/반복문
-- : 조건문: IF문, CASE문
-- 1) IF문 
-- IF-THEN: 조건이 참이면 수행
-- IF-THEN-ELSE: 조건 참/거짓인지에 따라 수행문 달라짐
-- IF-THEN-ELSIF: 조건을 여러 개 지정할 수 있음
-- 자바: ELSE IF
-- PL/SQL: ELSIF
-- 파이썬: ELIF

-- IF-THEN
-- IF 조건문 THEN
-- 수행할 명령어;
-- END IF;

-- 홀수 판별 프로그램
DECLARE
    TEST_NUM NUMBER(2) := 25;
BEGIN
    IF MOD(TEST_NUM, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ODD NUMBER');
    END IF;
END;
/

SELECT * FROM EMP;
-- EMP 테이블 행 참조 EMP3 (EMPNO 7902인 행 참조)
-- EMP3.ENAME 안에 E가 들어가면 'E가 있습니다!' 문자열 출력

DECLARE
    EMP3 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP3
    FROM EMP
    WHERE EMPNO = 7902;
    
    IF EMP3.ENAME LIKE '%E%' THEN
        DBMS_OUTPUT.PUT_LINE('E IS IN NAME');
    ELSE
        DBMS_OUTPUT.PUT_LINE('E ISN''T IN NAME');
    END IF;
END;
/

-- ELSIF
-- 이름에 'E'가 있으면 'E IS IN NAME'
-- 이름에 'A'가 있으면 'A IS IN NAME'
-- 이름에 'M'이 있으면 'M IS IN NAME'
-- 아무것도 없으면 'NOTHING'

DECLARE
    EMP3 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP3
    FROM EMP
    WHERE EMPNO = 7902;
    
    IF EMP3.ENAME LIKE '%E%' THEN
        DBMS_OUTPUT.PUT_LINE('E IS IN NAME');
    ELSIF EMP3.ENAME LIKE '%A%' THEN
        DBMS_OUTPUT.PUT_LINE('A IS IN NAME');
    ELSIF EMP3.ENAME LIKE '%M%' THEN
        DBMS_OUTPUT.PUT_LINE('M IS IN NAME');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOTHING');
    END IF;
END;
/

-- EMPNO가 7902인 사원을 참조하는 EMP4를 참조형 변수 생성
-- SAL >= 5000이상 일 경우, 세금 15%
-- SAL >= 4000이상 일 경우, 세금 10%
-- SAL >= 3000이상 일 경우, 세금 8%
-- 나머지 SAL에 대해서는 세금 5% 매긴다고 가정
-- 지불해야하는 세금을 계산 출력

DECLARE
    EMP4 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP4
    FROM EMP
    WHERE EMPNO = 7902;
    
    IF EMP4.SAL >= 5000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.15);
    ELSIF EMP4.SAL >= 4000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.1);
    ELSIF EMP4.SAL >= 3000 THEN
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.08);
    ELSE
        DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.05);
    END IF;
END;
/

-- CASE 조건문
-- : IF문을 조금 더 단순화시킨 버전
-- 1) 단순 CASE문: 비교 기준 값 명시 (= 만 가능)
-- CASE 비교 기준
--  WHEN 값1 THEN
--      명령어;
--  WHEN 값2 THEN
--      명령어;
--  WHEN 값3 THEN
--      명령어;
--  ...
--  ELSE
--      명령어;
-- END CASE;

-- Q1. EMPNO가 7654인 사람을 참조형 변수 EMP5의 
-- 입사년도가 1980, 1981, 1982인지 확인하는 조건식 작성


SELECT * FROM EMP;

DECLARE
    EMP5 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP5
    FROM EMP
    WHERE EMPNO = 7654;
    
    CASE TO_CHAR(EMP5.HIREDATE, 'YYYY')
--    CASE SUBSTR(EMP5.HIREDATE, 1, 4)
--      CASE LPAD(EMP5.HIREDATE, 4)
        WHEN '1980' THEN
            DBMS_OUTPUT.PUT_LINE('1980');
        WHEN '1981' THEN
            DBMS_OUTPUT.PUT_LINE('1981');
        WHEN '1982' THEN
            DBMS_OUTPUT.PUT_LINE('1982');
        ELSE
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(EMP5.HIREDATE, 'YYYY'));
    END CASE;
END;
/



-- 2) 검색 CASE문: 조건식 (IF문과 거의 유사) (조건식에 =이 아닌 다양한 문장을 쓸 수 있음)
-- CASE 
--  WHEN 조건식1 THEN
--      명령어;
--  WHEN 조건식2 THEN
--      명령어;
--  WHEN 조건식3 THEN
--      명령어;
--  ...
--  ELSE
--      명령어;
-- END CASE;

DECLARE
    EMP4 EMP%ROWTYPE;
BEGIN
    SELECT * INTO EMP4
    FROM EMP
    WHERE EMPNO = 7902;
    
    CASE 
        WHEN EMP4.SAL >= 5000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.15);
        WHEN EMP4.SAL >= 4000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.1);
        WHEN EMP4.SAL >= 3000 THEN
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.08);
        ELSE
            DBMS_OUTPUT.PUT_LINE('TAX : ' || EMP4.SAL * 0.05);
    END CASE;
END;
/

-- SQL: DECODE(), CASE -- 정보 검색
-- PL/SQL: CASE ~ WHEN, IF -- 정보 검색 + 정보 검색 결과에 의해 수행할 작업

-- 반복문
-- A. 기본 LOOP: 무한 반복문 + (EXIT, EXIT-WHEN)
-- B. WHILE LOOP: 조건식의 결과에 따라 반복
-- C. FOR LOOP: 반복 횟수를 지정해서 반복
-- D. Cursor FOR LOOP (아직 공부 안함)

-- 반복문 수행 중단시키거나 특정 반복 주기 건너뜀
-- EXIT: 반복 종료 (IF문과 같이 쓰임)
-- EXIT-WHEN: 반복 종료 조건식 지정하고 조건식이 참이면 반복 종료
-- CONTINUE: 반복 주기 건너뜀 (IF문과 같이 쓰임)
-- CONTINUE-WHEN: 조건식이 참이면 반복 주기를 건너뜀


-- A. 기본 반복문
-- 반복문 5번 도는 문장 작성 (0, 1, 2, 3, 4)
/*
형식)
LOOP
    반복 문장;
END LOOP;

*/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        EXIT WHEN LOOP_NUM = 5;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        EXIT WHEN LOOP_NUM > 4;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        IF (LOOP_NUM > 4) THEN
            EXIT; -- 바로 종료 (+ 조건식)
        END IF;
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
        IF (LOOP_NUM > 4) THEN
            EXIT; -- 바로 종료 (+ 조건식)
        END IF;
    END LOOP;
END;
/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        IF (LOOP_NUM > 4) THEN
            EXIT; -- 바로 종료 (+ 조건식)
        END IF;
        
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- B. WHILE LOOP
-- : 조건이 참일 동안 반복
/*
형식)
WHILE 조건식 LOOP
    반복 문장
END LOOP;
*/

DECLARE
    LOOP_NUM NUMBER(5) := 0;
BEGIN
    WHILE LOOP_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || LOOP_NUM);
        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- C. FOR LOOP
-- : 반복문 횟수 지정

/*
형식)
FOR i IN 시작값 .. 종료값 LOOP
    반복 문장
END LOOP;

-- 시작값부터 1씩 증가 (**)하여 종료값에 이르면 종료
-- => 시작값 > 종료값 반복문이 실행 안됨!
-- 반대로 돌고 싶으면 REVERSE

* i: 카운터 (counter), 반복문 내에서만 사용 (DECLARE 선언부에 정의하지 않고 FOR LOOP 내에서 정의)

*/

SET SERVEROUTPUT ON;
DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN REVERSE 0..4 LOOP -- 시작값, 종료값을 수정 X, 앞에 REVERSE만 붙여주세요!
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/

-- 종료시키거나 건너뛸 수 있는 문장
-- A. EXIT
-- B. EXIT-WHEN
-- C. CONTINUE
-- D. CONTINUE-WHEN

-- CONTINUE, CONTINUE-WHEN
-- CONTINUE: 현재 반복하고 있는 주기를 무시하고 재반복 (이후 문장을 건너뜀)
-- CONTINUE-WHEN: 특정 조건식을 만족할 때 현재 반복하고 있는 주기를 무시하고 재반복 (이후 문장을 건너뜀)

DECLARE
--    LOOP_NUM NUMBER(5) := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1; -- 홀수는 건너뜀
        DBMS_OUTPUT.PUT_LINE('CURRENT NUM : ' || i);
--        LOOP_NUM := LOOP_NUM + 1;
    END LOOP;
END;
/
