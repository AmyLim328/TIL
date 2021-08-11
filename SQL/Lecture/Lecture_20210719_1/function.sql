-- [오라클 함수]
-- 함수 (function): x 값이 변하면 y의 결과도 달라지는 연산

-- 함수의 종류
-- 1) 내장 함수 (built-in function): 오라클에서 기본 제공 함수

-- a. 단일행 함수 (single-row function)
-- : 한 행씩 입력 => 한 행의 결과

-- b. 다중행 함수 (multiple-row function) (ex. 집계 함수, aggregate)
-- : 여러 행 입력 => 한 행의 결과
-- : ex. AVG(), SUM(), COUNT(), MAX(), MIN()

-- Q1. EMP 테이블에서 연봉 (SAL * 12 + COMM)의 평균
SELECT AVG(SAL*12+COMM) AS AVG_ANNSAL
FROM EMP;

-- Q2. EMP 테이블에서 사원 이름에 'E'가 들어가는 사원의 개수
-- * 다중 행 함수는 단일 행 함수 또는 속성값 (열)와 같이 올 수 없음
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%E%';

SELECT COUNT(ENAME) AS COUNT_E 
FROM EMP
WHERE ENAME LIKE '%E%';

-- Q3. EMP 테이블에서 부서 번호가 30인 사원들 중에서 사원 이름의 최댓값
-- VARCHAR 데이터형에서 최댓값 (사전순서의 최댓값)
SELECT MAX(ENAME) AS MAX_ENAME
FROM EMP
WHERE DEPTNO = 30;

-- Q4. EMP 테이블에서 직업이 'SALESMAN'인 사원들 중에서 입사일의 최솟값
SELECT HIREDATE
FROM EMP
WHERE JOB = 'SALESMAN';

-- DATE 데이터형에서 최솟값 (DATE형을 문자열로 생각했을 때 최솟값)
SELECT MIN(HIREDATE) AS MIN_HIREDATE
FROM EMP
WHERE JOB = 'SALESMAN';

-- 2) 사용자 정의 함수 (user-defined function)
-- : 사용자 필요에 의해 직접 정의한 함수


-- < 내장 함수 중에서 단일 행 함수 >

-- [문자형 함수]
-- 1) 대소문자 변환 함수
-- UPPER(문자열): 모두 대문자로 변환해서 반환
-- LOWER(문자열): 모두 소문자로 변환해서 반환
-- INITCAP(문자열): 첫 글자는 대문자, 나머지를 소문자로 변환해서 반환, "initial capital"

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- * 언제 사용할까요 ?
-- 데이터의 형태 (소문자, 대문자)를 일괄로 변경해서 검색/비교
-- ex) scott, SCOTT, Scott

-- Q1. 사원 이름에 'A', 'a'라는 문자가 들어간 사원 정보 출력 (대소문자 변환 함수 사용)
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE '%A%';

SELECT *
FROM EMP
WHERE LOWER(ENAME) LIKE '%a%';

-- 대소문자 변환 함수를 사용하지 않고 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%A%'
OR ENAME LIKE '%a%';

-- vs 
SELECT UPPER(ENAME) 
FROM EMP 
WHERE ENAME LIKE '%A%';

-- 2) 문자열 길이 함수 (LENGTH)
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 사원의 직업 문자열의 길이가 6글자 이상인 행만 사원 정보 전체 출력
SELECT *
FROM EMP
WHERE LENGTH(JOB) >= 6;

-- 3) 문자열 일부 추출 함수 (SUBSTR)
-- 언제 사용 ? 2001"100""003", "881111"-1234567
-- 2021/07/20
-- 2001100003

-- SUBSTR(문자열 데이터, 시작 위치): 시작 위치 ~ 문자열 데이터 끝까지 추출
-- SUBSTR(문자열 데이터, 시작 위치, 추출 길이): 시작 위치부터 추출 길이만큼 추출

SELECT ENAME, SUBSTR(ENAME, 3)
FROM EMP;

SELECT ENAME, SUBSTR(ENAME, 3, 2)
FROM EMP;

-- * 시작 인덱스가 0이 아니라 1부터 시작함
-- * EX) SMITH => 3번째 글자 'I' 

-- Q1. MGR에서 앞에 두 글자 (79, 76, 78 ..)만 원본과 함께 추출
SELECT MGR, SUBSTR(MGR, 1, 2)
FROM EMP;

SELECT MGR, SUBSTR(MGR, -LENGTH(MGR), 2)
FROM EMP;


-- Q2. MGR에서 앞에 두 글자 (79, 76, 78 ..)만 원본과 함께 추출 (MGR NULL값 제외)
SELECT MGR, SUBSTR(MGR, 1, 2)
FROM EMP
WHERE MGR IS NOT NULL;

SELECT MGR, SUBSTR(MGR, -LENGTH(MGR), 2)
FROM EMP
WHERE MGR IS NOT NULL;


-- Q3. MGR에서 뒤에 두 글자 (98, 98, 39 ..)만 원본과 함께 추출
-- 문자열의 길이를 알거나 문자열이 짧을 경우
SELECT MGR, SUBSTR(MGR, 3, 2) -- "7998"
FROM EMP;

SELECT MGR, SUBSTR(MGR, 3) -- "7998"
FROM EMP;

SELECT MGR, SUBSTR(MGR, LENGTH(MGR)-1, 2) -- "7998"
FROM EMP;

SELECT MGR, SUBSTR(MGR, LENGTH(MGR)-1) -- "7998"
FROM EMP;


-- 문자열의 길이가 길 경우
SELECT MGR, SUBSTR(MGR, -2) -- "ASDASABASDASCASDAS"
FROM EMP;

SELECT MGR, SUBSTR(MGR, LENGTH(MGR)-1, 2)
FROM EMP;

-- Q4. MGR에서 뒤에 두 글자 (98, 98, 39 ..)만 원본과 함께 추출 (MGR NULL값 제외)
SELECT MGR, SUBSTR(MGR, 3, 2)
FROM EMP
WHERE MGR IS NOT NULL;

SELECT MGR, SUBSTR(MGR, -2)
FROM EMP
WHERE MGR IS NOT NULL;


