-- ����
select * from employee where dno = 10;

-- ����(���ڿ� ��ȸ�� �� ��ҹ��� ����)
select * from employee where ename ='SCOTT';

-- ��¥
select * from employee where hiredate <= '1981/01/01';

-- ���� and
select * from employee where dno = 10 and job = 'MANAGER'; 

-- ���� or
select * from employee where dno = 10 or job = 'MANAGER';

select * from employee where commission = 300 or commission = 500 or commission = 1400;

-- ���� not
select * from employee where not dno = 10;

select * from employee where dno ^=10;

-- ���ǹ���
select * from employee where salary <1000 or salary > 1500;

-- between
select * from employee where salary between 1000 and 1500;

-- 1982�⿡ �Ի��� ���
select * from employee where hiredate between '1982/01/01' and '1982/12/31';

-- 3���� ���� ��� �����ϸ� ���
select * from employee where commission <> 300 and commission <> 500 and commission <> 1400 and commission is not null; 

-- in ()���� ���ǿ� �ش��ϴ� ��� ���
select * from employee where commission in (300,500,1400);

-- like % ���ڿ����� '?%' ?���ڷ� �����ϴ� ���� ���
select * from employee where ename like 'F%';

-- like % ���ڿ����� '%?%' ?���ڰ� �� ���� ���
select * from employee where ename like 'F%';

-- like % ���ڿ����� '%?' ?���ڷ� ������ ���� ���
select * from employee where ename like 'F%';

-- like _ ? %  �� �ձ��ڿ��� �ѱ��� �ڿ� �ش�ܾ �� ��� �� ���
select * from employee where ename like '_A%';

-- is null  ���� null�̸� ��� ���
select * from employee where commission is null;

-- is not null  ���� null �� �ƴ� ��� �� ���
select * from employee where commission is not null;

-- order by(������ ����)
select * from employee order by salary;

-- order by(������ ����)  asc(��������)
select * from employee order by salary asc;

-- order by(������ ����)  desc(��������)
select * from employee order by salary desc;

-- order by(������ ����) 
select * from employee order by salary desc, ename asc;

-- ��� ������ �޿� $300 �λ� �� ���
select ename, salary "����޿�", salary + 300 "�λ��ı޿�" from employee;

-- �����, �޿�, ���� �Ѽ���(���޿�*12 +100) ��� ������ ���� �������
select ename, salary, salary*12 + 100 from employee order by salary*12 + 100 desc;

-- �޿��� 2000�� �Ѵ� ����� �̸���, �޿� ��������
select ename, salary from employee where salary > 2000 order by salary desc ;

-- �����ȣ�� 7788�����, �μ���ȣ
select ename, dno from employee where eno = 7788;

-- �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿�
select ename, salary from employee where salary not between 2000 and 3000;

-- 1981�� 2/20~1981�� 5/1 ���� �Ի��� ��� �̸�, ������,�Ի���
select ename, job, hiredate from employee where hiredate 
between '1981/02/20' and '1981/05/01';

-- �μ� ��ȣ�� 20 �� 30�� ���� ���, �̸���������, �����ڼ�
select ename, dno from employee where dno in(20,30) order by ename desc;

-- �޿��� 2000~3000, �μ���ȣ 20~30
select ename, salary, dno from employee where salary
between 2000 and 3000 and dno in(20,30) order by ename;

-- 1981�� �Ի��� ���(like)
select ename, hiredate from employee where hiredate like '81%';

-- �����ڰ� ���� ��� manager is null
select ename, job from employee where manager is null;

-- Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼����, �޿� ��������, Ŀ�̼� ��������
select ename, salary, commission from employee where commission is not null
order by salary, commission desc;

-- �̸��� �� ��° ���ڰ� R�� ���
select * from employee where ename like '__R%';

-- �̸��� A�� E�� ��� �����ϴ� ���
select * from employee where ename like '%A%' and ename like '%E%';

-- �������� {���(CLERK),  �������(SALESMAN)} �̸鼭 �޿��� $1600, $950, $1300�� �ƴ� ���
select * from employee where job in('CLERK','SALESMAN') and salary not in(1600, 950, 1300);

-- Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼�
select ename, salary, commission from employee where commission >= 500;

