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

insert into newbook(bookname, publisher, price) values(null, '�Ｚ���ǻ�',20000);
insert into newbook(bookname, publisher, price) values('�౸����', '�Ｚ���ǻ�',20000);
insert into newbook(bookname, publisher, price) values('�౸������', '�Ｚ���ǻ�',20000);

insert into newbook(bookname, publisher) values('�౸����', '�뵿���ǻ�');

insert into newbook(bookname, publisher, price) values('�౸����', '�ݼ����ǻ�', 500);



create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(30)
);

insert into newcustomer(custid, name,address, phone) values (1,'ȫ�浿','�����','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (2,'ȫ�浿','�����','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (3,'ȫ�浿','������','010-1234-5678');
insert into newcustomer(custid, name,address, phone) values (4,'ȫ�浿','������','010-1234-5678');
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

--primary key ���� �ʰ� table����
create table newBook(
bookid number, 
bookname varchar2(20),
publisher varchar2(20),
price number);


--[���� 3-40] NewBook ���̺��� bookid �Ӽ��� NOT NULL ���������� �����Ͻÿ�.
ALTER TABLE NewBook MODIFY bookid not null;

--[���� 3-41] NewBook ���̺��� bookid �Ӽ��� �⺻Ű�� �����Ͻÿ�. 
ALTER TABLE NewBook ADD PRIMARY KEY(bookid);

rename newbook to oldbook; 


----------------------------------
--���̺� ����
--1.�����ϴ� ���̺� ���� ��
drop table neworders;
--2.�����Ǵ� ���̺� ����
drop table newcustomer;

select * from user_constraints where table_name='NEWCUSTOMER';

--2.�������� ���� ����
--drop table ���̺�� cascade constraints;
drop table newcustomer cascade constraints;

--�������̺��� ����Ÿ�� ������ ���ο� ���̺� ����
--CREATE TABLE������ ���̺�� as select��;
create table newbook as select * from book;
commit;
--3.���̺��� �״�� �ΰ� ����Ÿ�� ����  -db�� �ٷ� �ݿ� DDL��
select * from newbook;
truncate table newbook;

--DDL�� :( DB�� ��� �ݿ�): CREATE, ALTER, DROP, TRUNCATE��


--�ߺ��̸��� ������ ����ϵ��� ó��
select count(*) from customer where name = '��浿';

select * from book order by bookid;


create or replace NONEDITIONABLE function fnc_interest(
price number
) 
return number
is
  myInterest number;
begin 
    /* ������ 30,000�� �̻��̸� 10%  30,000�� �̸��̸� 5% */
    if price >=30000 then
       myInterest :=price * 0.1;
    else
      myInterest :=price * 0.05;
    end if;

    /*��� ����*/
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

-- Blob(Binary Large Object ) - ��뷮�� ���̳ʸ� ����Ÿ ���� Ÿ�� �ִ�ũ�� :4gb
create table photo(
id varchar2(20) primary key,
image blob 
);

select * from photo;




commit;