-- Q5. ENAME에서 중간 글자 추출 
-- (홀수 길이의 문자열 중간 글자 1개)
-- (짝수 길이의 문자열 중간 글자 2개 중 뒤에 것 추출)
-- "SMITH" => 'I'
-- "KING" => 'N'
-- "FORD" => 'R'

-- (홀수 길이의 문자열 중간 글자 1개)
-- (짝수 길이의 문자열 중간 글자 2개)
-- "SMITH" => 'I'
-- "KING" => 'IN'
-- "FORD" => 'OR'
-- * 참고: MOD(숫자, 나눌 숫자) => MOD(숫자, 2) == 0 (짝수 판단)
--                         MOD(숫자, 2) == 1 (홀수 판단)
-- MOD => modulus (나머지)

SELECT * FROM EMP;

SELECT ENAME, SUBSTR(ENAME, LENGTH(ENAME) / 2 + 1, 1)
FROM EMP;

-- 문자열의 길이가 홀수인 가운데 1글자 추출
SELECT ENAME, SUBSTR(ENAME, LENGTH(ENAME) / 2 + 1, 1)
FROM EMP
--WHERE MOD(LENGTH(ENAME), 2) = 1
WHERE MOD(LENGTH(ENAME), 2) <> 0

UNION -- 중복 허용 X (중복되는 값들은 출력 X)
-- 문자열의 길이가 짝수인 가운데 2글자 추출
SELECT ENAME, SUBSTR(ENAME, LENGTH(ENAME) / 2, 2)
FROM EMP
WHERE MOD(LENGTH(ENAME), 2) = 0;

-- UNION 중복 허용하고 싶으면 ... ?
-- UNION ALL

-- SELECT (ALL) 중복 허용 O
-- SELECT DISTINCT 중복 허용 X

--"7908"
--
--1
--SELECT MGR, SUBSTR(MGR, -LENGTH(MGR), 2) 
--FROM EMP 
--WHERE MGR IS NOT NULL;
--
--"79"
--
--2
--SELECT MGR, SUBSTR(MGR, -1, 2) 
--FROM EMP 
--WHERE MGR IS NOT NULL;
--
--"8"
--
--
--3
--SELECT MGR, SUBSTR(MGR, LENGTH(MGR)-1, 2) 
--FROM EMP 
--WHERE MGR IS NOT NULL;
--
--"08"
--
--
--4. 
--SUBSTR(MGR, -1, -2) => 지원 X


-- 4) 문자열 데이터 안에서 특정 위치를 찾는 INSTR 함수
-- : 특정 문자(열)이 어디에 포함되어있는 지 알고자 할 때

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1
-- 'HE(L)LO, ORACLE!'
FROM DUAL; 
-- 연산이나 함수의 결과를 잠시 보여주는 데 사용 테이블
-- DUMMY TABLE

SELECT INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_1
-- 다섯번째 글자 (O)부터 L 찾음
-- 'HELLO, ORAC(L)E!'
FROM DUAL; 

SELECT INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_1
-- 두 번째 글자 (E)부터 두 번째에 나온 L 찾음
-- 'HEL(L)O, ORACLE!'
FROM DUAL; 

SELECT INSTR('HELLO, ORACLE!', 'L', 2, 3) AS INSTR_1
FROM DUAL; 
-- 'HELLO, ORAC(L)E!'

SELECT INSTR('HELLO, ORACLE!', 'L', 2, 4) AS INSTR_1
FROM DUAL; 
-- 'HELLO, ORACLE!' ==> 0 반환

SELECT INSTR('HELLO, ORACLE!', 'L', -2, 2) AS INSTR_1
FROM DUAL; 
-- 'HEL(L)O, ORACLE!' 

SELECT INSTR('HELLO, ORACLE!', 'L', 
-LENGTH('HELLO, ORACLE!'), 2) AS INSTR_1
FROM DUAL; -- => 0 반환

-- * 만약 찾으려고 하는 문자가 없으면 0 반환
-- * 시작 위치를 음수를 쓰면 오른쪽부터 -> 왼쪽 방향 검색
-- (원래 기본값 왼쪽 -> 오른쪽 방향)

-- 응용 문제)
-- 사원의 이름에 S가 있는 (조건식) 
-- 사원 정보 전체 (SELECT 뒤에 출력할 열 지정, *) 출력

-- LIKE '%S%'
-- INSTR() => ?

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;
-- 1 ~ LENGTH(ENAME) 값 반환 => 'S' 있음
-- 0 반환 => 'S' 없음


-- 형식
-- INSTR([문자열/열 이름 (필수)], [부분 문자 (필수)]
-- [시작 위치 (선택)], 
-- [찾으려고 하는 문자가 몇 번째인지 지정 (선택)])

-- 5) 특정 문자를 다른 문자로 바꾸는 REPLACE 함수

-- 형식)
-- REPLACE([문자열/열 이름 (필수)], 
-- [찾는 문자 (필수)], [대체할 문자 (선택)])
-- * 대체할 문자가 없으면 문자열 데이터에서 삭제

SELECT '801111-1234567' AS REGNUM,
REPLACE('801111-1234567', '-', ' ') AS REGNUM_REPLACE_1,
REPLACE('801111-1234567', '-') AS REGNUM_REPLACE_2 -- 공간 삭제
FROM DUAL;

-- * 언제 쓸까요 ?
-- 특정 문자가 포함된 데이터에서 특정 문자를 삭제하거나 대체할 때
-- EX) 계좌번호, 핸드폰 번호, 주민번호


-- 6) 데이터의 빈 공간을 특정 문자로 채우는 (Padding) 함수 (LPAD, RPAD)
-- LPAD: Left Padding (왼쪽 패딩)
-- RPAD: Right Padding (오른쪽 패딩)

-- 형식)
-- LPAD([문자열/열이름 (필수)], [데이터 자릿수 (필수)], 
-- [패딩할 문자 (선택)])
-- RPAD([문자열/열이름 (필수)], [데이터 자릿수 (필수)], 
-- [패딩할 문자 (선택)])

-- * 패딩할 문자가 없으면 빈 공간의 자릿수만큼 공백 문자로 채움

SELECT 'SQL',
LPAD('SQL', 10, '*') AS LPAD_1,
LPAD('SQL', 10) AS LPAD_2,
RPAD('SQL', 10, '*') AS RPAD_1,
RPAD('SQL', 10) AS RPAD_2,
LENGTH(RPAD('SQL', 10)) AS RPAD_2_LENGTH
FROM DUAL;


