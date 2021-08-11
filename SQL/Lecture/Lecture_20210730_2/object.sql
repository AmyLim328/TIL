/* ��ü (object) ����
 * 
 * - ���̺� (table): ������ ���� ����
 * - ������ ���� (data dictionary)
 * - �ε��� (index)
 * - �� (view)
 * - ������ (sequence)
 * - ���Ǿ� (synonym)
 * 
 * */

-- [������ ����]
-- DB ��ϴµ� �߿��� ������ ����
-- ������ ����� DB ��� �Ұ���
-- ������ ���� �� (view)�� ����
-- �� �� (view): ���̺� �Ϻ�/��ü�� ������ ���̺�� �� �� �ְ� ��ü

-- USER_XXXX: DB ���� ���� ����� ��ü ����
-- ALL_XXXX: ��� ��� ������ ��ü ����
-- DBA_XXXX: DB ����/����� ���� ���� 
      -- (SYSTEM, SYS�� ���� DBA ���� ����)
-- V$_XXXX: DB ���� ���� (X$_XXXX ���̺� ��)

-- SCOTT �������� ��� ������ ������ ����
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

SELECT * FROM DBA_USERS;


-- USER_: SCOTT�� ������ �ִ� ��ü
SELECT TABLE_NAME
FROM USER_TABLES;

-- ALL_: SCOTT ������ �� �� �ִ� ��� ��ü
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- DBA_: DBA�� ���� ����ڸ� �� �� �ִ� ��ü
-- SCOTT DBA ������ ���� ��쿡�� TABLE DOES NOT EXIST!
-- "���� ���̺��� ������ �� �� �� ����!"
SELECT *
FROM DBA_TABLES;

-- DBA ������ ������ �ִ� ���� Ȯ��
SELECT *
FROM DBA_USERS;


-- [�ε��� (index)]
-- : DB���� ������ �˻� ���� ���
-- "INDEX SCAN" (�ε����� ���� ������ Ȯ��)
-- VS "TABLE FULL SCAN" (���� �� Ȯ��)

-- ���̺� �ε����� ������� ?
-- => �⺻Ű (primary key)

-- SCOTT ������ ���� �ε��� ���� Ȯ��
-- �ε����� ���� ���̺� �˻� 
SELECT *
FROM USER_INDEXES;

-- �ε����� ������ �� �̸� Ȯ��
SELECT *
FROM USER_IND_COLUMNS;

-- * �ε��� ���� ���� �������� ������
-- �⺻Ű�� �ڵ����� ����

-- 1) �ε��� ����
/* ����)
 * 
 * CREATE INDEX �ε��� �̸�
 * ON ���̺� �̸� (�� �̸�1 ASC OR DESC, -- �⺻: ASC
 *             �� �̸�2 ASC OR DESC,
 *             ...
 *             �� �̸�N ASC OR DESC)
 * 
 * */
SELECT * FROM EMP;

CREATE INDEX IDX_EMP_ENAME
ON EMP(ENAME);

SELECT * FROM USER_IND_COLUMNS;

-- SAL, COMM �ε����� ���� (IDX_EMP_SAL_COMM)
CREATE INDEX IDX_EMP_SAL_COMM
ON EMP(SAL, COMM);

-- �ε��� �߰�: CREATE
-- �ε��� ����: DROP
-- �ε��� ����: ALTER

/* �ε��� ��� ���� 
 * : ������ ��ȸ �ӵ� (SELECT) ���
 * : �ý����� ���� ���� �� ����
 * : ����� ū ���̺� ����
 * : �߰�/����/���� ���� �߻����� ���� ��
 * : JOIN, WHERE�� ���� ���Ǵ� ��
 * 
 * �ε��� ��� ����
 * : �߰� �۾��� �ʿ�
 * : �ε����� ���� ��������� ���� �ʿ� (10%)
 * : �ε��� �߸� ����� ��� ���� ������ ��ȿ��
 * */

-- CREATE, DELETE ('������� ����'), UPDATE
-- �� ����� �Ӽ��� �ε��� ����ϰ� �Ǹ�
-- �ε����� ũ�Ⱑ Ŀ��





-- 1) �� ����
-- : �� ���� ���� (SCOTT �� ���� ������ ��� ��)
-- sqlplus 
-- system/oracle
-- grant create view to scott;
-- exit

