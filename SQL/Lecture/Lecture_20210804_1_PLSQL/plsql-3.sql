/*
커서 (Cursor)
: SELECT문 또는 DML (Data Manipulation Lang., 데이터 조작어)와 같은 SQL문을 실행했을 때
 해당 SQL문을 처리할 수 있는 메모리 공간 (Private SQL Area)
 
 : 커서는 메모리 공간의 주소를 가리키는 포인터
 : SELECT, DML을 통해 접근해야 하는 행이 여러 개일 때 커서 이용
 
 1) 명시적 커서 (explicit cursor)
 2) 암시적 커서 (implicit cursor)
 
 SELECT ___ INTO ROWTYPE형 변수
 : 조회했을 때 데이터가 하나의 행만 가능
 : 커서는 여러 개의 행 조회 (보통은 결과 행이 하나일지 여러 개 일지 모름) -> 커서를 쓰는 게 좋음
*/

/* 1) 명시적 커서
   : 명시적으로 사용자가 직접 커서를 선언하고 사용하는 커서
   
   A. 커서 선언 (declaration)
   : SQL문 함께 선언 
   
   B. 커서 열기 (open)
   : 커서 선언할 때 작성한 SQL문 실행
   : ACTIVE SET: SQL문에 영향 받는 행
   
   C. 커서를 통해 읽어온 데이터 사용 (fetch)
   : SQL문 결과 정보를 변수 저장하고 필요한 작업을 수행
   : 각 행 별로 작업을 하기 위해 반복문과 같이 사용
   
   D. 커서 닫기 (close)
   : 모든 행에서 사용 후 커서 종료

형식)
DECLARE
    CURSOR 커서 이름 IS SQL문 - 커서 선언
BEGIN
    OPEN 커서 이름; - 커서 열기 
    FETCH 커서 이름 INTO 변수명; - 커서로 부터 읽어온 데이터 사용 
    CLOSE 커서 이름; - 커서 닫기
END;
/


*/

-- 하나의 행만 조회를 위해 커서 사용 (잘 안씀 ..!) => 커서는 조회되는 행이 여러 개일때 좋음!
DECLARE
    DEPT_ROW DEPT%ROWTYPE;
    
    -- 커서 명시적 선언 
    CURSOR TEST_CURSOR IS
    SELECT *
    FROM DEPT
    WHERE DEPTNO = 40;
BEGIN
    -- 커서 열기 (Active Set 확인)
    OPEN TEST_CURSOR;

    -- 커서로 읽은 데이터를 DEPT_ROW 변수에 대입 
    FETCH TEST_CURSOR INTO DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME  : ' || DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
    
    CLOSE TEST_CURSOR;
END;
/

-- 여러 행 조회되는 경우 (+ LOOP문)
DECLARE
    DEPT_ROW DEPT%ROWTYPE;
    
    -- 커서 선언
    CURSOR C1 IS
    SELECT *
    FROM DEPT;
    
BEGIN
    -- 커서 열기
    -- SQL문으로 영향받은 행을 확인할 수 있음 (ACTIVE SET)
    OPEN C1;
    
    LOOP
        -- 커서로 부터 읽은 데이터를 사용
        FETCH C1 INTO DEPT_ROW;
        
        -- 커서의 속성 중에 NOTFOUND를 이용하면 더 이상 읽을 데이터가 없다는 것을 알 수 있음
        -- FETCH문에서 행 추출 했으면 false, 행 추출하지 않았으면 true 반환
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME  : ' || DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
    
    END LOOP;
     
     -- 커서 닫기
    CLOSE C1;
    
END;
/

-- 커서 속성
-- 커서 이름%NOTFOUND: FETCH문을 통해 추출된 행이 있으면 false, 없으면 true 반환  (종료 조건문에 사용)
-- 커서 이름%FOUND: FETCH문을 통해 추출된 행이 있으면 true, 없으면 false 반환
-- 커서 이름%ROWCOUNT: 추출된 행 수 반환
-- 커서 이름%ISOPEN: 커서 열려 있으면 true, 없으면 false 반환

-- 커서 + FOR LOOP문
/*
형식)
FOR 루프 인덱스 이름 IN 커서 이름 LOOP
    반복 수행할 작업
END LOOP;

-- OPEN, FETCH, CLOSE 작성할 필요 없음
-- FOR LOOP이 자동으로 수행
*/

