--join
--두 개 이상의 테이블을 하나의 테이블로 만들어 한 번의 검색으로 여러 컬럼의 정보를 확인할 때 사용함
select * from emp;
select * from dept;


--select 컬럼명 --
-- from 테이블명 별칭 [Inner] join 테이블명 별칭
-- on 별칭, 컬럼명 = 별칭, 컬럼명

select empno, ename, job, d.deptno, loc -- 테이블명.필드명 호출
from emp e, dept d
where e.deptno = d.deptno;

select empno, ename, job, d.deptno, loc -- 테이블명.필드명 호출
from emp e join dept d   --inner join : 양쪽이 일치한 것 출력
on e.deptno = d.deptno;  
-- join on 사용
 ______________________________________________________________
 --left join: 왼쪽에 있는 데이터는 모두 출력, 오른쪽 일치하는 데이터만
select empno, ename, job, d.deptno, loc 
from emp e left outer join dept d    --left join
on e.deptno = d.deptno; 

 --right join: 오른쪽에 있는 데이터는 모두 출력, 왼쪽 일치하는 데이터만
select empno, ename, job, d.deptno, loc 
from emp e right outer join dept d    --right join
on e.deptno = d.deptno; 
 
select empno, ename, job, d.deptno, loc 
from dept d right outer join emp e   --right join
on d.deptno =  e.deptno;
 
 desc emp;
 insert into emp(empno, ename, sal) values(100, '김연아', 1000);
 select * from emp;
 
select e.ename, e.job, e.mgr from emp e, emp d
where d.empno = e.mgr and d.ename = 'KING';

--문제1. 교수 이름, 직위, 학과 코드, 교수코드, 학생이름, 학번, 학년, 주전공, 학과
--inner join
select p.name, p.position, p.deptno, p.profno,
s.name, s.studno, s.grade, s.deptno1
from professor p join student s
on p.deptno = s.deptno1;

--left outer join
select p.name, p.position, p.deptno, p.profno,
s.name, s.studno, s.grade, s.deptno1
from professor p left outer join student s
on p.profno = s.profno;

--right outer join
select p.name, p.position, p.deptno, p.profno,
s.name, s.studno, s.grade, s.deptno1
from professor p right outer join student s
on p.profno = s.profno;
________________________________________________________________________________

--여러 개의 테이블 (3개 이상) 조인
--select 컬럼명, ...
-- from 테이블명 별칭 [inner] join 테이블명 별칭
-- on 별칭.컬럼명 = 별칭.컬럼명[inner]join 테이블명 별칭
-- on 별칭.컬럼명 = 별칭.컬럼명
select  p.profno, p.name, s.studno, s.name, s.grade, d.dname
from professor p join student s
on p.profno = s.profno join department d
on s.deptno1 = d.deptno;

--left, right 함께 o
select  p.profno, p.name, s.studno, s.name, s.grade, d.dname
from professor p  left join student s
on p.profno = s.profno right join department d
on s.deptno1 = d.deptno;
select * from dept;
select * from emp;
--사원 이름, 부서 이름, 직책, 매니저 번호 출력 emp.dept 테이블 이용
 
select e.ename, d.dname, e.job, e.mgr 
from emp e join dept d
on e.deptno = d.deptno;

--self join
select e.empno, e.job, em.mgr 담당관리자, em.ename 관리자명
from emp e join emp em
on e.mgr = em.empno;

--테이블 복사 / 레코드 복사 ---------------------------------------------
/*
create table 테이블이름
as
복사할테이블내용
*/
select * from c_empAll;
desc emp;
select * from all_constraints   --사용자가 갖고 있는 전체 제약조건 추출
where table_name = 'EMP';       --조건에 따른 테이블의 제약조건만 확인 (대소문자 구분)

create table c_empAll
as select * from emp;           --wpdirwhrjs
desc emp;

select * from emp where deptno=20;
create table c_emp_20 as select * from emp where deptno=20; --조건 걸어서 복사
select * from c_emp_20;

select * from emp where deptno = 30;
create table c_emp_30
as select empno 사번, ename 사원명, job 직책, sal 급여
from emp where deptno = 30;

select * from c_emp_30;

--교수테이블에서 전임강사만 뽑아서 테이블 생성하기
select * from professor where position = '전임강사';
create table c_professor_p as select * from professor where position = '전임강사';
select * from c_professor_p;

--emp 테이블에서 mgr가 7566번인 사람 추출해서 테이블 생성
select * from emp where mgr = 7566;
create table c_emp_m as select * from emp where mgr = 7566;
select * from c_emp_m;

--형식> 구조물만 복사하길 원할 때
--create table 테이블명 as select 필드명... from 테이블명 where1=0 -- 조건 거짓
create table c_emp4 
    as select * from emp where 1 = 0;  --뼈대만 복사--
select * from c_emp4


--원하는 필드만 뽑아오기
create table c_emp5
as select empno, ename, job, sal from emp;

select * from c_empAll;  -- 전체 복사
select * from c_emp_20;  -- 조건에 맍게 복사
select * from c_emp_30;  -- 조건 적용, 별칭
select * from c_emp4;    -- 구조물만 복사, 레코드 없음
select * from c_emp5;    -- 원하는 필드에 해당하는 레코드 방식
________________________________________________________________________________
--Union
--pk, fk 상태가 아닌 상태 테이블 합치기
select * from emp
union      --중복 행 제거
    select * from c_empAll;

select * from emp
union all  --중복 레코드 포함
    select * from c_empAll;
    
insert into c_empAll values(7788, 'kingsmile', 'manager', 7566, '2202/01/17' , 5000, 1000, 30);


select empno, ename, job, sal from emp -- 필드 개수를 맞춰야 출력된다.
-- select empno, ename, job, hiredate from emp --데이터타입도 일치해야
union      
    select * from c_emp5;
    
--검색 !!! 쿼리문은 대소문자 구분 안함. 단 체코드는 대소문자 구분함
select * 
from c_empAll
--where job = 'MANAGER' or job = 'manager';
where job in('MANAGER', 'manager';

select empno 사원번호, ename 이름, sal 급여
from emp
where ename = 'FORD';

select empno 사원번호, ename 이름, sal 급여
from emp
 -- where 이름 = 'FORD'; -- 별칭으로 조건 안 됨
order by 급여 desc;      -- 별칭으로 정렬은 된다

--문제1] c_emp_20 c_emp4 union 결과
select * from c_emp_20
    UNION
    select * from c_emp4;
--문제2] 사원번호, 이름, 급여 그리고 15% 인상된 급여를 정수로 표시하되 컬럼명을 New Salary
select * from emp;
select empno, ename, sal, (sal*1.5) "New Salary" from emp;
--문제3] 2번 문제와 동일한 데이터에서 급여 인상분 
--      (새 급여에서 이전 급여를 뺀 값을 추가해 출력 컬럼명 increase)
select empno, ename, sal, (sal*1.5) "New Salary", (sal*1.5)-sal "increase" from emp;

--문제4] 각 사원의 이름을 표시하고 근무 달수를 계산하여
-- 컬럼명을 Months_Works로 지정하고 근무 달수를 기준으로 오래된 사람부터 정렬해 출력
select * from emp;
select ename, hiredate, 
ROUND(MONTHS_BETWEEN(sysdate, hiredate)) Months_Works 
from emp
order by Months_Works  desc ;


--문제5] 사원의 이름과 커미션을 출력하되 커미션이 책정되지 않은 사원의 커미션은 
--'no commission'으로 출력
select ename,DECODE(comm, NULL, 'no commission', comm) AS comm 
from emp;
where