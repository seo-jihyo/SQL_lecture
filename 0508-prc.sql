 -- professor 테이블의 profno, name, email, hpage 컬럼만 사용하는 View 를 생성하세요. 
 --View 이름은 v_prof 로 하세요.

create or replace view v_prof
as
select profno, name, email, hpage
from professor;

--Professor 테이블과 department 테이블을 조인하여 교수번호와 교수이름과 소속 학과이름을 
--조회하는 view 를 생성하세요. View 이름은 v_prof_dept2 로 하세요.

create or replace view v_prof_dept
as
    select p.profno "교수번호"
    , p.name "교수명"
    , d.dname "소속학과명"
    from professor p, department p
    where deptno = d.deptno;

--Student 테이블과 department 테이블을 사용하여 학과별로 학생들의 최대 키와 최대 몸무게, 학과이름을 
--출력하세요.

select d.dname "학과명"
    s.max_height "최대키"
    s.max_weight "최대몸무게")
from (select deptno1, max_height,max(weight) max_weight from student;

select count(*) from professor where deptno in(dept i102li;

select count(*) from my_prof;