DECLARE
    CURSOR C1 IS
    SELECT *
    FROM EMP;
BEGIN
    -- 커서 FOR LOOP 시작 (OPEN, FETCH, CLOSE)
    FOR C1_IDX IN C1 LOOP -- 각 행을 C1_IDX 저장하므로 ROWTYPE형 변수가 필요 없음
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || C1_IDX.EMPNO);
        DBMS_OUTPUT.PUT_LINE('ENAME  : ' || C1_IDX.ENAME);
        DBMS_OUTPUT.PUT_LINE('JOB : ' || C1_IDX.JOB);
    END LOOP;
END;
/

SELECT * FROM TAB;

-- GOOTT_STUDENT 테이블의 행 가지고 오는 CURSOR 작성 (FOR LOOP)
DECLARE
    CURSOR C1 IS
    SELECT * FROM GOOTT_STUDENT;
BEGIN
    FOR C1_IDX IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('STUID : ' || C1_IDX.STUID);
        DBMS_OUTPUT.PUT_LINE('STUNAME : ' || C1_IDX.STUNAME);
        DBMS_OUTPUT.PUT_LINE('SEATNUM : ' || C1_IDX.SEATNUM);
    END LOOP;
END;
/

SELECT * FROM EMP;

-- 사원 부서 번호 10, 20, 30 => 실행할 문장이 다르면 따로 커서를 만들어야 함
-- 커서에 파라미터 사용

/*
형식)
CURSOR 커서 이름 (파라미터 (매개변수) 이름 자료형, ...  ) IS
SELECT ....

*/

DECLARE
    CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT * FROM DEPT WHERE DEPTNO = P_DEPTNO;
    -- P_DEPTNO 별로 커서를 새롭게 실행
    
    DEPT_ROW DEPT%ROWTYPE;
    -- 커서가 가지고 온 데이터 저장하는 변수 선언
BEGIN
    OPEN C1(10);
        LOOP
            FETCH C1 INTO DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10번 부서의 정보입니다 ...');
            DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
            DBMS_OUTPUT.PUT_LINE('DNAME  : ' || DEPT_ROW.DNAME);
            DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE C1;
    
    OPEN C1(20);
        LOOP
            FETCH C1 INTO DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('20번 부서의 정보입니다 ...');
            DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
            DBMS_OUTPUT.PUT_LINE('DNAME  : ' || DEPT_ROW.DNAME);
            DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE C1;
        
    OPEN C1(30);
        LOOP
            FETCH C1 INTO DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('30번 부서의 정보입니다 ...');
            DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_ROW.DEPTNO);
            DBMS_OUTPUT.PUT_LINE('DNAME  : ' || DEPT_ROW.DNAME);
            DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_ROW.LOC);
        END LOOP;
    CLOSE C1;
    
END;
/


DECLARE
    CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
    SELECT * FROM DEPT WHERE DEPTNO = P_DEPTNO;
    -- P_DEPTNO 별로 커서를 새롭게 실행
    
    -- 10, 20, 30번 부서 
    -- 사용자에게 입력받은 부서 번호를 저장할 변수 선언
    DEPTNO_INPUT DEPT.DEPTNO%TYPE;
BEGIN
    -- 사용자에게 부서 번호를 입력받아서(&) INPUT (치환 변수)에 넣고 DEPTNO_INPUT에 대입
    DEPTNO_INPUT := &INPUT;
    
    -- 커서 FOR LOOP
    FOR C1_IDX IN C1(DEPTNO_INPUT) LOOP
        
        DBMS_OUTPUT.PUT_LINE(DEPTNO_INPUT || '번 부서의 정보입니다 ..');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_IDX.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME  : ' || C1_IDX.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || C1_IDX.LOC);
    
    END LOOP;
    
END;
/

-- 2) 암시적 커서
-- : SQL문 작성할 때 자동으로 오라클에서 선언한 커서
-- : SELECT, DML 명령어 자동으로 생성 (OPEN, FETCH, CLOSE를 지정하지 않아도 됨)

-- 커서 속성
-- 커서 이름%NOTFOUND: 암시적 커서가 추출된 행이 있으면 false, 없으면 true 반환 
-- 커서 이름%FOUND: 암시적 커서가 추출된 행이 있으면 true, 없으면 false 반환
-- 커서 이름%ROWCOUNT: 추출된 행 수 반환
-- 커서 이름%ISOPEN: 자동으로 CLOSE되기 떄문에 항상 false 반환

