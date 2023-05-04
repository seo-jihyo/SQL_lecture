--SubQuery

select * from emp2;
select pay from emp2 where name = '백원만';

--둘은 같은 결과이다.--
select * from emp2 where pay > 60000000;
select * from emp2 where pay > (select pay from emp2 where name = '백원만');

--평균 구하기와 평균보다 낮은 급여를 가진 사람 구하기
select avg(pay) from emp2;
select * from emp2 where pay < (select avg(pay) from emp2) order by pay desc;

--문제1] student 테이블과 department 테이블을 사용해 이윤나 학생과 전공(deptno1)dl
--      동일한 학생들의 이름과 전공 이름을 출력하세요
select name, deptno1 from student 
where deptno1 = (select deptno1 from student where name = '이윤나');


--문제2] 교수테이블에서 입사일 송도권 교수보다 나중에 입사한 사람의 입사일, 학과명을 출력하세요
select * from professor where name = '송도권';
select name, hiredate, deptno from professor 
where hiredate > (select hiredate from professor where name = '송도권') order by hiredate ;

select p.name, p.hiredate, d.name
from professor p, department d
where p.hiredate > (select hiredate from professor where name = '송도권')
and p.deptno = d.dpetno;

--문제3] 학생테이블에서 전공1이 101인 학과의 평균 몸무게보다 많이 나가는 학생들의 몸무게를 출력하세요
select avg(weight) from student where deptno1 = 101;
select name, weight from student 
where weight > (select avg(weight) from student where deptno1 = 101);


--문제4] emp2 테이블을 사용하여 전체 직원 중 과장 직급의 최소 연봉자보다 연봉이 높은 사람의 이름과 직급, 연봉을 출력하세요.
--단, 연봉 출력 형식은 천 단위 구분기호(,)와 원 표시까지해서 출력하기
select name, position, to_char(pay, '999,999,999') 연봉 from emp2 
where pay > (select min(pay) from emp2 where position = '과장');


--문제5]student 테이블을 조회하여 전체 학생 중에서 체중이 4학년 학생들의 체중에서 가장 적게 나가는 
--학생보다 적은 학생의 이름과 학년과 몸무게를 출력.
select * from student where grade = 4;
select name, grade, weight from student
where weight < all (select weight from student where grade = 4);


--문제6]student 테이블을 조회하여 각 학년별로 최대 키를 가진 학생들의 학년과 이름과 키를 출력.
select name, grade, height from student
where (grade, height) in (select grade, max(height) from student group by grade);


--문제7]professor 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 입사일, 학과명을 출력. 
-- 단, 학과명순으로 오름차순 정렬.
select * from professor;
select profno, name, hiredate, deptno from professor p, department d
where p.deptno = d.deptno and (p.deptno, p.hiredate)
in(select deptno, min


--문제8]Emp2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요. 
--연봉순으로 오름차순 정렬하세요.
select name, position, pay from emp2 order by pay desc;
select position, pay from emp2
where  pay in (select max(pay) from emp2 group by position) order by pay;


--문제9]emp2 평균 급여보다 작은 사람 출력하세요.
select avg(pay) from emp2;
select name, pay from emp2 where pay < (select avg(pay) from emp2);