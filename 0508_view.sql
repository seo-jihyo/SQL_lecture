--View---------------------------------------
/*형식
생성
create or replace view 뷰이름 as 뷰 내용
삭제
drop view 이름
*/
select * from emp;
create or replace view v_emp
as select empno, ename, deptno from emp;

select * from v_emp;
drop view v_emp

-- emp 테이블 제거하면 v_emp 제거 O 
-- v_emp 테이블 제거하면 emp 제거 X

create or replace view v_student_join
as 
    select p.profno, p.name as "교수이름", p.position,
        s.studno, s.name "학생성명", s.grade, d.dname, p.deptno
        from professor p join student s 
         on p.profno = s.profno join department d
         on s.deptno1 = d.deptno;
         
select * from v_student_join;

________________________________________________________________________________
--문제
--문제10] 30번 부서 사원들의 직위, 이름, 월급을 담은 view 테이블 만들기 (emp)
create or replace view v_emp_1
as 
select job, ename, sal from emp where deptno = 30;
select * from emp;
--문제11] 30번 부서 사원들의 직위, 이름, 월급을 담은 view 테이블 만드는데,
--    컬럼명을 직위, 사원이름, 급여로 Alias를 주고 월급이 2000보다 많은 사원들만 추출한다
create or replace view v_emp2
as 
select job 직위, ename 사원이름, sal 급여 from emp where deptno = 30
where sal >= 2000 

--문제12] 부서별 최대급여, 최소급여, 평균급여를 갖는 view 만드시오
create or replace ciew v_emp3
as
select deptno 부서, max(sal) 최대급여, min(sal) 최소급여, round(avg(sal)) 평균
from emp group by deptno;
--문제13] 부서별 평균급여를 갖는 view 만드는데, 평균급여가 2000이상인 부서만 출력하세요.
create or replace view v_emp4
as
select detpno 부서, round(avg(sal)) 평균 
from emp group by deptno having avg(sal) = 32000;
--문제14]직위별 총급여를 구하는 view 테이블 만드는데, 직위(job)가 manager인 사원들은 제외하고
--    총급여가 3000 이상인 직원들만 저장한 테이블 만들기
create or replace view v_emp_5
as
select deptno 부서, sum(sal) "총 급여" from emp where job != 'manager' group by job having sum(sal) >= 3000;
--문제15]학생 테이블에서 학년별 평균 키와 몸무게가 키는 165 이상이고,
--    몸무게는 60이상인 사람들만 출력하는 뷰 테이블 만들기
create or replace view v_stu_6
as
select grade 학년, round(avg(height)) 키, round(avg(weight)) 몸무게 
from studnet where height >= 165 and weight >= 60 group by grade;
--문제16]교수테이블에서 전임강사 들만 있는 가상 테이블 만들기
create or replace view v_pro_7
as
select * from professor where position = '전임강사';

-------------------------------------------------------------------------------
--제약조건 확인 ( 테이블 & 컬럼) 및 제약조건 제거
select * 
    from all_constraints        -- 모든 계정의 모든 제약조건 확인
    where Table_name='C_EMPALL';     -- 데이터 딕셔너리에는 대문자, 해당 테이블의 제약조건 확인
------------------------------------------------------------------
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'C_EMPALL';  -- COPY한 테이블은 제약조건 복사되지 않는다.
----------------------------------------------------------------------
--제약조건 제거
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명 CASCADE;
--ex) 
alter table emp drop constraint pk_emp cascade;

alter table dept drop constraint pk_dept;

--pk 생성
alter table '테이블명' add constraint 제약조건명 primary key (컬럼1, 컬럼2);
alter table dept add (constraint pk_dept primary key (deptno));  --테이블명_필드명_성격(ok,fk, un, ck..)

select * from all_constraints
where Table_name='c_empall';

alter table c_empall add (constraint empno_pk primary key (empno));
alter table c_empall add constraint pk_empall primary key (empno);
select * from emp;

update c_empall set empno = 7799 where ename = 'kingsmile';
select * from c_empall;

-- num_day 필드에 primary key 걸어주기 
altdr table cal
add (constraint cal_num_pk primary key (NUM_DAY)

--레코드복사
--insert 할 때 레코드를 다른 테이블에서 가져와서 삽입하기
/*형식
insert into 테이블이름
select 컬럼명, ... from 테이블이름
*/

select * from c_emp4;

create table c_emp5
as select ename, empno, hiredate from emp where 1 = 0; --조건에 맞지 않은 형태

select * from c_emp5;

insert into c_emp5
-- 1.select * from emp2; -- 레코드 수가 맞지 않아서 에러/ 필드 개수와 데이터 타입, 크기가 맞아야 함
-- 2.select emp_type, pay, birthday from emp2; : 데이터 타입은 맞지만 크기가 맞지 않음
desc emp2;
desc c_emp5; -- 크기 확인
alter table c_emp5 modify ename varchar2(16);
alter table c_emp5 modify empno number(16);
commit;


--4,5,10장 실습
