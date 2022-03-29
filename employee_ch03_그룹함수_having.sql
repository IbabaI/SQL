-- �׷��Լ�
select sum(salary), avg(salary), max(salary), min(salary) from employee;

--sum()�Լ��� null�� �����ϰ� ����
select sum(commission) from employee;

--count()
select count(*) as "��� ��" from employee;

-- Ŀ�̼��� �޴� ��� ��
select count(commission) as "Ŀ�̼��� �޴� ��� ��" from employee;

--������ ���� ���ϱ�
select count(distinct job) from employee;

--�׷��Լ� ����
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
--00937. 00000 -  "not a single-group group function"
select ename, max(salary) from employee;

--�ҼӺμ��� ��� �޿��� �μ���ȣȭ �Բ� ���
select dno as "�μ� ��ȣ", avg(salary) as "�޿� ���"
    from employee group by dno;

-- �ҼӺμ��� ��� �޿��� �μ���ȣ �μ���� �Բ� ���
select department.dno as "�μ���ȣ",  min(dname),  avg(salary) as "�޿� ���"
 from employee, department 
 where employee.dno = department.dno
 group by department.dno;



-- having
-- �μ��� �޿� �Ѿ� 3000 �̻��� �μ��� ��ȣ�� �μ��� �޿� �Ѿ�
select dno, sum(salary) from employee group by dno having sum(salary) >= 3000;

-- �޿��� 1000�̻��� ������� �μ���(deptno) ��� �޿��� ���
-- ��, �μ��� ��� �޿��� 2000�̻��� �μ��� ���
select dno, avg(salary) 
    from employee where sal >= 1000 
    group by dno 
    having avg(salary) >= 2000;
    
select empno, ename, deptno, dname
    from emp e, dept d
    where e.deptno = d.deptno(+)
    and empno like '1%';


-- manager�� �����ϰ� �޿� �Ѿ� 5000�̻��� ���޺� �޿� �Ѿ� ���ϱ�
select job, sum(salary) total
    from employee
    where job <> 'manager'
    group by job
    having sum(salary) >=5000;

--�ְ� �޿� ���
select max(salary) from employee;

--Ȯ��
--1.��� ����� �޿� �ְ��, ������, �Ѿ�, ���
select max(salary) as maxSalary,
         min(salary) as minSalary,
         sum(salary) as sumSalary,
         avg(salary) as avgSalary
from employee;

--2. �� ��� ���� ������ �޿� �ְ��, ������, �Ѿ�, ���
select job, max(salary) as maxSalary,
         min(salary) as minSalary,
         sum(salary) as sumSalary,
         avg(salary) as avgSalary
from employee
group by job;

--3. count(*) �Լ��� �̿� ��� ������ ������ ����� ���
select job, count(*)
  from employee
  group by job;
  
  
--4. ������ ���� �����Ͻÿ�. 
select count(distinct manager) from employee;

select a.eno, a.ename, a.manager, b.ename
  from employee a, employee b
  where a.manager = b.eno;



--5. �޿��ְ��, �������� ����, 
select max(salary), min(salary), max(salary) - min(salary)
  from employee;
 
-- 6. ���޺� ����� ���� �޿�, �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ����
-- �޿��� ���� �������� ����
select job, min(salary) from employee where manager is not null
    group by job having min(salary) >=2000 order by min(salary) desc;
    
--7. �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��� �޿�,
 select dno, count(*), round(avg(salary),2)
  from employee
  group by dno;

select * from department;
--8. �� �μ��� ���� �μ���ȣ, �μ� �̸�, ������, �����, �μ��� ��� ����� ��� �޿�,
select dno, 
         decode(dno, 10,upper('accounting'), 20,upper('research'), 30,upper('sales'),40,upper('operation')) as dname,
          decode(dno, 10,initcap('new york'), 20,initcap('dalas'), 30,initcap('chicago'),40,initcap('boston')) as loc,
count(*), round(avg(salary),-2)
 from employee
 group by dno;
 
 select dno, 
         case dno when 10 then upper('accounting') when  20 then upper('research') when  30 then upper('sales') when 40 then upper('operation') end as dname,
         case dno when 10 then initcap('new york') when 20 then initcap('dalas') when  30 then initcap('chicago') when 40 then initcap('boston') end as loc,
count(*), round(avg(salary),-2)
 from employee
 group by dno;


--9.������ ǥ�� �� ���� �ش� ������ ���� �μ��� �޿� �� �μ� 10,20,30 �� �޿� �Ѿ��� ���� ����Ͻÿ�.
--job , 10, 20 ,30
select job, dno, 
        sum(salary) "�Ѿ�",
        decode(dno, 10,sum(salary)) as "�μ� 10", 
        decode(dno, 20,sum(salary)) as "�μ� 20",
        decode(dno, 30,sum(salary)) as "�μ� 30",
        decode(dno, 40,sum(salary)) as "�μ� 40" 
 from employee
 group by job, dno
 ;
 
select job, dno,
         sum(�Ѿ�),
         sum("�μ� 10"),
         sum("�μ� 20"),
         sum("�μ� 30"),
         sum("�μ� 40")
 from      
 (select job, dno, 
        sum(salary) "�Ѿ�",
        decode(dno, 10,sum(salary)) as "�μ� 10", 
        decode(dno, 20,sum(salary)) as "�μ� 20",
        decode(dno, 30,sum(salary)) as "�μ� 30",
        decode(dno, 40,sum(salary)) as "�μ� 40" 
 from employee
 group by job, dno
 )
 group by job, dno
 ;