/* ����)
 * CREATE [OR REPLACE] [FORCE | NOFORCE] 
 * VIEW �� �̸�
 * (�� �̸�1, �� �̸�2 ...)
 * AS (SELECT ����) 
 * 
 * [WITH CHECK OPTION (CONSTRAINT ��������) (����)]
 * [WITH READ ONLY (CONSTRAINT ��������) (����)]
 * 
 * * OR REPLACE: ���� �̸��� ������ ��� �� ��ü (����)
 * * FORCE: SELECT�� ��� ���̺��� ��� ���� ���� (����)
 * * NOFORCE: SELECT�� ��� ���̺��� ��� ���� ���� X (�⺻��) (����)
 * * �� �̸�: ������ �� �̸� ���� (�ʼ�)
 * * �� �̸�: SELECT�� ��õ� �̸� ��� ����� �� �̸� ���� (���� ����, ����)
 * * ������ SELECT��: ������ �信 ������ SELECT�� (�ʼ�)
 * * WITH CHECK OPTION: DML �۾� �����ϵ��� �� ���� (����)
 * * WITH READ ONLY: �� ������ �����ϵ��� �� ���� (����)
 * */

-- �� ����
SELECT * FROM EMP;

CREATE VIEW VW_EMP 
AS (SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP);

 -- USER_VIEWS ������ ���� ��ȸ
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP;
		
-- �� ���� (=> EMP ���̺� �����Ǵ� �� �ƴ�!)
DROP VIEW VW_EMP;

SELECT * FROM USER_VIEWS;

-- Q1. �� (VW_EMP) ����
-- EMPNO, ENAME, HIREDATE => NO, NAME, HDATE (�� �� �̸� ����)
-- WITH READ ONLY
-- EMPNO, ENAME, HIREDATE (1500 <= SAL <= 2500)

CREATE OR REPLACE VIEW VW_EMP (NO, NAME, HDATE)
AS (SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE SAL BETWEEN 1500 AND 2500)
WITH READ ONLY; - SELECT�� ������ �� ���� (�� ������ ����)

SELECT * FROM VW_EMP;

-- Q2. �� (VW_EMP) ����
-- ������ �̸��� �ִٸ� REPLACE �ɼ��� ���� VW_EMP ���� ��� ����
-- WITH CHECK OPTION (DML ��� ����)
-- SMITH���� ���� (SAL * 12 + COMM)�� 
-- ���� �޴� EMPNO, ENAME, SAL ���� ���� �� ����

-- WITH CHECK OPTION ����� VIEW�� DML ��� ����
-- 1) �信 ������ ���� �׽�Ʈ �غ��� (2021, GILDONG, 1000) -- ERROR
-- 2) �信 ������ ���� �׽�Ʈ �غ��� (2025, GILSUN, 500) -- ERROR

CREATE OR REPLACE VIEW VW_EMP
AS (SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL * 12 + NVL(COMM, 0) < (SELECT SAL * 12 + NVL(COMM, 0) FROM EMP WHERE ENAME = 'SMITH'))
WITH CHECK OPTION; -- DML ������ ���� ����! (������ �����ϸ�)

INSERT INTO VW_EMP
VALUES (2021, 'GILDONG', 1000); -- ������ ���� X

INSERT INTO VW_EMP
VALUES (2022, 'GILSOON', 500);

-- 3) �ζ��� �並 �̿��� TOP-N SQL��
-- : �ζ��� �� (inline view) (VS��)
-- : ��ȸ������ ���� ����ϴ� �� (WITH ~~ AS ~~)

-- 1-1. �ζ��� �� + ROWNUM ���
SELECT ROWNUM, E.*
FROM EMP E;

-- �ǻ� ��(PSEUDO COLUNM) (ROWNUM) 
-- ���� ���̺� ���������� ������ Ư�� ������ ���ؼ� ��ó�� ���

-- cf) �ǻ� �ڵ� (PSEUDO CODE)
-- : ���� �ڵ�� �ƴϰ� �˰���(���)�� ǥ���ϱ� ���� ���

-- �޿��� ���� ���� 3�� ������ ��� (ROWNUM �̿�)
-- �ζ��� �� (WHERE) => ������ ������
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC) E
WHERE ROWNUM <= 3;

-- �ζ��� �� (WITH ~ AS) => ������ ����
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 3;

-- Q1. ����� �Ŵ����� �Ի����� �ֱ��� 5�� ����
WITH E AS (SELECT * FROM EMP E1 JOIN EMP E2 ON (E1.MGR = E2.EMPNO) ORDER BY E2.HIREDATE DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 5;

-- Q2. COMM�� NULL�� ����� �߿� EMPNO�� ���� ��� 3�� ����
WITH E AS (SELECT * FROM EMP WHERE COMM IS NULL ORDER BY EMPNO DESC)
SELECT ROWNUM, E.*
FROM E 
WHERE ROWNUM <= 3;