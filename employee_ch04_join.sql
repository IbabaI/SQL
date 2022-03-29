--join
--equi(동등) 조인  Inner Join =
select * from employee, department
    where employee.dno = department.dno;

-- 사원번호, 사원이름, 소속부서 이름 출력
select eno, ename, dname from employee, department
    where employee.dno = department.dno;
    
--칼럼 앞에 테이블명 명시
select employee.eno, employee.ename, department.dname, employee.dno
    from employee, department
    where employee.dno = department.dno;

select eno, ename, dname, employee.dno
    from employee, department
    where employee.dno = department.dno;


--equi join -natural join 등가 조인하는 방법
-- natural join에 사용되는 공통칼럼은 테이블명을 사용할수 없음.
-- join칼럼을 찾어서 조인해 줌
select e.eno, e.ename, d.dname, dno
    from employee e natural join department d
    where e.eno=7788;

-- join ~using 
-- 두 개의 테이블이 내부 조인으로 조인 될 때 조인하고자 하는 두 테이블의 컬럼명이 같을 경우
-- 조인 조건을 길게 적지 않고 간단하게 적을 수 있도록 하는 역할
select e.eno, e.ename, d.dname, dno
    from employee e join department d using(dno)
    where e.eno = 7788;

-- join ~on
-- ON 절을 이용한 조인 표현법은 임의의 조인 조건을 지정하는 방법
-- 일반적인 모든 형태의 조인을 표현할 수 있다.
select e.eno, e.ename, d.dname, e.dno -- on 사용시 테이블명.칼럼명
    from employee e join department d on e.dno=d.dno
    where e.eno=7788;
 
 -- NON-EQUI JOIN
 --급여 등급 테이블
select * from salgrade;
 
 -- 81/02/20 ~ 81/05/01사이 입사한 사원 출력
select * from employee  
    where  hiredate between '81/02/20' and '81/05/01'
    order by hiredate ;

select ename, salary, grade from employee, salgrade
    where salary between losal and hisal;

--self join
--
select employees.ename as "사원이름", manager.ename as "직속상관이름"
    from employee employees, employee manager
    where employees.manager = manager.eno;

-- outer join (+)
select employees.ename || '의 직속 상관은 '|| nvl(manager.ename,'없다')
    from employee employees, employee manager
    where employees.manager = manager.eno(+);

--ansi outer join
select employees.ename || '의 직속 상관은 '|| nvl(manager.ename,'없다')
from employee employees left outer join employee manager
  on  employees.manager = manager.eno(+);
  
  --확인
  --1. eui조인 scott사원의 부서번호 부서이름 출력
  select ename, employee.dno, dname
   from employee, department
   where employee.dno = department.dno
   ;
   
--2. inner join on, 사원이름과 그 사원이 소속된 부서이름 과 지역명   
  select ename, employee.dno, dname, loc
   from employee join  department
   on employee.dno = department.dno
   ;
   
--3. inner join using 10번 부서에 속하는 모든 담당자 업무의 고유 목록 부서의 지역명 포함하여 출력
select dno, job, loc
 from employee join department using(dno)
 where dno=10
 ;
 
 -- 4. natural join  커미션을 받는 사원의 이름, 부서이름, 지역명 출력
 select ename, dname, loc
  from employee natural join department
  where commission is not null
  ;
   
--5. equi조인 Wildcard A가 포함된 사원의 이름과 부서명
select ename, dname
 from employee, department
where ename like '%A%';
   
   
--6. natural join New york 근무하는 사원들 
select ename, job, dno, dname
 from employee natural join department
 where loc=upper('new york')
 ;


--7. self join, 동일 테이블 사이의 조인
select emp.ename as Employee, emp.manager as "Emp#", mgr.dno manager, mgr.ename "mgr#"
 from employee emp, employee mgr
 where emp.manager=mgr.eno
 ;
 
 --8. outer join, self join
 
select emp.ename as Employee, emp.manager as "Emp#", mgr.dno manager, mgr.ename "mgr#"
 from employee emp, employee mgr
 where emp.manager=mgr.eno(+)
 ;
 
 --9. self join 동일부서 근무하는 사원 출력  'scott'
select * from employee;
select me.ename as 이름, me.dno as 부서번호, other.ename as 동료
  from employee me, employee other
 where me.dno = other.dno
   and me.ename =upper('scott')
   and other.ename != upper('scott')
 ;

 --10. self join ward보다 늦게 입사한 사원 이름과 입사일자
 select other.ename, other.hiredate
  from employee ward, employee other
where other.hiredate > ward.hiredate
  and ward.ename = upper('ward')
  ;
  
--11. self join 관리자보다 먼저 입사한 모든 사원 이름 및 입사일자 
 select other.ename, other.hiredate, mgr.ename, mgr.hiredate
  from employee mgr, employee other
where other.hiredate <= mgr.hiredate
  and  other.manager = mgr.eno
  ;









    