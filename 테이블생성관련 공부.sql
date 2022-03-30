create table newBook(
bookid number, 
bookname varchar2(20),
publisher varchar2(20),
price number);

 drop table newbook;
 
create table newbook(
 bookid number primary key, -- not null & unique
 bookname varchar2(20),
 publisher varchar2(20),
 price number
 );
 
create table newbook(
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price>1000),
primary key(bookname, publisher)
);

insert into newbook(bookname, publisher, price) values(null, '삼성출판사',20000);
insert into newbook(bookname, publisher, price) values('축구좋아', '삼성출판사',20000);
insert into newbook(bookname, publisher, price) values('축구또좋아', '삼성출판사',20000);

insert into newbook(bookname, publisher) values('축구좋아', '대동출판사');

insert into newbook(bookname, publisher, price) values('축구좋아', '금성출판사', 500);



create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(30)
);

insert into newcustomer(custid, name,address, phone) values (1,'홍길동','서울시','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (2,'홍길동','서울시','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (3,'홍길동','수원시','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (4,'홍길동','수원시','010-1234-5678');
commit;

select * from newcustomer;

create table newOrders(
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

insert into neworders(orderid, custid, bookid, saleprice, orderdate) values(1,1,1,1000,sysdate);
select * from neworders;

insert into neworders(orderid, custid, bookid, saleprice, orderdate) values(2,5,1,1000,sysdate);
commit;

delete from newcustomer where custid=1;

select * from newbook;
alter table newbook add isbn varchar2(13);

ALTER TABLE NewBook MODIFY isbn NUMBER;

ALTER TABLE NewBook DROP COLUMN isbn;


--dorp table
drop table newbook;

--primary key 지정 않고 table생성
create table newBook(
bookid number, 
bookname varchar2(20),
publisher varchar2(20),
price number);


--[질의 3-40] NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
ALTER TABLE NewBook MODIFY bookid not null;

--[질의 3-41] NewBook 테이블의 bookid 속성을 기본키로 변경하시오. 
ALTER TABLE NewBook ADD PRIMARY KEY(bookid);

rename newbook to oldbook; 


----------------------------------
--테이블 삭제
--1.참조하는 테이블 삭제 후
drop table neworders;
--2.참조되는 테이블 삭제
drop table newcustomer;

select * from user_constraints where table_name='NEWCUSTOMER';

--2.제약조건 같이 삭제
--drop table 테이블명 cascade constraints;
drop table newcustomer cascade constraints;

--기존테이블의 데이타를 가지고 새로운 테이블 생성
--CREATE TABLE생성할 테이블명 as select문;
create table newbook as select * from book;
commit;
--3.테이블은 그대로 두고 데이타만 삭제  -db에 바로 반영 DDL문
select * from newbook;
truncate table newbook;

--DDL문 :( DB에 즉시 반영): CREATE, ALTER, DROP, TRUNCATE문


--중복이름이 없으면 등록하도록 처리
select count(*) from customer where name = '김길동';

select * from book order by bookid;


create or replace NONEDITIONABLE function fnc_interest(
price number
) 
return number
is
  myInterest number;
begin 
    /* 가격이 30,000원 이상이면 10%  30,000원 미만이며 5% */
    if price >=30000 then
       myInterest :=price * 0.1;
    else
      myInterest :=price * 0.05;
    end if;

    /*결과 리턴*/
   return myInterest;
end;


drop table table_test;
create table table_test(
bookid number primary key,
bookname varchar2(50),
price number
);

insert into table_test values ((select nvl(max(bookid), 0)+1 from table_test),'book'||(select 'book'||(nvl(max(bookid), 0)+1) from table_test), 5000);

drop table table_test;
create table table_test(
bookid number primary key,
bookname varchar2(50),
price number
);

insert into table_test values ((select nvl(max(bookid), 0)+1 from table_test),'book'||(select 'book'||(nvl(max(bookid), 0)+1) from table_test), 5000); 

select * from table_test;

-- Blob(Binary Large Object ) - 대용량의 바이너리 데이타 저장 타입 최대크기 :4gb
create table photo(
id varchar2(20) primary key,
image blob 
);

select * from photo;




commit;


