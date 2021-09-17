/* �������� ����
 * �л� ���� ���̺� (STUDENT)
 * 1. �й� (ID, NUMBER(8))
 * 2. �̸� (NAME, VARCHAR(10))
 * 3. ������� (BIRTHDAY, DATE)
 * 4. �ڵ�����ȣ (PHONENUM, VARCHAR(20))
 * 5. �г� (GRADE, NUMBER(1))
 * 6. �б� (SEMESTER, NUMBER(1))
 * 7. �а� �ڵ� (DEPTNO, VARCHAR(3))
 
 * �а� ���� ���̺� (UNIVDEPT)
 * 1. �а� �ڵ� (DEPTNO, VARCHAR(3))
 * 2. �а� �̸� (DEPTNAME, VARCHAR(10))
 * 3. ���� ���� (ESTDATE, DATE)
 * 4. ��ǥ ��ȭ��ȣ (DEPTTEL, VARCHAR(20))
 **/

-- ��������
-- 1. �л� ���� ���̺��� ID�� �⺻Ű, �а� ���� ���̺��� DEPTNO�� �⺻Ű
-- 2. �л� ���� ���̺�� �а� ���� ���̺��� �а� �ڵ� ���� �������� ���谡 �����Ǿ�����
-- (STUDENT���� DEPTNO�� �ܷ�Ű, UNIVDEPT���� DEPTNO�� �⺻Ű)
-- ���� �а� ������ ������� �ȴٸ� �л� ���̺��� DEPTNO�� NULL�� ����

-- �л� ���� ���̺� ��������
-- 1. �й��� ������ 8���� �����ǰ� ��� ���ڿ��� ��
-- 2. �ڵ��� ��ȣ�� 11�ڸ� �Ѿ�� �� 
-- 3. �г��� 1, 2, 3, 4 �г����θ� ���� (����Ʈ ���� 1)
-- 4. �б�� 1, 2 �б�θ� ���� (����Ʈ ���� 1)

-- �а� ���� ���̺� ��������
-- 1. �а� �ڵ�� ������ 3���� �����ǰ� ��� ���ڿ��� ��
-- 2. ��ǥ ��ȭ��ȣ�� 11�ڸ��� �Ѿ�� ��

-- �Է� ����
-- 1. ��������� �ð����� ��/��/�� ���·� �Էµ�
-- 2. ���� ���ڴ� �ð����� ��/��/�� ���·� �Էµ�

-- Q1. ���� ���������� �����ϴ� ���̺� STUDENT, UNIVDEPT�� �����Ͻÿ�.
DROP TABLE UNIVDEPT;

CREATE TABLE UNIVDEPT (
	DEPTNO VARCHAR(3), 
	DEPTNAME VARCHAR(10),
	ESTDATE DATE,
	DEPTTEL VARCHAR(20),
	CONSTRAINT UNIVDEPT_PK PRIMARY KEY(DEPTNO),
	CONSTRAINT UNIVDEPT_DNO_CK CHECK (LENGTH(DEPTNO) = 3 AND UPPER(DEPTNO) BETWEEN 'AAA' AND 'ZZZ' ), 
	CONSTRAINT UNIVDEPT_DTEL_CK CHECK (LENGTH(DEPTTEL) > 11)
);

DROP TABLE STUDENT;

CREATE TABLE STUDENT (
	ID NUMBER(8),
	NAME VARCHAR(10),
	BIRTHDAY DATE,
	PHONENUM VARCHAR(20),
	GRADE NUMBER(1) DEFAULT 1,
	SEMESTER NUMBER(1) DEFAULT 1,
	DEPTNO VARCHAR(3),
	CONSTRAINT STUDENT_PK PRIMARY KEY (ID),
	CONSTRAINT STUDENT_FK FOREIGN KEY (DEPTNO) REFERENCES UNIVDEPT (DEPTNO) ON DELETE SET NULL,
	CONSTRAINT STUDENT_ID_CK CHECK (LENGTH(ID) = 8 AND ID BETWEEN '00000000' AND '99999999'),
	CONSTRAINT STUDENT_PN_CK CHECK (LENGTH(PHONENUM) > 11),
	CONSTRAINT STUDENT_GR_CK CHECK (GRADE BETWEEN 1 AND 4),
	CONSTRAINT STUDENT_SM_CK CHECK (SEMESTER BETWEEN 1 AND 2)
);

-- Q2. �ܷ�Ű ���������� �����ϴ� �׽�Ʈ �ڵ带 �ۼ��Ͻÿ�.
INSERT INTO UNIVDEPT
VALUES ('COM', 'CS', SYSDATE, '010-1234-5678');

INSERT INTO UNIVDEPT
VALUES ('ACC', 'ACCOUNTING', SYSDATE, '010-1234-5679');

INSERT INTO UNIVDEPT
VALUES ('MUS', 'MUSIC', SYSDATE, '010-1234-5670');

INSERT INTO STUDENT
VALUES (20200001, 'PARIS', TO_DATE('1996/12/29', 'YYYY/MM/DD'), '010-1234-7777', 3, 2, 'ART');

INSERT INTO STUDENT (ID, DEPTNO)
VALUES (20200002, 'SCI');

-- Q3. �г�� �б��� ����Ʈ ���� Ȯ���� �� �ִ� �׽�Ʈ �ڵ带 �ۼ��Ͻÿ�.
INSERT INTO STUDENT(ID, NAME, BIRTHDAY, PHONENUM, DEPTNO) 
VALUES (20210002, 'HILTON', TO_DATE('1997/12/29', 'YYYY/MM/DD'), '010-1234-8888', 'MUS');

SELECT * FROM STUDENT;

-- Q4. �й��� ���������� �����ϴ� �׽�Ʈ �ڵ带 �ۼ��Ͻÿ�.
INSERT INTO STUDENT (ID)
VALUES (NULL);

INSERT INTO STUDENT (ID)
VALUES (20210002);

INSERT INTO STUDENT (ID)
VALUES (202100000);

INSERT INTO STUDENT (ID)
VALUES ('ABCDEFGH');

-- Q5. �а� �ڵ尡 ���������� �����ϴ� �׽�Ʈ �ڵ带 �ۼ��Ͻÿ�.
INSERT INTO UNIVDEPT (DEPTNO)
VALUES ('POLITIC');

INSERT INTO UNIVDEPT (DEPTNO)
VALUES ('123');

-- Q6. STUDENT, UNIVDEPT ���̺��� ���������� Ȯ���ϴ� �ڵ� (USER_CONSTRAINTS)�� �ۼ��Ͻÿ�.
SELECT * 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'STUDENT';

SELECT * 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'UNIVDEPT';