-- Q1. 주민등록번호 앞자리만 추출 (SUBSTR)해서 뒷자리 * 출력 (RPAD)
SELECT '901111-1234567' AS REG,
RPAD(SUBSTR('901111-1234567', 1, 7), 
LENGTH('901111-1234567'), '*') AS REG_RPAD
FROM DUAL;

-- Q2. 핸드폰 번호 010-1234-만 추출 (SUBSTR)해서 뒷자리 * 출력 (RPAD)
SELECT '010-1234-5678' AS PHONE_NUM,
RPAD(SUBSTR('010-1234-5678', 1, 9),
LENGTH('010-1234-5678'), '*') AS PHONE_NUM_RPAD
FROM DUAL;

-- * 만약에 넣으려고 하는 문자열보다 자리가 작을 경우에는
-- 문자열이 손실 (잘림)
SELECT 'HELLO!',
LPAD('HELLO!', 4, '#') AS LPAD_1
FROM DUAL;

SELECT 'HELLO!',
RPAD('HELLO!', 4, '#') AS RPAD_1
FROM DUAL;


-- 7) 두 문자열을 합치는 CONCAT 함수 (CONCATENATE)
-- : 두 문자열을 하나의 데이터로 연결

SELECT * FROM EMP;
-- EMPNO : ENAME

SELECT CONCAT(EMPNO, ENAME)
FROM EMP;

-- 1)
SELECT CONCAT(EMPNO, CONCAT(' : ', ENAME))
FROM EMP;

-- 2)
SELECT CONCAT(CONCAT(EMPNO, ' : '), ENAME)
FROM EMP;

-- 3)
SELECT EMPNO || ' : ' || ENAME -- 가독성이 좋음
FROM EMP;

-- 문자열 연결하는 || 연산자
SELECT EMPNO || ENAME
FROM EMP;

SELECT EMPNO || ' ' || ENAME
FROM EMP;


-- 8) 특정 문자를 지우는 TRIM, LTRIM, RTRIM
-- : TRIM (다듬다)
-- : 문자열 내에 특정 문자를 지우기 위해 사용

-- 형식)
-- * 보통 삭제할 문자를 지정하지 않고 공백을 지우는데 많이 사용
-- TRIM([삭제 옵션 (선택)][삭제할 문자 (선택)] 
-- FROM [원본 문자열 (필수)])
-- 삭제 옵션 (거의 안씀)
-- 1) LEADING: 왼쪽에 있는 글자 지움
-- 2) TRAILING: 오른쪽에 있는 글자 지움
-- 3) BOTH: 양쪽 글자 지움

-- 삭제할 문자가 지정되지 않으면 공백을 제거
-- * 보통은 삭제할 문자를 지정하지 않고 공백 제거시 사용

-- 제일 많이 사용
SELECT TRIM('   안녕하세요.   ') AS TRIM_1
FROM DUAL;

SELECT TRIM('_' FROM '__ _안녕하세요._ ___') AS TRIM_1
FROM DUAL;

SELECT TRIM(LEADING '_' FROM '__안_녕하세요.___') AS TRIM_1
FROM DUAL;

SELECT TRIM(TRAILING '_' FROM '__안_녕하세요.___') AS TRIM_1
FROM DUAL;

SELECT TRIM(BOTH '_' FROM '__안_녕하세요.___') AS TRIM_1
FROM DUAL;

-- LTRIM, RTRIM 함수
-- TRIM 함수와 다른 점은 삭제할 문자를 여러개 지정 가능
-- LTRIM : LEFT TRIM (왼쪽 지정 문자를 삭제)
-- RTRIM : RIGHT TRIM (오른쪽 지정 문자를 삭제)

-- 형식)
-- LTRIM([원본 문자열/데이터 (필수)], 
-- [삭제 문자 (여러개 지정 가능) (선택)])
-- RTRIM([원본 문자열/데이터 (필수)], 
-- [삭제 문자 (여러개 지정 가능) (선택)])

SELECT TRIM(' _ORACLE_ ') AS TRIM_1,
LENGTH(TRIM(' _ORACLE_ ')) AS TRIM_1_LENGTH
FROM DUAL;

-- TRIM()은 여러 개의 문자 지정이 불가능 (한 개만 지정 가능)
SELECT TRIM(' _' FROM ' _ORACLE_ ') AS TRIM_1
FROM DUAL;


-- ' '와 '_' 사용해서 조합할 수 있는 문자를 모두 제거 (몇 개 사용하든 상관 x)
-- ' _'
-- '_ '
-- ' '
-- '_'
-- '__' (언더바 2개)
-- '  ' (스페이스 2개)

-- 지정한 문자들로 조합할 수 있는 문자 제거
-- 조합할 수 없는 ('O') 시작되면 삭제 작업 끝남 (문자열 시작)
SELECT LTRIM(' _ORACLE_ ', ' _') AS TRIM_1
FROM DUAL;

SELECT RTRIM(' _____ORACLE____ _S', ' _') AS TRIM_1
FROM DUAL;



-- <title>A Meaningful Page</title>

SELECT RTRIM(LTRIM('<title>A Meaningful Page</title>', 
'<title>'), '</title>') as TAG_REMOVE
FROM DUAL;

SELECT RTRIM(RTRIM(LTRIM('<title>A Meaningful Page</title>', 
'<title>'), '<title>'), '</') as TAG_REMOVE
FROM DUAL;


-- 함수 표준 문서: https://docs.oracle.com/cd/E11882_01/server.112/e41085/toc.htm


-- [숫자형 함수]
-- : 숫자 데이터 (NUMBER)을 연산하는 함수
-- ROUND: 반올림 함수 ex) 12.5 => 13
-- TRUNC (truncate, 길이를 줄이다): 버림 함수 ex) 12.5 => 12
-- CEIL: 올림 함수
-- FLOOR: 내림 함수
-- MOD: 나머지 함수

-- 1) ROUND()
-- : 특정 위치에서 숫자를 반올림하는 함수
-- : 반올림할 위치를 지정하지 않으면 소수점 첫번째 자리에서 반올림

-- 형식)
-- ROUND([숫자 (필수)], [반올림할 위치 (선택)])

