select empno, ename from emp;

-- ��Ģ����
select sal + 300 from emp;  -- sal ���� +300
select sal - 300 from emp;
select sal * 300 from emp;
select round(sal / 300) from emp;

select ename, sal, sal*12 from emp;

select ename, sal, job, deptno, comm from emp;

select ename, sal, job, deptno, comm, sal*12, sal*12+comm from emp;

select ename, sal, job, deptno, nvl(comm,0), sal*12, sal*12+nvl(comm,0) "�� ��" from emp;

--��¥
select sysdate from dual;

commit;