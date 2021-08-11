/* [Ʈ�����]
 * : transaction
 * : �� �̻� ������ �� ���� �ּ� ���� ����
 * : �� �� �̻��� ������ ���۾� (DML) ����
 * 
 * Ʈ������� �� ����?
 * EX) ���� ���� ���� DB
 * 1) A���� (���� �ܾ� 200)
 * UPDATE 200 -> 0
 * 
 * 2) B���� (���� �ܾ� 0)
 * UPDATE 0 -> 200
 * 
 * -> 1), 2)�� ���� ����! (Ʈ��������� ����� ��)
 * -> 'ALL OR NOTHING'
 * -> Ʈ����� ���� ��ɾ� : TCL
 * (Transaction Control Language)
 * -> Ʈ����� ����
 * 1) ���� ����
 * 2) ���
 * 
 * Ʈ������� Ư¡ (ACID)
 * 1) ���ڼ� : (Atomicity)
 * : Ʈ������� �̷�� DML �ڵ带 �ϳ��� ���ڷ� ���ڴ�!
 * : "ALL OR NOTHING"
 * 
 * 2) �ϰ��� (Consistency)
 * : Ʈ����� ����Ǳ� �� ������ ���� DB
 * => Ʈ����� ���� �� ������ ���� DB
 * 
 * 3) ���� (Isolation)
 * : Ʈ����� ���� ���߿� �ٸ� Ʈ����� ������ �޾� ����� �߸��Ǹ� �ȵȴ�!
 * 
 * 4) ���Ӽ� (Durability)
 * : Ʈ������� ���������� ����Ǹ� �ش� Ʈ������� ������ DB ������ ���������� ����
 */

-- DEPT ���̺� �����ؼ� DEPT_TCL ���̺� ����
CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

-- 50�� �μ� �߰�
INSERT INTO DEPT_TCL VALUES (50, 'DEVELOPER', 'SEOUL');

-- 40�� �μ� DNAME�� FACTORY
UPDATE DEPT_TCL SET DNAME = 'FACTORY' WHERE DEPTNO = 40;

SAVEPOINT point1
-- �μ� DNAME RESEARCH�� �μ� ���� 
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

-- 1) Ʈ����� ��� (ROLLBACK)
ROLLBACK TO SAVEPOINT point1-- �����ݷ� ���� �ۼ�

DROP TABLE DEPT_TCL

/* �ϳ��� Ʈ����� ���� :
 * TCL�� ������ �� ���� Ʈ����� ����
 * */

-- 2) Ʈ������� ������ �ݿ��ϴ� COMMIT
-- : COMMIT �ϸ� ROLLBACK �Ұ�!
SELECT * FROM DEPT_TCL;
COMMIT -- TCL (���м�)

INSERT INTO DEPT_TCL VALUES (60, 'NETWORK', 'BUSAN');
ROLLBACK -- TCL (���м�)

UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;
COMMIT -- TCL (���м�)

ROLLBACK
SELECT * FROM DEPT_TCL;
-- ���� COMMIT�� �Ǹ� ���̻� ROLLBACK �� ���� ����

-- Q1. ���� ���� ���� 
-- TABLE ACCOUNT_A
-- ������ �̸� (NAME, VARCHAR(10))
-- ���¹�ȣ (ACCOUNT, VARCHAR(20))
-- �ܾ� (BALANCE, VARCHAR(20))

-- TABLE ACCOUNT_B
-- ������ �̸� (NAME, VARCHAR(10))
-- ���¹�ȣ (ACCOUNT, VARCHAR(20))
-- �ܾ� (BALANCE, VARCHAR(20))

/* CREATE TABLE ���̺� �̸� {
 *    �� �̸� �ڷ���,
 *  �� �̸� �ڷ���,
 * 
 *  �� �̸� �ڷ���
 * };
 * 
 * ACCOUNT_A (200), ACCOUNT_B (0) ���� �����͸� �Է�
 * A -> B ���� 200���� ��ü (COMMIT)
 * */

CREATE TABLE ACCOUNT_A (
   NAME   VARCHAR(10),
   ACCOUNT VARCHAR(20),
   BALANCE NUMBER(30)
);

CREATE TABLE ACCOUNT_B (
   NAME   VARCHAR(10),
   ACCOUNT VARCHAR(20),
   BALANCE NUMBER(30)
);

-- 0. INSERT INTO �ܾ��� �Է�
--  A: 200�� ��, B: 0�� ����
INSERT INTO ACCOUNT_A VALUES ('A', '1234-5678', 2000000);
COMMIT -- �����ݷ� ���� �ۼ�

INSERT INTO ACCOUNT_B VALUES ('B', '1234-5678', 0);
COMMIT  -- �����ݷ� ���� �ۼ�

SELECT * FROM ACCOUNT_A;
SELECT * FROM ACCOUNT_B;

ROLLBACK
-- �����ݷ� ���� �ۼ�
-- COMMIT �ڿ� �ۼ��� DML(UPDATE, DELETE, INSERT)�� ��� ROLLBACK�� �ڵ尡 ����


-- 1. A�� ��ü�Ϸ��� �ϴ� �ݾ��� �߸� �Է����� �� (100����)
SAVEPOINT WITHDRAW;
UPDATE ACCOUNT_A SET BALANCE = 1000000;
UPDATE ACCOUNT_B SET BALANCE = 1000000;
ROLLBACK TO SAVEPOINT WITHDRAW

-- 2. A -> B ���������� ��ü�Ǿ��� ��
UPDATE ACCOUNT_A SET BALANCE = 0;
UPDATE ACCOUNT_B SET BALANCE = 2000000;
COMMIT

/* [���� (SESSION)]
 * 
 * 
 * 
 * 
 */

CREATE TABLE SESSION_TEST AS SELECT * FROM DEPT

INSERT INTO SESSION_TEST
VALUES (50, 'DEVELOPER', 'SEOUL');

COMMIT

UPDATE SESSION_TEST
SET LOC = 'JEJU'
WHERE DEPTNO = 50;
