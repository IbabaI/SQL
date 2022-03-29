-- �����Լ�
select 'Oracle mania',          
        upper('Oracle mania'),      -- �ҹ���
        lower('Oracle mania'),      -- �빮��
        initcap('Oracle mania')     -- ù���� �빮��
from dual;

select ename, lower(ename), job, initcap(job) from employee;

-- ��ȸ�� ��
select ENO, ename, dno from employee where ENAME = upper('scott');

select ENO, ename, dno from EMPLOYEE where lower(ename) = 'scott'; --Į������ ������ �ҹ��ڷ� ��ȯ��.

select ENO, ename, dno from EMPLOYEE where initCap(ename) = 'Scott';

-- ���ڿ� ���� length, lengthb
select length('Oracle mania'), length('����Ŭ�ŴϾ�') from dual;

select lengthb('Oracle mania'), lengthb('����Ŭ�ŴϾ�') from dual;

-- ���ڿ� �����Լ�
select substr('Oracle mania', 4,3),  --index 4, ���� 3 
        substr('Oracle mania', -4,3)  -- ����(-)�̸� �ڿ��� ���� index����
from dual;

--�̸��� N���� ������ ���
select * from employee where ename like '%N'; 
  
select * from employee where substr(ename,-1,1)='N';
 
--87�⵵ �Ի��� ���
select * from employee where substr(hiredate,1,2)='87';

--���ڿ� �����ϱ�
select substr('Oracle mania',4,3), substrb('Oracle mania',4,3), 
       substr('����Ŭ�ŴϾ�',3,4),
       substrb('����Ŭ�ŴϾ�',3,4) --3����Ʈ�� �ѱ���, 000,000,000
  from dual;


--instr(���, ã�� ����, ������ġ, �߰ߵ� ����)
select instr('Oracle mania', 'a') from dual;
select instr('Oracle mania', 'a',5, 2) from dual;

select instr('����Ŭ�ŴϾ�','��'), instrb('����Ŭ�ŴϾ�','��') from dual; --000000

--����° �ڸ��� 'R'�� ��� 
select * from employee where instr(ename, 'R',3,1) =3; -- 00R
select * from employee where ename like '__R%';

-- lpad(), rpad()
select lpad(salary, 10, '*') from employee;
select rpad(salary, 10, '*') from employee;

--trim 
select ' Oracle mania ', ltrim(' Oracle mania '), rtrim(' Oracle mania ') from dual;

--Ư�� ���� �����ϱ� - Ư�����ڰ� ù ��° �����̰ų� ������ ������ ��� �߶󳻱�
select 'Oracle mania', trim('O' from 'Oracle mania') from dual;



-- �����Լ�
select 98.7654, round(98.7654), round(98.7654,2), round(98.7654,-1) from dual;

select 98.7654, trunc(98.7654), trunc(98.7654,2), trunc(98.7654,-1) from dual;

--mod(��1,��2) ������
select mod(31,2), mod(31,5), mod(31,8) from dual;

-- ��� ����� �޿��� 500���� ���� ������ �� ���
select ename, salary, mod(salary, 500) from employee;



--��¥ �Լ�
---sysdate
select sysdate from dual;

--��¥����
select sysdate -1 ����, sysdate ����, sysdate + 1 ���� from dual;

select sysdate, round(sysdate), --��¥ �ݿø�
           round(sysdate,'cc'),  --���� �ݿø�
           round(sysdate, 'yyyy'),--�⵵ �ݿø�
           to_char(round(sysdate,'hh'),'yyyymmdd hh:mi:ss'), --�ð� �ݿø�
           round(sysdate,'month'), --�� �ݿø�
           round(sysdate, 'day'),--�� �ݿø�
           round(sysdate, 'Q')--�б� �ݿø�
           from dual;
           
--�ٹ��ϼ� ����ϱ�
select * from employee;
select round(sysdate - hiredate) �ٹ��ϼ� from employee;

--Ư����¥���� �� ���� ����
select hiredate, trunc(hiredate,'month') from employee;

--���� ���
-- �� ������� �ٹ� ���� ��
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) -- �γ�¥ ������ ������ (��¥1,��¥2)
from employee;

-- ��¥ - �����ϱ� 
--�Ի����� 6���� ������¥ ���ϱ�
select ename, hiredate, add_months(hiredate,6) from employee;

-- �ش糯¥ �������� ���ʷ� �����ϴ� ���Ͽ� �ش��ϴ� ���� ���ϱ�  next_day()
--������ �������� ���ʷ� �����ϴ� ����� ���ϱ�
select sysdate, next_day(sysdate,'������') from dual;

-- �ش糯¥�� ���� ���� ������ ��¥  last_day(��¥)
--�Ի��� ���� ������ �� ���ϱ�
select ename, hiredate, last_day(hiredate) from employee;


