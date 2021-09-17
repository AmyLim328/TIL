DROP TABLE STUDENT;
CREATE TABLE STUDENT (
	ID NUMBER(4),
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255)
);

SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES (NULL, NULL, NULL, NULL, NULL);

SELECT COUNT(*)
FROM STUDENT;

-- 1) 특정 속성값만 데이터를 삽입하는 경우
-- INSERT INTO 테이블명 (속성 1, 속성 2,....)
-- VALUES (값 1, 값 2, ....)
INSERT INTO STUDENT (ID, LastName, FirstName)
VALUES (1, '홍', '길동');

-- 2) 모든 속성에 대해 데이터를 삽입하는 경우
-- INSERT INTO 테이블명 
-- VALUES (값 1, 값 2, ....)
INSERT INTO STUDENT
VALUES (1, '홍', '길동', '구트학원', '서울시');