-- 1235
SELECT ROUND(1234.5678, 0) AS ROUND -- => 1234."5"678 => 1235
FROM DUAL;

-- 1234.6
SELECT ROUND(1234.5678, 1) AS ROUND -- => 1234.5"6"78 => 1234.6 
FROM DUAL;

-- 1234.57
SELECT ROUND(1234.5678, 2) AS ROUND --
FROM DUAL;

-- 1234.568
SELECT ROUND(1234.5678, 3) AS ROUND -- 
FROM DUAL;

-- 1230
SELECT ROUND(1234.5678, -1) AS ROUND -- 
FROM DUAL;

-- 1200
SELECT ROUND(1234.5678, -2) AS ROUND -- 
FROM DUAL;

-- * 반올림 할 위치에 음수값 지정할 수 있음 
-- * 반올림 위치 값이 음수면 자연수 쪽으로 반올림

-- 2) TRUNC() (truncate, 줄이다)
-- : 지정된 자리에서 숫자 버림
-- : 버림할 자릿수를 지정 할 수 있음
-- : 버림할 자릿수가 지정되지 않으면 소수점 첫번째 자리에서 버림

-- 형식)
-- TRUNC([숫자 (필수)], [버림할 위치 (선택)])



-- 1234.56
SELECT TRUNC(1234.5678, 2) AS TRUNC -- 소수점 자리 2개를 표현 (소수점 세번째 자리부터 버림)
FROM DUAL;

-- 1234.5
SELECT TRUNC(1234.5678, 1) AS TRUNC -- 소수점 자리 1개를 표현 (소수점 두번째 자리부터 버림)
FROM DUAL;


-- 1234
SELECT TRUNC(1234.5678, 0) AS TRUNC -- 소수점 자리 0개를 표현 (소수점 첫번째 자리부터 버림)
FROM DUAL;

-- 1230
SELECT TRUNC(1234.5678, -1) AS TRUNC -- 자연수 첫번째 자리까지 버림
FROM DUAL;

-- 1200
SELECT TRUNC(1234.5678, -2) AS TRUNC -- 자연수 두번째 자리까지 버림
FROM DUAL;


-- 3) CEIL() (천장), FLOOR() (바닥)
-- : 지정한 숫자와 가까운 (정수)를 찾는 함수
-- CEIL([숫자 (필수)]): 입력한 숫자와 가까운 큰 정수
-- FLOOR([숫자 (필수)]): 입력한 숫자와 가까운 작은 정수

SELECT CEIL(12.4), FLOOR(12.4)
FROM DUAL;

SELECT CEIL(-12.4), FLOOR(-12.4)
FROM DUAL;

-- 4) MOD() (나머지 함수, modulus)
-- MOD([나눗셈이 될 숫자 (필수)], [나눌 숫자 (필수)])

SELECT MOD(15, 4)
FROM DUAL;

-- * 해당 수가 짝수인지 홀수인지 구별할 때 사용

SELECT * FROM EMP;

-- 1) EMP 테이블에서 사원번호가 짝수인 사원 정보 출력
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 0;

-- 2) EMP 테이블에서 사원번호가 홀수인 사원 정보 출력
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) <> 0; -- ISO 표준 방식 (질의속도 향상)
-- != , ^=




-- [날짜형 함수]
-- : 날짜 데이터 (DATE) 다루는 함수

-- 날짜 데이터 + 숫자 => 날짜 데이터보다 숫자만큼 이후 날짜 반환
-- 날짜 데이터 - 숫자 => 날짜 데이터보다 숫자만큼 이전 날짜 반환
-- 날짜 데이터 + 날짜 데이터 => 지원 X
-- 날짜 데이터 - 날짜 데이터 => 두 데이터간의 일수 차이

-- 1) SYSDATE 상수
-- : Oracle DB가 설치된 OS (운영체제)의 현재 날짜와 시간을 반환

SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE+2
FROM DUAL;

SELECT SYSDATE-2
FROM DUAL;

-- 2) ADD_MONTHS()
-- : 특정 날짜에 지정한 개월 수 이후 날짜 데이터 반환
-- 형식) ADD_MONTHS([날짜 데이터 (필수)], [더할 개월 수 (정수) (필수)])

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- 음수도 가능
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -3)
FROM DUAL;

-- Q1. EMP 테이블의 사원들의 근무 일수 계산
SELECT ENAME, SYSDATE, HIREDATE, TRUNC(SYSDATE - HIREDATE) AS WORKDAYS
FROM EMP;



-- Q2. EMP 테이블의 사원들 중에서 입사한지 40년이 넘는 (초과) 사람들을 추출해서 모든 정보 출력
SELECT ENAME, HIREDATE,  ADD_MONTHS(HIREDATE, 40 * 12),
(SYSDATE - HIREDATE) / 365
FROM EMP;

SELECT *
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 40 * 12) < SYSDATE;

SELECT * 
FROM EMP 
WHERE (SYSDATE - HIREDATE) / 365 > 40;

SELECT ENAME, ROUND(SYSDATE - HIREDATE) AS WORK_DATE 
FROM EMP 
WHERE ROUND(SYSDATE - HIREDATE) > 365 * 40;


-- Q3. EMP 테이블의 사원들의 10주년이 되는 날짜 사원 이름과 같이 출력
SELECT ENAME, ADD_MONTHS(HIREDATE, 10 * 12) AS WORK_10_YEAR
FROM EMP;



-- 3) 개월 수 차이를 구하는 MONTHS_BETWEEN()
-- : 두 날짜 사이의 개월 수 차이를 구함
-- 형식) MONTHS_BETWEEN([날짜 데이터1 (필수)], [날짜 데이터2 (필수)])
-- * 날짜 데이터1 - 날짜 데이터2 (순서 조심!)

-- EX) EMP 테이블에서 사원의 입사날과 현재 시스템의 날짜 개월 수 차이를 계산
SELECT ENAME, HIREDATE, SYSDATE, 
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1, -- HIRDATE - SYSDATE (음수 값) (* 순서)
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,  -- SYSDATE - HIREDATE (양수 값) (* 순서)
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH_TRUNC, -- 현재까지 일한 개월 수
ROUND(TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))/12, 1) AS YEAR_TRUNC -- 현재까지 일한 년 수
FROM EMP;

