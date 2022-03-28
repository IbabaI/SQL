-- 숫자
select * from employee where dno = 10;

-- 문자(문자열 조회할 때 대소문자 구별)
select * from employee where ename ='SCOTT';

-- 날짜
select * from employee where hiredate <= '1981/01/01';

-- 조건 and
select * from employee where dno = 10 and job = 'MANAGER'; 

-- 조건 or
select * from employee where dno = 10 or job = 'MANAGER';

select * from employee where commission = 300 or commission = 500 or commission = 1400;

-- 조건 not
select * from employee where not dno = 10;

select * from employee where dno ^=10;

-- 조건범위
select * from employee where salary <1000 or salary > 1500;

-- between
select * from employee where salary between 1000 and 1500;

-- 1982년에 입사한 사람
select * from employee where hiredate between '1982/01/01' and '1982/12/31';

-- 3가지 조건 모두 만족하면 출력
select * from employee where commission <> 300 and commission <> 500 and commission <> 1400 and commission is not null; 

-- in ()안의 조건에 해당하는 사람 출력
select * from employee where commission in (300,500,1400);

-- like % 문자열에서 '?%' ?문자로 시작하는 모든것 출력
select * from employee where ename like 'F%';

-- like % 문자열에서 '%?%' ?문자가 들어간 모든것 출력
select * from employee where ename like 'F%';

-- like % 문자열에서 '%?' ?문자로 끝나는 모든것 출력
select * from employee where ename like 'F%';

-- like _ ? %  맨 앞글자에서 한글자 뒤에 해당단어가 들어간 모든 것 출력
select * from employee where ename like '_A%';

-- is null  값이 null이면 모두 출력
select * from employee where commission is null;

-- is not null  값이 null 이 아닌 모든 것 출력
select * from employee where commission is not null;

-- order by(정렬할 기준)
select * from employee order by salary;

-- order by(정렬할 기준)  asc(오름차순)
select * from employee order by salary asc;

-- order by(정렬할 기준)  desc(내림차순)
select * from employee order by salary desc;

-- order by(정렬할 기준) 
select * from employee order by salary desc, ename asc;

-- 모든 직원의 급여 $300 인상 후 계산
select ename, salary "현재급여", salary + 300 "인상후급여" from employee;

-- 사원명, 급여, 연간 총수입(월급여*12 +100) 출력 수입이 많은 사원부터
select ename, salary, salary*12 + 100 from employee order by salary*12 + 100 desc;

-- 급여가 2000이 넘는 사원의 이름과, 급여 내림차순
select ename, salary from employee where salary > 2000 order by salary desc ;

-- 사원번호가 7788사원명, 부서번호
select ename, dno from employee where eno = 7788;

-- 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여
select ename, salary from employee where salary not between 2000 and 3000;

-- 1981년 2/20~1981년 5/1 사이 입사한 사원 이름, 담당업무,입사일
select ename, job, hiredate from employee where hiredate 
between '1981/02/20' and '1981/05/01';

-- 부서 번호가 20 및 30에 속한 사원, 이름내림차순, 영문자순
select ename, dno from employee where dno in(20,30) order by ename desc;

-- 급여가 2000~3000, 부서번호 20~30
select ename, salary, dno from employee where salary
between 2000 and 3000 and dno in(20,30) order by ename;

-- 1981년 입사한 사원(like)
select ename, hiredate from employee where hiredate like '81%';

-- 관리자가 없는 사원 manager is null
select ename, job from employee where manager is null;

-- 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션출력, 급여 오름차순, 커미션 내림차순
select ename, salary, commission from employee where commission is not null
order by salary, commission desc;

-- 이름의 세 번째 문자가 R인 사원
select * from employee where ename like '__R%';

-- 이름에 A와 E를 모두 포함하는 사원
select * from employee where ename like '%A%' and ename like '%E%';

-- 담당업무가 {사원(CLERK),  영업사원(SALESMAN)} 이면서 급여가 $1600, $950, $1300이 아닌 사원
select * from employee where job in('CLERK','SALESMAN') and salary not in(1600, 950, 1300);

-- 커미션이 $500이상인 사원의 이름과 급여 및 커미션
select ename, salary, commission from employee where commission >= 500;

