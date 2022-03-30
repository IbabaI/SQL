select empno, ename from emp;

-- 사칙연산
select sal + 300 from emp;  -- sal 값에 +300
select sal - 300 from emp;
select sal * 300 from emp;
select round(sal / 300) from emp;

select ename, sal, sal*12 from emp;

select ename, sal, job, deptno, comm from emp;

select ename, sal, job, deptno, comm, sal*12, sal*12+comm from emp;

select ename, sal, job, deptno, nvl(comm,0), sal*12, sal*12+nvl(comm,0) "연 봉" from emp;

--날짜
select sysdate from dual;

commit;