-- 4) NEXT_DAY(), LAST_DAY()
-- : NEXT_DAY([날짜 데이터 (필수)], [요일 문자 (필수)])
-- : 특정 날짜 기준으로 돌아오는 요일 날짜 출력
-- : LAST_DAY([날짜 데이터 (필수)])
-- : 특정 날짜가 속한 달의 마지막 날짜 출력

SELECT SYSDATE,
NEXT_DAY(SYSDATE, 2),
LAST_DAY(SYSDATE)
FROM DUAL;

-- 요일문자
-- 1 : '일', '일요일', 'SUN', 'SUNDAY'
-- 2 : '월', '월요일', 'MON', 'MONDAY'
-- 3 : '화', '화요일', 'TUE', 'TUESDAY'
-- ....

-- 5) ROUND(), TRUNC()
-- : 숫자에서도 지원하는 함수 -> 날짜에서 지원함
-- : 소수점 자리 표현하지 않고 반올림/버림의 기준이 될 포맷 지정

-- 형식)
-- ROUND([날짜 데이터 (필수)], [반올림 기준 포맷 (필수)])
-- TRUNC([날짜 데이터 (필수)], [버림 기준 포맷 (필수)])

-- 포맷 값
-- CC (century), SCC: 네 자리 연도 끝 두자리 기준
-- EX) 2020 -> 50 이상이 아니기 떄문에 반올림 X -> 2001년 
-- EX) 2050 -> 50 이상이기 때문에 반올림 O -> 2100년

-- YYYY, YYY, YY, Y
-- : 날짜 데이터의 연, 월, 일의 7월 1일 기준

-- Q (quarter)
-- : 각 분기의 두 번째 달의 16일 기준
-- (1/1 ~ 3/31, 2월 16일), (4/1 ~ 6/30, 5월 16일), (7/1 ~ 9/30, 8월 16일), (10/1 ~ 12/31, 11월 16일)

-- DD, DDD
-- : 해당 일의 정오 (12:00:00) 기준

-- HH (hour), HH12, HH24
-- : 해당 일의 시간을 기준

SELECT ROUND(SYSDATE, 'CC') AS FORMAT_CC, -- 2001년 표기
ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY, -- 7월 1일 넘었기 때문에 2022년 반올림
ROUND(SYSDATE, 'Q') AS FORMAT_Q, -- 8월 16일 이전이니까 7월 1일 반올림
ROUND(SYSDATE, 'DDD') AS FORMAT_DDD, -- 시간이 정오 (12시)가 넘었으니까 7월 21일로 반올림
ROUND(SYSDATE, 'HH') AS FORMAT_HH -- 현재 3:44분이니까 4시로 반올림
FROM DUAL;

SELECT TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
TRUNC(SYSDATE, 'HH') AS FORMAT_HH
FROM DUAL;


-- [형 변환 함수]
-- : 자료형 (숫자형, 문자형, 날짜형)
-- 1) 암시적 형 변환

-- 숫자형 (EMPNO) + 문자열 ('500') (**)
-- '500'이 숫자로 변환이 가능 => 숫자 형 변환 자동 (암시적 형 변환)
SELECT EMPNO, EMPNO + '500'
FROM EMP;

-- 숫자형 (EMPNO) + 문자열 ('ZZZ') (**)
-- 'ZZZ'는 숫자로 변환 불가능 => 숫자로 인식할 수 없음 (형 변환 X)
SELECT EMPNO, EMPNO + 'ZZZ'
FROM EMP;


-- 2) 명시적 형 변환
-- TO_CHAR: 숫자/날짜형 -> 문자형
-- 형식) TO_CHAR([날짜 데이터 (필수)], '[출력하고자 하는 문자열 (필수)]')

-- 날짜형 -> 문자형
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') -- MINUTE
AS NOW
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH12:MI:SS PM') -- MINUTE
AS NOW
FROM DUAL;

-- 형식 지정자
-- CC: 세기
-- YYYY, RRRR (ROUNDING, 반올림, 순회하다): 연 (4자리 숫자)
-- YY, RR: 연 (2자리 숫자)


-- TO_DATE() (이후 수업!)
-- EX) 2020년 => RR => 50 이상의 연도 인식 => 1950년
-- EX) 2050년 => RR => 50 이상의 연도 인식 => 2050년

-- MM: 월 (2자리 숫자)
-- MON: 월 (월 이름 약자)
-- MONTH: 월 (월 이름 전체)
-- DD: 일 (2자리 숫자)
-- DDD: 1년 중 며칠 (1 ~ 366)
-- DY: 요일 (요일 이름 약자)
-- DAY: 요일 (요일 이름 전체)
-- W: 1년 중 몇 번째 주

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON,
TO_CHAR(SYSDATE, 'MONTH') AS MONTH
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY,
TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

-- 특정 언어 맞춰서 출력
-- 'NLS_DATE_LANGUAGE = ... '

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON,
TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY,
TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY
FROM DUAL;


-- 시간 형식
-- HH24: 24시간으로 표현한 시간
-- HH, HH12: 12시간 표현한 시간
-- MI: 분
-- SS: 초
-- AM, PM, A.M., P.M.: 오전 오후 표시

-- 날짜형 -> 문자형
SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH:MI:SS P.M.')
FROM DUAL;

-- TO_NUMBER: 문자형 -> 숫자형
-- 1) 암시적 형 변환

SELECT 5000 - '$3,000' -- 암시적 형 변환이 안됨 (숫자로면 표기된 게 아님)
FROM DUAL;

SELECT 5000 - '3000'   
FROM DUAL;

SELECT 5000 - '3.000' -- '3.000' => 3.000 
FROM DUAL;


-- 2) 명시적 형 변환 (TO_NUMBER())
-- 형식) TO_NUMBER([문자열 데이터 (필수)], [인식되어야할 숫자 형태 (필수)])

SELECT 5000 - TO_NUMBER('$3,000', '$9,999') -- 명시적 형 변환 한 후에 계산 (각 자리에 들어갈 수 있는 숫자 최댓값)
-- 5000 - '3000' = 2000 (암시적 형 변환)
-- 5000 - '3,000' = 2000 (암시적 형 변환 X)
-- 5000 - TO_NUMBER('$3,000', '$9,999') = 2000 (암시적 형 변환 X, 명시적 형 변환 O)
-- 5000 - TO_NUMBER('$9,000', '$9,999') = 2000 (암시적 형 변환 X, 명시적 형 변환 O)
FROM DUAL;

