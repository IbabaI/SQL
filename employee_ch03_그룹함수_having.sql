-- 그룹함수
select sum(salary), avg(salary), max(salary), min(salary) from employee;

--sum()함수는 null값 제외하고 집계
select sum(commission) from employee;

--count()
select count(*) as "사원 수" from employee;

-- 커미션을 받는 사원 수
select count(commission) as "커미션을 받는 사원 수" from employee;

--직업의 종류 구하기
select count(distinct job) from employee;

--그룹함수 오류
--ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
--00937. 00000 -  "not a single-group group function"
select ename, max(salary) from employee;

--소속부서별 평균 급여를 부서번호화 함께 출력
select dno as "부서 번호", avg(salary) as "급여 평균"
    from employee group by dno;

-- 소속부서별 평균 급여를 부서번호 부서명과 함께 출력
select department.dno as "부서번호",  min(dname),  avg(salary) as "급여 평균"
 from employee, department 
 where employee.dno = department.dno
 group by department.dno;



-- having
-- 부서별 급여 총액 3000 이상인 부서의 번호와 부서별 급여 총액
select dno, sum(salary) from employee group by dno having sum(salary) >= 3000;

-- 급여가 1000이상인 사원들의 부서별(deptno) 평균 급여를 출력
-- 단, 부서별 평균 급여가 2000이상인 부서만 출력
select dno, avg(salary) 
    from employee where sal >= 1000 
    group by dno 
    having avg(salary) >= 2000;
    
select empno, ename, deptno, dname
    from emp e, dept d
    where e.deptno = d.deptno(+)
    and empno like '1%';


-- manager를 제외하고 급여 총액 5000이상인 직급별 급여 총액 구하기
select job, sum(salary) total
    from employee
    where job <> 'manager'
    group by job
    having sum(salary) >=5000;

--최고 급여 출력
select max(salary) from employee;

--확인
--1.모든 사원의 급여 최고액, 최저액, 총액, 평균
select max(salary) as maxSalary,
         min(salary) as minSalary,
         sum(salary) as sumSalary,
         avg(salary) as avgSalary
from employee;

--2. 각 담당 업무 유형별 급여 최고액, 최저액, 총액, 평균
select job, max(salary) as maxSalary,
         min(salary) as minSalary,
         sum(salary) as sumSalary,
         avg(salary) as avgSalary
from employee
group by job;

--3. count(*) 함수를 이용 담당 업무가 동일한 사원수 출력
select job, count(*)
  from employee
  group by job;
  
  
--4. 관리자 수를 나열하시오. 
select count(distinct manager) from employee;

select a.eno, a.ename, a.manager, b.ename
  from employee a, employee b
  where a.manager = b.eno;



--5. 급여최고액, 최저액의 차액, 
select max(salary), min(salary), max(salary) - min(salary)
  from employee;
 
-- 6. 직급별 사원의 최저 급여, 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외
-- 급여에 대한 내림차순 정렬
select job, min(salary) from employee where manager is not null
    group by job having min(salary) >=2000 order by min(salary) desc;
    
--7. 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균 급여,
 select dno, count(*), round(avg(salary),2)
  from employee
  group by dno;

select * from department;
--8. 각 부서에 대한 부서번호, 부서 이름, 지역명, 사원수, 부서내 모든 사원의 평균 급여,
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


--9.업무를 표시 한 다음 해당 업무에 대해 부서별 급여 및 부서 10,20,30 의 급여 총액을 각각 출력하시오.
--job , 10, 20 ,30
select job, dno, 
        sum(salary) "총액",
        decode(dno, 10,sum(salary)) as "부서 10", 
        decode(dno, 20,sum(salary)) as "부서 20",
        decode(dno, 30,sum(salary)) as "부서 30",
        decode(dno, 40,sum(salary)) as "부서 40" 
 from employee
 group by job, dno
 ;
 
select job, dno,
         sum(총액),
         sum("부서 10"),
         sum("부서 20"),
         sum("부서 30"),
         sum("부서 40")
 from      
 (select job, dno, 
        sum(salary) "총액",
        decode(dno, 10,sum(salary)) as "부서 10", 
        decode(dno, 20,sum(salary)) as "부서 20",
        decode(dno, 30,sum(salary)) as "부서 30",
        decode(dno, 40,sum(salary)) as "부서 40" 
 from employee
 group by job, dno
 )
 group by job, dno
 ;



