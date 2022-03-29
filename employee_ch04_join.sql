--join
--equi(����) ����  Inner Join =
select * from employee, department
    where employee.dno = department.dno;

-- �����ȣ, ����̸�, �ҼӺμ� �̸� ���
select eno, ename, dname from employee, department
    where employee.dno = department.dno;
    
--Į�� �տ� ���̺�� ���
select employee.eno, employee.ename, department.dname, employee.dno
    from employee, department
    where employee.dno = department.dno;

select eno, ename, dname, employee.dno
    from employee, department
    where employee.dno = department.dno;


--equi join -natural join � �����ϴ� ���
-- natural join�� ���Ǵ� ����Į���� ���̺���� ����Ҽ� ����.
-- joinĮ���� ã� ������ ��
select e.eno, e.ename, d.dname, dno
    from employee e natural join department d
    where e.eno=7788;

-- join ~using 
-- �� ���� ���̺��� ���� �������� ���� �� �� �����ϰ��� �ϴ� �� ���̺��� �÷����� ���� ���
-- ���� ������ ��� ���� �ʰ� �����ϰ� ���� �� �ֵ��� �ϴ� ����
select e.eno, e.ename, d.dname, dno
    from employee e join department d using(dno)
    where e.eno = 7788;

-- join ~on
-- ON ���� �̿��� ���� ǥ������ ������ ���� ������ �����ϴ� ���
-- �Ϲ����� ��� ������ ������ ǥ���� �� �ִ�.
select e.eno, e.ename, d.dname, e.dno -- on ���� ���̺��.Į����
    from employee e join department d on e.dno=d.dno
    where e.eno=7788;
 
 -- NON-EQUI JOIN
 --�޿� ��� ���̺�
select * from salgrade;
 
 -- 81/02/20 ~ 81/05/01���� �Ի��� ��� ���
select * from employee  
    where  hiredate between '81/02/20' and '81/05/01'
    order by hiredate ;

select ename, salary, grade from employee, salgrade
    where salary between losal and hisal;

--self join
--
select employees.ename as "����̸�", manager.ename as "���ӻ���̸�"
    from employee employees, employee manager
    where employees.manager = manager.eno;

-- outer join (+)
select employees.ename || '�� ���� ����� '|| nvl(manager.ename,'����')
    from employee employees, employee manager
    where employees.manager = manager.eno(+);

--ansi outer join
select employees.ename || '�� ���� ����� '|| nvl(manager.ename,'����')
from employee employees left outer join employee manager
  on  employees.manager = manager.eno(+);
  
  --Ȯ��
  --1. eui���� scott����� �μ���ȣ �μ��̸� ���
  select ename, employee.dno, dname
   from employee, department
   where employee.dno = department.dno
   ;
   
--2. inner join on, ����̸��� �� ����� �Ҽӵ� �μ��̸� �� ������   
  select ename, employee.dno, dname, loc
   from employee join  department
   on employee.dno = department.dno
   ;
   
--3. inner join using 10�� �μ��� ���ϴ� ��� ����� ������ ���� ��� �μ��� ������ �����Ͽ� ���
select dno, job, loc
 from employee join department using(dno)
 where dno=10
 ;
 
 -- 4. natural join  Ŀ�̼��� �޴� ����� �̸�, �μ��̸�, ������ ���
 select ename, dname, loc
  from employee natural join department
  where commission is not null
  ;
   
--5. equi���� Wildcard A�� ���Ե� ����� �̸��� �μ���
select ename, dname
 from employee, department
where ename like '%A%';
   
   
--6. natural join New york �ٹ��ϴ� ����� 
select ename, job, dno, dname
 from employee natural join department
 where loc=upper('new york')
 ;


--7. self join, ���� ���̺� ������ ����
select emp.ename as Employee, emp.manager as "Emp#", mgr.dno manager, mgr.ename "mgr#"
 from employee emp, employee mgr
 where emp.manager=mgr.eno
 ;
 
 --8. outer join, self join
 
select emp.ename as Employee, emp.manager as "Emp#", mgr.dno manager, mgr.ename "mgr#"
 from employee emp, employee mgr
 where emp.manager=mgr.eno(+)
 ;
 
 --9. self join ���Ϻμ� �ٹ��ϴ� ��� ���  'scott'
select * from employee;
select me.ename as �̸�, me.dno as �μ���ȣ, other.ename as ����
  from employee me, employee other
 where me.dno = other.dno
   and me.ename =upper('scott')
   and other.ename != upper('scott')
 ;

 --10. self join ward���� �ʰ� �Ի��� ��� �̸��� �Ի�����
 select other.ename, other.hiredate
  from employee ward, employee other
where other.hiredate > ward.hiredate
  and ward.ename = upper('ward')
  ;
  
--11. self join �����ں��� ���� �Ի��� ��� ��� �̸� �� �Ի����� 
 select other.ename, other.hiredate, mgr.ename, mgr.hiredate
  from employee mgr, employee other
where other.hiredate <= mgr.hiredate
  and  other.manager = mgr.eno
  ;









    