SELECT 5000 - TO_NUMBER('$333,000', '$99,999') -- 명시적 형 변환 한 후에 계산 (각 자리에 들어갈 수 있는 숫자 최댓값)
FROM DUAL;
-- * 숫자 형태 작성시 조심해야할 점
-- 1) 자릿수 확인
-- 2) 각 자리수에 최대로 표현할 수 있는 수 안에 드는지 확인

-- Q1. 200000 - '123,500' 
SELECT 200000 - TO_NUMBER('123,500', '999,999') AS RES 
FROM DUAL;

-- Q2. 5000 - '$3,000'  
SELECT 5000 - TO_NUMBER('$3,000', '$9,999') AS RES
FROM DUAL;


-- TO_DATE: 문자형 -> 날짜형 
-- : scott.sql 파일에서 날짜를 문자 형태로 대입할 때 사용
-- : 문자열 데이터를 입력한 후에 그 데이터를 날짜 형태로 변환할 때

-- 형식) TO_DATE([문자열 데이터 (필수)], [인식되어야할 날짜 형태 (필수)])


SELECT TO_DATE('2018-07-20', 'YYYY-MM-DD') AS TODATE
FROM DUAL;

SELECT TO_DATE('2021/07/22', 'YYYY/MM/DD') AS TODATE
FROM DUAL;

-- Q1. EMP 테이블에서 입사날이 1981년 7월 20일 이후인 사원 정보 모든 열 출력
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/07/20', 'YYYY/MM/DD'); -- DATE와 DATE 사이도 크기 비교

SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981-07-20', 'YYYY-MM-DD');

-- 날짜 데이터 형식 지정할 때
-- YYYY, RRRR: 네 자리 연도
-- YY, RR: 두 자리 연도

SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49,
TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49,
TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50,
TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50,
TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51,
TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
FROM DUAL;

-- 1950년도 기준으로 YY, RR 다르게 인식
-- YY: 현 시점의 연도와 동일한 연도 계산 (EX. 2021)
-- RR: 현 시점의 연도 끝 두자리 수 (20(21))가  0 ~ 49 => 1900 년대
                           --  50 ~ 99 => 2000 년대


-- [NULL 처리 함수]
-- : 데이터 NULL 값 (아직 확정되지 않은 값, 데이터 입력 안된 값) => 산술/비교 연산자 => 결과 NULL
-- : 데이터가 NULL일 경우, 연산 수행을 위해 NULL 아닌 다른 값으로 대체

-- 1) NVL (NULL VALUE)
-- 형식)
-- NVL ([NULL인지 여부를 검사할 데이터/열 (필수)], [앞의 데이터가 NULL일 경우 대체할 데이터 (필수)])
-- : NULL이 아니면 그대로 반환
-- : NULL이면 두 번째 인자로 지정한 데이터 반환
-- : 대체할 데이터가 검사할 데이터와 같은 데이터 타입 

SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNSAL, SAL*12 + NVL(COMM, 0) AS ANNSAL_NVL
FROM EMP;


-- 2) NVL2 (NULL VALUE)
-- 형식)
-- NVL2 ([NULL인지 여부를 검사할 데이터/열 (필수)], 
-- [앞의 데이터가 NULL이 아닐 경우 대체할 데이터 또는 계산식 (필수)],
-- [앞의 데이터가 NULL일 경우 대체할 데이터 또는 계산식 (필수)])

SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNSAL, NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL_NVL2
FROM EMP;


SELECT ENAME, SAL, COMM, SAL*12+COMM AS ANNSAL, NVL2(COMM, 'O', 'X') AS ISCOMM
FROM EMP;

-- NVL VS NVL2
-- NVL2 : NULL이 아닌 경우에 반환 데이터까지 지정할 수 있음
-- NVL을 더 많이 사용


-- [DECODE 함수, CASE 문]
-- : if, switch문과 비슷
-- : NVL, NVL2는 값이 NULL인 경우에만 처리
-- : NULL 값이 아닌 경우에도 특정 열 / 데이터 값에 따라 반환할 데이터 결정


-- 1) DECODE 함수

-- EX) EMP 테이블에서 직책에 따라 급여의 인상률을 달리할 수 있음
-- a. MANAGER: 10% => 0.1
-- b. SALESMAN: 5% ==> 0.05
-- c. 이 외 직책: 3% ==> 0.03
-- => 인상률을 포함한 급여를 출력

-- * 조건의 연산 (=)만 가능
-- JOB = 'MANAGER'
-- JOB = 'SALESMAN'
-- 

SELECT EMPNO, ENAME, JOB, SAL, 
   DECODE(JOB, 
      'MANAGER', SAL + SAL * 0.1, -- SAL * 1.1
      'SALESMAN', SAL + SAL * 0.05,
      SAL + SAL * 0.03
   ) AS UPSAL
FROM EMP;


SELECT EMPNO, ENAME, JOB, SAL, 
   DECODE(JOB, 
      'MANAGER', SAL + SAL * 0.1, -- SAL * 1.1
      'SALESMAN', SAL + SAL * 0.05,
--      SAL + SAL * 0.03
   ) AS UPSAL
FROM EMP;
-- 조건에 없는 값이 없을 때 (else문) 반환값을 지정하지 않으면 NULL 반환 

-- 형식)
-- DECODE([검사할 열 / 데이터], 
--      [조건 1], [조건 1의 결과],
--      [조건 2], [조건 2의 결과],
--      ...
--      [조건 N], [조건 N의 결과],
--      [위 조건에 해당하는 경우가 없을 때 반환 결과]
--)

-- 2) CASE 문 (함수 아님, CASE ()가 없음)
-- : DECODE 함수에서는 조건식에 들어갈 연산자 (=)만 가능
-- : CASE 문에서는 다양한 조건식이 올 수 있음
-- : DECODE 함수에 비해 활용도 좋음