DECLARE
BEGIN
    UPDATE DEPT SET DNAME = 'DB'
    WHERE DEPTNO = 50;
    -- 업데이트 할 행이 DEPT 테이블에 없음!
    -- 추출된 행의 수 0, 행 추출 X
    
    DBMS_OUTPUT.PUT_LINE('행의 수 : ' || SQL%ROWCOUNT);
    -- 암시적 커서는 커서 이름이 없으니까 속성 앞에 SQL 작성하면 됨!
    
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('행 추출 완료!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('행 추출 X!');
    END IF;
    
    IF (SQL%ISOPEN) THEN -- 암시적 커서는 알아서 닫힘 (항상 false)
        DBMS_OUTPUT.PUT_LINE('커서 열려 있음!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서 닫혀 있음!');
    END IF;
END;
/

SELECT * FROM DEPT;
SELECT * FROM GOOTT_STUDENT;
-- INSERT (1, '길동', 5);

DECLARE
BEGIN
    INSERT INTO GOOTT_STUDENT
    VALUES (1, '길동', 5);
    
    DBMS_OUTPUT.PUT_LINE('행의 수 : ' || SQL%ROWCOUNT);
    -- 암시적 커서는 커서 이름이 없으니까 속성 앞에 SQL 작성하면 됨!
    
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('행 추출 완료!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('행 추출 X!');
    END IF;
    
    IF (SQL%ISOPEN) THEN -- 암시적 커서는 알아서 닫힘 (항상 false)
        DBMS_OUTPUT.PUT_LINE('커서 열려 있음!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서 닫혀 있음!');
    END IF;
END;
/


-- 예외 (exception) 처리
-- : 프로그램이 비정상적으로 종료되지 않게 하기 위함
/*
오류
1) 컴파일 오류 (compile error): 문법을 잘못 작성 (문법 오류, syntax error)
2) 실행 오류 (런타임 오류, runtime error) => "예외" => 예외 처리 (exception handling)
ORA-...... : 오라클에서 정의한 예외 (내부 예외)

VALUE_ERROR (ORA-06502): 산술, 제약 조건 오류
ZERO_DIVIDE (ORA-01476): 숫자를 0으로 나누려고 할 경우
TOO_MANY_ROWS (ORA-01422): SELECT INTO 결과 행이 여러 개일 경우
INVALID_CURSOR (ORA-01001): OPEN 되지 않은 커서를 CLOSE 할 경우
LOGIN_DENIED (ORA-01017): 사용자 이름/패스워드 잘못 썼을 경우
NOT_LOGGED_ON (ORA-01012): 현재 DB에 접속되어 있지 않을 경우
SELF_IS_NULL (ORA-30625): 객체이름.메소드/변수이름의 객체가 NULL인 경우
STORAGE_ERROR (ORA-06500): 메모리 부족
DUP_VAL_ON_INDEX (ORA-00001); 인덱스 중복

형식)
EXCEPTION
 WHEN 예외 이름1 THEN
    실행 문장;
 WHEN 예외 이름2 THEN
    실행 문장;
 ....
 WHEN OTHERS THEN
    실행 문장;

*/

-- 데이터 타입 불일치
DECLARE
    NUM_TEST NUMBER(5);    
BEGIN
    SELECT ENAME INTO NUM_TEST
    FROM EMP
    WHERE EMPNO = 7566;
END;
/

SELECT * FROM EMP;

-- 예외 처리
DECLARE
    NUM_TEST NUMBER(5);    
BEGIN
    SELECT ENAME INTO NUM_TEST -- 예외 발생! (문자형 -> 숫자형, 데이터타입 불일치)
    FROM EMP
    WHERE EMPNO = 7566;
    
    DBMS_OUTPUT.PUT_LINE('여기까지 실행될까요 ? '); -- 위 문장에서 예외 발생하면 이 문장은 실행되지 않음
EXCEPTION
--    WHEN VALUE_ERROR THEN
        -- 출력 메시지를 작성
        
    WHEN OTHERS THEN -- 모든 예외 처리 가능!
        DBMS_OUTPUT.PUT_LINE('[예외 발생] 값 에러!');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE)); -- 오류 번호 반환
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM); -- 오류 메시지 반환
        
END;
/