-- ��ȯ�Լ�
-- to_char()�Լ�
select ename, hiredate, to_char(hiredate, 'yy-mm'), to_char(hiredate,'yyyy/mm/dd day') from employee;

-- �ð� ���
--������ ��¥ �ð� ���
select sysdate, to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;

--��ȭ  to_char(��, format) - 'L����' ���� ��ȭǥ��
select ename, salary, to_char(salary, 'L999,999') from employee;

-- ���ڿ� ->��¥, to_date(���ڿ�, format)
--1981�� 02�� 20�� �Ի��� ��� ���
select ename, hiredate 
 from employee
where hiredate = to_date(to_char(19810220),'yyyymmdd');
--select * from employee;

-- �����͸� ���������� ��ȯ to_number
select '100,000' - '50,000' from dual;

-- to_number('������ ���ڿ�',format)
select to_number('100,000','999,999') - to_number('50,000','999,999') from dual; -- to_number('���ڿ�'), to_number('���ڿ�',format)




--�Ϲ��Լ�
--nvl(expr,��üǥ��)
select ename, salary, commission, nvl(commission,0), salary*12+nvl(commission,0) from employee order by job;

--nvl2(expr1,expr2,expr3) 
--expr1�� null�̸� expr3, null�� �ƴϸ� expr2
select ename, salary, commission, nvl(commission,0), nvl2(commission, salary*12+commission, salary*12) 
from employee order by job;

-- nullif(a,b)  -- a�� b�� ������ null, �ٸ��� a���
select nullif('a','a'), nullif('a','b') from dual;

--coalesce�Լ� --���ʷ� null�� �ƴѰ� ���
select ename, salary, commission, 
        coalesce(commission, salary, 0) -- commission�� null�ƴϸ� commission, null�̸� salary��, salary���� null�̸� 0
 from employee
order by job;

--decode�Լ� 
select ename, emp.dno, dname from employee emp, department dept where emp.dno=dept.dno;

-- decode�� �μ��� ���
select  ename, dno, 
         decode(dno,10,'ACCOUNTING',
                         20,'RESEARCH',
                         30,'SALES',
                         40,'OPERATIONS', 
                         'DEFAULT') as dname
 from employee;
         
-- case ��
-- case when �� then ��, when �� then ��2,... else �� end as Į����
select ename, dno,
        CASE when dno=10 THEN 'ACCOUNTING'
                when dno=20 then 'RESEARCH'
                when dno=30 then 'SALES'
                when dno=40 then 'OPERATIONS'
                else 'DEFAULT'  
                end  as dname
  from employee;

-- case Į�� when ��1 then �� when  ��2 then ��.... else �� end as Į����
select ename, dno,
        CASE dno when 10 THEN 'ACCOUNTING'
                      when 20 then 'RESEARCH'
                      when 30 then 'SALES'
                      when 40 then 'OPERATIONS'
                       else 'DEFAULT'  
                      end  as dname
  from employee;

--- Ȯ�� ����
--1. substr�Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ���
select * from employee;
select substr(hiredate,1,2) �⵵, substr(hiredate,4,2) ��, substr(hiredate,7,2) �� from employee;

--2. substr�Լ��� ����Ͽ� 4���� �Ի��� ��� ���
select * from employee where substr(hiredate, 4,2)='04';

--3. mod�Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ���
select * 
  from employee
  where mod(eno,2)=0;
  
--4. �Ի����� ���� 2�ڸ�,���� ���ڷ� ǥ��, ������ ���(dy)�� ǥ��
select to_char(hiredate,'yy') , to_char(hiredate,'mon'), to_char(hiredate,'dy') 
 from employee;
 
 --5. ���� ��ĥ �������� Ȯ���� 
select trunc(sysdate - to_date('2021/01/01','yyyy/mm/dd')) from dual;
select to_char(sysdate,'ddd') from dual; 

--6. ������� ��� ������ ����� ���� ��� null�� ��� 0���
select eno, ename, nvl2(manager, manager, 0) as manager from employee; 

--7.decode �Լ��� ���޿� ���� �޿� �λ�,  'ANALYST' 200, 'SALESMAN' 180,  MANAGER 150, CLERK 100 
select eno, ename, job, salary,
         decode(job, 'ANALYST', salary+200, 
                          'SALESMAN',salary+180, 
                          'MANAGER', salary+150,
                          'CLERK',salary+100, 
                          salary) as update_salary
 from employee;

select eno, ename, job, salary,
         case job when 'ANALYST' then salary+200 
                     when 'SALESMAN' then salary+180 
                     when 'MANAGER' then salary+150
                     when 'CLERK' then salary+100
                     else salary end 
                     as update_salary
 from employee;

 select eno, ename, job, salary,
         case when job='ANALYST' then salary+200 
                when job='SALESMAN' then salary+180 
                when job='MANAGER' then salary+150
                when job='CLERK' then salary+100
                else salary end 
                as update_salary
 from employee;