-- 형식)
-- CASE [검사할 열 / 데이터 (선택)]
-- WHEN [조건 1] THEN [조건 1의 결과]
-- WHEN [조건 2] THEN [조건 2의 결과]
-- ...
-- WHEN [조건 N] THEN [조건 N의 결과]
-- ELSE [위 조건에 해당하는 경우가 없을 때 반환 결과]
-- END
-- * CASE문은 검사할 열을 지정이 되어있으면
-- => 검사할 열 = 조건 1
-- => 검사할 열 = 조건 2

-- CASE []
-- WHEN [조건 1] THEN [조건 1의 결과]
-- WHEN [조건 2] THEN [조건 2의 결과]
-- ...
-- WHEN [조건 N] THEN [조건 N의 결과]
-- ELSE [위 조건에 해당하는 경우가 없을 때 반환 결과]
-- END

-- * CASE문은 검사할 열을 지정하지 않을 수도 있음
-- => 조건에 검사할 열이 포함

-- EX) EMP 테이블에서 직책에 따라 급여의 인상률을 달리할 수 있음
-- a. MANAGER: 10% => 0.1
-- b. SALESMAN: 5% ==> 0.05
-- c. 이 외 직책: 3% ==> 0.03
-- => 인상률을 포함한 급여를 출력

SELECT EMPNO, ENAME, JOB, SAL,
   CASE JOB -- 'JOB =' 생략 (조건 '='로 하고 싶으면 검사할 열 지정)
      WHEN 'MANAGER' THEN SAL + SAL * 0.1
      WHEN 'SALESMAN' THEN SAL + SAL * 0.05
      ELSE SAL + SAL * 0.03
   END AS UPSAL
FROM EMP;

-- Q1. EMP 테이블에서 SAL의 범위에 따라서 급여의 세금을 결정한다고 가정
-- a. SAL <= 1000 => 8%
-- b. SAL <= 3000 => 10%
-- c. SAL <= 5000 => 13%
-- d. 이외의 SAL => 15%
-- => 세금 출력
SELECT EMPNO, ENAME, JOB, SAL,
   CASE -- 조건을'='이 아닌 다른 조건으로 하고 싶으면 검사할 열 지정 X
      WHEN SAL <= 1000 THEN SAL * 0.08 -- 조건식에서 검사할 열 포함
      WHEN SAL <= 3000 THEN SAL * 0.1
      WHEN SAL <= 5000 THEN SAL * 0.13
      ELSE SAL * 0.15
   END AS TAX
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
   CASE -- 조건을'='이 아닌 다른 조건으로 하고 싶으면 검사할 열 지정 X
      WHEN SAL <= 1000 THEN '1000 이하' -- 조건식에서 검사할 열 포함
      -- SAL > 1000
      WHEN SAL <= 3000 THEN '1000 초과 ~ 3000 이하'
      --- SAL > 3000
      WHEN SAL <= 5000 THEN '3000 초과 ~ 5000 이하'
      ELSE '5000 초과'
   END AS TAX
FROM EMP;

-- Q2. EMP 테이블에서 ENAME에 'A'라는 문자가 들어가 있다면 '포함합니다', 
-- 'A'라는 문자가 들어가 있지 않다면 '포함하지 않습니다'을 사원 이름과 함께 출력
-- LIKE + wildcard, INSTR()

-- a. LIKE
SELECT ENAME, 
   CASE
      WHEN ENAME LIKE '%A%' THEN '포함합니다'
      ELSE '포함하지 않습니다'
   END AS ISAINCLUDED
FROM EMP;

-- 사원 이름 (대소문자 구별하지 않고) 에 들어간 문자 'A'('a')에 들어가있는지 확인
SELECT ENAME, 
   CASE
      WHEN ENAME LIKE '%A%' OR ENAME LIKE '%a%' THEN '포함합니다'
      ELSE '포함하지 않습니다'
   END AS ISAINCLUDED
FROM EMP;

SELECT ENAME, 
   CASE
      WHEN UPPER(ENAME) LIKE '%A%' THEN '포함합니다'
      ELSE '포함하지 않습니다'
   END AS ISAINCLUDED
FROM EMP;

-- b. INSTR()
-- : 찾으려고 하는 문자가 검색이 되면 찾으려고 하는 문자가 검색된 인덱스 반환
-- : 찾지 못하면 0이 반환
-- => INSTR() > 0 : 찾으려고 하는 문자를 찾았다 !!
SELECT ENAME, 
   CASE
      WHEN INSTR(ENAME, 'A') > 0 THEN '포함합니다'
      ELSE '포함하지 않습니다'
   END AS ISAINCLUDED
FROM EMP;

-- 사원 이름의 대소문자 구별없이 'A'('a') 모두 검색 가능하게 만드려면 ... ?
SELECT ENAME, 
   CASE
      WHEN INSTR(UPPER(ENAME), 'A') > 0 THEN '포함합니다'
      ELSE '포함하지 않습니다'
   END AS ISAINCLUDED
FROM EMP;

-- 언제 사용할 수 있을까요 ..?
-- EX) 사원 이름의 특정 성이 있는지 검색하고 싶을 경우
-- EX) {'ABC', 'abc', 'ccc', 'ddd',  'qwf'}: 중복된 이름 검색 'ABC', 'abc' 
-- 'Eunbin', 'eunbin', 'EUNBIN'




-- Q3. EMP 테이블에서 추가 수당 (COMM)에 따라 
-- 만약에 COMM이 NULL이면 '해당사항 없음'
-- 만약에 COMM = 0이면 '추가수당 없음'
-- 만약에 COMM이 0보다 크면 추가 수당을 출력
SELECT EMPNO, ENAME, COMM, 
   CASE
      WHEN COMM IS NULL THEN '해당사항 없음' -- VARCHAR
      WHEN COMM = 0 THEN '추가수당 없음' -- VARCHAR
      WHEN COMM > 0 THEN COMM -- NUMBER
      -- **DECODE(), CASE절의 반환값은 데이터형이 일치!**
      -- WHY ? 
      -- 동일한 열에 저장된 데이터의 형들은 동일
   END AS COMM_STR
FROM EMP;
-- => 에러 발생: ORA-00932: 일치하지 않은 데이터 타입!

SELECT EMPNO, ENAME, COMM, 
   CASE
      WHEN COMM IS NULL THEN '해당사항 없음' -- VARCHAR
      WHEN COMM = 0 THEN '추가수당 없음' -- VARCHAR
      WHEN COMM > 0 THEN '' || COMM -- NUMBER -> VARCHAR 암시적 형 변환
      -- **DECODE(), CASE절의 반환값은 데이터형이 일치!**
      -- WHY ? 
      -- 동일한 열에 저장된 데이터의 형들은 동일
   END AS COMM_STR
FROM EMP;

SELECT EMPNO, ENAME, COMM, 
   CASE
      WHEN COMM IS NULL THEN '해당사항 없음' -- VARCHAR
      WHEN COMM = 0 THEN '추가수당 없음' -- VARCHAR
      WHEN COMM > 0 THEN TO_CHAR(COMM) -- NUMBER -> VARCHAR 명시적 형 변환
      -- **DECODE(), CASE절의 반환값은 데이터형이 일치!**
      -- WHY ? 
      -- 동일한 열에 저장된 데이터의 형들은 동일
   END AS COMM_STR
FROM EMP;

-- Q4. EMP 테이블에서 입사일 (HIREDATE)에 따라 (ADD_MONTHS(), /, MONTHS_BETWEEN())
-- 만약에 해당 사원이 40년 이상 '40주년 이상'
-- 만약에 해당 사원이 40년 미만 '40주년 미만' 출력


SELECT EMPNO, ENAME, HIREDATE, 
   CASE
      WHEN TO_CHAR(ADD_MONTHS(HIREDATE, 40*12), 'YYYY/MM/DD') 
         <= TO_CHAR(SYSDATE, 'YYYY/MM/DD')
      THEN '40주년 이상'
      ELSE '40주년 미만'
   END AS ISYEAR40
FROM EMP;

-- 1년 365일, 366일 => 정확하진 않음
SELECT EMPNO, ENAME, HIREDATE, 
   CASE
      WHEN TRUNC((SYSDATE - HIREDATE)) / 365 >= 40 THEN '40주년 이상'
      ELSE '40주년 미만'
   END AS ISYEAR40
FROM EMP;

SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY/MM/DD') AS HIREDATE_WOCLOCK, 
   CASE
      WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) >= 40 * 12 THEN '40주년 이상'
      ELSE '40주년 미만'
   END AS ISYEAR40
FROM EMP;



-- Q5. EMP 테이블에서 사원 번호 (EMPNO)의 앞 두 자리를 추출하여 (SUBSTR())
-- 만약에 앞 두자리가 73이면 3333으로 출력
-- 만약에 앞 두자리가 74이면 4444으로 출력
-- 만약에 앞 두자리가 75이면 5555으로 출력
-- 이외의 앞 두자리의 경우 본인 사원번호 그대로 출력
SELECT EMPNO, 
   CASE
      WHEN SUBSTR(EMPNO, 1, 2) = '73' THEN '3333' 
      -- SUBSTR(숫자형) => 숫자형 -> 문자형 (암시적 형 변환)
      WHEN SUBSTR(EMPNO, 1, 2) = '74' THEN '4444'
      WHEN SUBSTR(EMPNO, 1, 2) = '75' THEN '5555'
      ELSE '' || EMPNO -- NUMBER -> CHAR (TO_CHAR(), ||, CONCAT())
   END AS EMPNO_REVISED
FROM EMP;

SELECT EMPNO, 
   CASE
      WHEN SUBSTR(EMPNO, 1, 2) = '73' THEN 3333
      WHEN SUBSTR(EMPNO, 1, 2) = '74' THEN 4444
      WHEN SUBSTR(EMPNO, 1, 2) = '75' THEN 5555
      ELSE EMPNO
   END AS EMPNO_REVISED
FROM EMP;

SELECT EMPNO, 
   CASE
      WHEN EMPNO LIKE '73%' THEN 3333
      WHEN EMPNO LIKE '74%' THEN 4444
      WHEN EMPNO LIKE '75%' THEN 5555
      ELSE EMPNO
   END AS EMPNO_REVISED
FROM EMP;

SELECT EMPNO, 
   CASE SUBSTR(EMPNO, 1, 2)
      WHEN '73' THEN 3333
      WHEN '74' THEN 4444
      WHEN '75' THEN 5555
      ELSE EMPNO
   END AS EMPNO_REVISED
FROM EMP;

SELECT EMPNO, 
   DECODE (SUBSTR(EMPNO, 1, 2),
      '73', '3333',
      '74', '4444',
      '75', '5555',
      EMPNO) -- '숫자' => '문자' (암시적 형 변환)
   AS EMPNO_REVISED
FROM EMP;


-- 한결씨 코드
SELECT EMPNO, -- 문자형
       CASE 
            WHEN SUBSTR(EMPNO,1,2) = '73' THEN '3333'
            WHEN SUBSTR(EMPNO,1,2) = '74' THEN '4444'
            WHEN SUBSTR(EMPNO,1,2) = '75' THEN '5555'
            WHEN EMPNO IS NULL THEN 'N/A'
            ELSE TO_CHAR(EMPNO)
        END AS EMPNO_REVISED
FROM EMP;

SELECT EMPNO, -- 숫자형
       CASE
           WHEN SUBSTR(EMPNO,1,2) = '73' THEN 3333
           WHEN SUBSTR(EMPNO,1,2) = '74' THEN 4444
           WHEN SUBSTR(EMPNO,1,2) = '75' THEN 5555
          WHEN EMPNO IS NULL THEN 0000
           ELSE EMPNO
        END AS EMPNO_REVISED
FROM EMP;

-- DECODE() VS CASE절
-- DECODE() => 조건 중에 =만 받을 수 있음
-- CASE절 => 조건식에 다양한 연산을 넣을 수 있음 (보통 많이 사용)
-- CASE 조건의 대상 (열 이름, 계산식)
--     WHEN A
--      WHEN B
-- 조건의 대상 = 'A'
-- 조건의 대상 = 'B'





-- "반환값 통일"
-- '3333' => VARCHAR
-- TO_CHAR(EMPNO) => NUMBER -> VARCHAR

-- 3333 => NUMBER
-- EMPNO => NUMBER


-- * CASE, DECODE() 조건별로 반환값이 "동일한 데이터 타입"
-- * CASE문 다양한 조건 사용 가능 (IS NULL로 NULL값 확인 가능)