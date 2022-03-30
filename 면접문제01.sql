-- ���� �� ����� �ٸ� SQL��??
create table sample (
    COL1 varchar(5),    -- ����Ÿ : SQL
    COL2 char(5)        -- ����Ÿ : SQL
    );
SELECT * FROM SAMPLE WHERE COL1 = COL2;
SELECT * FROM SAMPLE WHERE COL1 = TRIM(COL2);
SELECT * FROM SAMPLE WHERE COL1 �� �� COL2;
SELECT * FROM SAMPLE WHERE COL1 = RTRIM(COL2);


create table sample1 (
    COL1 NUMBER(4),    -- ����Ÿ : 10, 20, null
    COL2 NUMBER(4)        -- ����Ÿ : 5, null, 15
    );
select sum(COL1), sum(COL2) from sample1 where COL2 > 5;
-- COL1 �� null, COL2�� 15
-- sum() �� null ���� ������ �հ�

select sum(COL1), sum(COL2) from sample1 where COL2 is not null;
-- COL1 �� 10, COL2�� 20
-- �뷫 ���ش� ������ �ڼ��� ������ �ʿ���.�Ф�
select sum(COL1), sum(COL2) from sample1 where COL2 is null;
-- COL1 �� 20 , COL2�� null

create table sample2 (
    COL1 NUMBER(4),    -- ����Ÿ : 10, null, 30
    COL2 NUMBER(4)        -- ����Ÿ : null, 15, 25
    );
-- ������� ���� ���� sql��?
SELECT COUNT(COL1)*10 FROM SAMPLE2; -- 20 , COUNT(ǥ����) : ǥ������ ���� NULL ���� ���� ������ ���� ��
SELECT SUM(COL1+COL2)/4 FROM SAMPLE2; --13.75
SELECT SUM(COL2)/2 FROM SAMPLE2; -- 20 , SUM() : NULL ���� ������ �հ�
SELECT AVG(COL1) FROM SAMPLE2; -- 20 , AVG() : NULL ���� ������ ���
