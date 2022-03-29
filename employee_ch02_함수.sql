-- 문자함수
select 'Oracle mania',          
        upper('Oracle mania'),      -- 소문자
        lower('Oracle mania'),      -- 대문자
        initcap('Oracle mania')     -- 첫글자 대문자
from dual;

select ename, lower(ename), job, initcap(job) from employee;

-- 조회할 때
select ENO, ename, dno from employee where ENAME = upper('scott');

select ENO, ename, dno from EMPLOYEE where lower(ename) = 'scott'; --칼럼내의 값들이 소문자로 변환됨.

select ENO, ename, dno from EMPLOYEE where initCap(ename) = 'Scott';

-- 문자열 길이 length, lengthb
select length('Oracle mania'), length('오라클매니아') from dual;

select lengthb('Oracle mania'), lengthb('오라클매니아') from dual;

-- 문자열 조작함수
select substr('Oracle mania', 4,3),  --index 4, 개수 3 
        substr('Oracle mania', -4,3)  -- 음수(-)이면 뒤에서 부터 index시작
from dual;

--이름이 N으로 끝나는 사원
select * from employee where ename like '%N'; 
  
select * from employee where substr(ename,-1,1)='N';
 
--87년도 입사한 사원
select * from employee where substr(hiredate,1,2)='87';

--문자열 추출하기
select substr('Oracle mania',4,3), substrb('Oracle mania',4,3), 
       substr('오라클매니아',3,4),
       substrb('오라클매니아',3,4) --3바이트씩 한글자, 000,000,000
  from dual;


--instr(대상, 찾을 글자, 시작위치, 발견된 순서)
select instr('Oracle mania', 'a') from dual;
select instr('Oracle mania', 'a',5, 2) from dual;

select instr('오라클매니아','라'), instrb('오라클매니아','라') from dual; --000000

--세번째 자리가 'R'인 사원 
select * from employee where instr(ename, 'R',3,1) =3; -- 00R
select * from employee where ename like '__R%';

-- lpad(), rpad()
select lpad(salary, 10, '*') from employee;
select rpad(salary, 10, '*') from employee;

--trim 
select ' Oracle mania ', ltrim(' Oracle mania '), rtrim(' Oracle mania ') from dual;

--특정 문자 제거하기 - 특정문자가 첫 번째 문자이거나 마지막 문자인 경우 잘라내기
select 'Oracle mania', trim('O' from 'Oracle mania') from dual;



-- 숫자함수
select 98.7654, round(98.7654), round(98.7654,2), round(98.7654,-1) from dual;

select 98.7654, trunc(98.7654), trunc(98.7654,2), trunc(98.7654,-1) from dual;

--mod(값1,값2) 나머지
select mod(31,2), mod(31,5), mod(31,8) from dual;

-- 모든 사원의 급여를 500으로 나눈 나머지 값 계산
select ename, salary, mod(salary, 500) from employee;



--날짜 함수
---sysdate
select sysdate from dual;

--날짜연산
select sysdate -1 어제, sysdate 오늘, sysdate + 1 내일 from dual;

select sysdate, round(sysdate), --날짜 반올리
           round(sysdate,'cc'),  --세기 반올림
           round(sysdate, 'yyyy'),--년도 반올림
           to_char(round(sysdate,'hh'),'yyyymmdd hh:mi:ss'), --시간 반올림
           round(sysdate,'month'), --월 반올림
           round(sysdate, 'day'),--주 반올림
           round(sysdate, 'Q')--분기 반올림
           from dual;
           
--근무일수 계산하기
select * from employee;
select round(sysdate - hiredate) 근무일수 from employee;

--특정날짜에서 월 기준 버림
select hiredate, trunc(hiredate,'month') from employee;

--월수 계산
-- 각 사원들의 근무 개월 수
select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) -- 두날짜 사이의 개월수 (날짜1,날짜2)
from employee;

-- 날짜 - 월더하기 
--입사한지 6개월 지난날짜 구하기
select ename, hiredate, add_months(hiredate,6) from employee;

-- 해당날짜 기준으로 최초로 도래하는 요일에 해당하는 날자 구하기  next_day()
--오늘을 기준으로 최초로 도래하는 토요일 구하기
select sysdate, next_day(sysdate,'수요일') from dual;

-- 해당날짜가 속한 달의 마지막 날짜  last_day(날짜)
--입사한 달의 마지막 날 구하기
select ename, hiredate, last_day(hiredate) from employee;


-- 변환함수
-- to_char()함수
select ename, hiredate, to_char(hiredate, 'yy-mm'), to_char(hiredate,'yyyy/mm/dd day') from employee;

-- 시간 출력
--현재의 날짜 시간 출력
select sysdate, to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;

--통화  to_char(값, format) - 'L숫자' 지역 통화표시
select ename, salary, to_char(salary, 'L999,999') from employee;

-- 문자열 ->날짜, to_date(문자열, format)
--1981년 02월 20일 입사한 사원 얻기
select ename, hiredate 
 from employee
where hiredate = to_date(to_char(19810220),'yyyymmdd');
--select * from employee;

-- 데이터를 숫자형으로 변환 to_number
select '100,000' - '50,000' from dual;

-- to_number('숫자형 문자열',format)
select to_number('100,000','999,999') - to_number('50,000','999,999') from dual; -- to_number('문자열'), to_number('문자열',format)




--일반함수
--nvl(expr,대체표현)
select ename, salary, commission, nvl(commission,0), salary*12+nvl(commission,0) from employee order by job;

--nvl2(expr1,expr2,expr3) 
--expr1이 null이면 expr3, null이 아니면 expr2
select ename, salary, commission, nvl(commission,0), nvl2(commission, salary*12+commission, salary*12) 
from employee order by job;

-- nullif(a,b)  -- a와 b가 같으면 null, 다르면 a출력
select nullif('a','a'), nullif('a','b') from dual;

--coalesce함수 --최초로 null이 아닌값 출력
select ename, salary, commission, 
        coalesce(commission, salary, 0) -- commission이 null아니면 commission, null이면 salary값, salary값도 null이면 0
 from employee
order by job;

--decode함수 
select ename, emp.dno, dname from employee emp, department dept where emp.dno=dept.dno;

-- decode로 부서명 출력
select  ename, dno, 
         decode(dno,10,'ACCOUNTING',
                         20,'RESEARCH',
                         30,'SALES',
                         40,'OPERATIONS', 
                         'DEFAULT') as dname
 from employee;
         
-- case 문
-- case when 식 then 값, when 식 then 값2,... else 값 end as 칼럼명
select ename, dno,
        CASE when dno=10 THEN 'ACCOUNTING'
                when dno=20 then 'RESEARCH'
                when dno=30 then 'SALES'
                when dno=40 then 'OPERATIONS'
                else 'DEFAULT'  
                end  as dname
  from employee;

-- case 칼럼 when 값1 then 식 when  값2 then 식.... else 값 end as 칼럼명
select ename, dno,
        CASE dno when 10 THEN 'ACCOUNTING'
                      when 20 then 'RESEARCH'
                      when 30 then 'SALES'
                      when 40 then 'OPERATIONS'
                       else 'DEFAULT'  
                      end  as dname
  from employee;

--- 확인 문제
--1. substr함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력
select * from employee;
select substr(hiredate,1,2) 년도, substr(hiredate,4,2) 달, substr(hiredate,7,2) 일 from employee;

--2. substr함수를 사용하영 4월에 입사한 사원 출력
select * from employee where substr(hiredate, 4,2)='04';

--3. mod함수를 사용하여 사원번호가 짝수인 사람만 출력
select * 
  from employee
  where mod(eno,2)=0;
  
--4. 입사일을 연도 2자리,월은 숫자로 표현, 요일은 약어(dy)로 표현
select to_char(hiredate,'yy') , to_char(hiredate,'mon'), to_char(hiredate,'dy') 
 from employee;
 
 --5. 올해 며칠 지났는지 확ㅇ니 
select trunc(sysdate - to_date('2021/01/01','yyyy/mm/dd')) from dual;
select to_char(sysdate,'ddd') from dual; 

--6. 사원들의 상관 사번출력 상관이 없는 사원 null값 대신 0출력
select eno, ename, nvl2(manager, manager, 0) as manager from employee; 

--7.decode 함수로 직급에 따라 급여 인상,  'ANALYST' 200, 'SALESMAN' 180,  MANAGER 150, CLERK 100 
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






