-- 다음 중 결과가 다른 SQL은??
create table sample (
    COL1 varchar(5),    -- 데이타 : SQL
    COL2 char(5)        -- 데이타 : SQL
    );
SELECT * FROM SAMPLE WHERE COL1 = COL2;
SELECT * FROM SAMPLE WHERE COL1 = TRIM(COL2);
SELECT * FROM SAMPLE WHERE COL1 ＜ ＞ COL2;
SELECT * FROM SAMPLE WHERE COL1 = RTRIM(COL2);


create table sample1 (
    COL1 NUMBER(4),    -- 데이타 : 10, 20, null
    COL2 NUMBER(4)        -- 데이타 : 5, null, 15
    );
select sum(COL1), sum(COL2) from sample1 where COL2 > 5;
-- COL1 은 null, COL2는 15
-- sum() 은 null 값을 제외한 합계

select sum(COL1), sum(COL2) from sample1 where COL2 is not null;
-- COL1 은 10, COL2는 20
-- 대략 이해는 했지만 자세한 설명이 필요함.ㅠㅠ
select sum(COL1), sum(COL2) from sample1 where COL2 is null;
-- COL1 은 20 , COL2는 null

create table sample2 (
    COL1 NUMBER(4),    -- 데이타 : 10, null, 30
    COL2 NUMBER(4)        -- 데이타 : null, 15, 25
    );
-- 결과값이 가장 적은 sql은?
SELECT COUNT(COL1)*10 FROM SAMPLE2; -- 20 , COUNT(표현식) : 표현식의 값이 NULL 값인 것을 제외한 행의 수
SELECT SUM(COL1+COL2)/4 FROM SAMPLE2; --13.75
SELECT SUM(COL2)/2 FROM SAMPLE2; -- 20 , SUM() : NULL 값을 제외한 합계
SELECT AVG(COL1) FROM SAMPLE2; -- 20 , AVG() : NULL 값을 제외한 평균
