--래코드 검색
/*select distinct | * | 컬럼명 as 별칭, 컬럼명 별칭,....
from 테이블이름
[where 조건식 ]
[order by 컬럼명 desc | asc , .. ]
*/
-- ORACLE에서는 NULL 이 우선순위가 높다
ORDER BY NAME ASC;   --오름차순 생략 가능
ORDER BY NAME DESC;  --내림차순 생략 불가능

SELECT * FROM EMP2
ORDER BY NAME, DEPTNO DESC, POSITION;

SELECT * FROM EMP2
ORDER BY 2,4 DESC, 9;  -- 필드 번호로 저장 가능

__________________________________
select * from emp2;
select name, empno, deptno, emp_type from emp2; --원하는 필드에 레코드만 검색
select name, empno, deptno --, emp_type 
    from emp2
    where emp_type='정규직';
    
select name, empno, deptno --, emp_type 
    from emp2
    where emp_type='정규직'
    order by name desc;  -- asc : 생략가능
    
select name, empno, deptno, emp_type 
    from emp2
    --where emp_type='정규직'
    order by name desc, deptno asc; 
    
select DISTINCT emp_type 
    from emp2;
  --  where emp_type='정규직';    
    
select DISTINCT deptno 
    from emp2;
    
select name, empno, deptno, emp_type, position
    from emp2
    where position='부장';
    
select name as "성   명", empno 사원번호, deptno "부    서", emp_type as 근무타입, position "직    급"
    from emp2
    where position='부장';
    

-- 직급이 부장이면서 이름이 유관순 --   
select name as "성   명", empno 사원번호, deptno "부    서", emp_type as 근무타입, position "직    급"
    from emp2
    where position='부장' or name='유관순';
 
 desc emp2;
 
select *
    from emp2
    where  deptno = 1000;

    
-- 연산자 -----------------------------------
SELECT MOD(7,3) FROM EMP2;
SELECT MOD(7,3) "나눈 결과" FROM DUAL;
_________________________________________
-- NVL 함수
SELECT * FROM PROFESSOR;

SELECT NAME, BONUS, POSITION
FROM PROFESSOR;

SELECT NAME, BONUS, POSITION
FROM PROFESSOR
WHERE BONUS IS NOT NULL;
--> NULL이 아닌 사람만 출력

SELECT NAME, BONUS, BONUS+100,POSITION
FROM PROFESSOR;
-- NULL 연산은 무조건 NULL값이 나옴

SELECT NAME, BONUS, NVL(BONUS,0)+100, POSITION
FROM PROFESSOR;
-- NULL을 0으로 대치한 후 계산한다.
_________________________________________________

SELECT * 
FROM PROFESSOR
WHERE POSITION='정교수' OR POSITION='조교수';

SELECT * 
FROM PROFESSOR
WHERE POSITION IN ('정교수', '조교수');


SELECT * 
FROM STUDENT
WHERE GRADE IN (3,4);
-- STUDENT 테이블에서 3,4학년만 출력하기

SELECT * 
FROM STUDENT
WHERE GRADE NOT IN (3,4);
-- STUDENT 테이블에서 3,4학년 제외하고 출력하기
__________________________________________________
--BETWEEN 연산자

SELECT * 
FROM PROFESSOR
WHERE DEPTNO BETWEEN 103 AND 201;
-- WHERE DEPTNO BETWEEN 201 AND 103; 은 출력되지 않으니 주의한다.
-- BETWEEN 작은값  AND  큰 값
__________________________________________________
--% / _
SELECT *
FROM EMP2
WHERE NAME LIKE '김%';
--김% : 김____(0자 이상)
--김__ : 김xx (2자 고정)

SELECT *
FROM EMP2
WHERE NAME LIKE '%정%';

--XXX정XXX 이름에 '정'이 있는 사람 모두 출력됨

SELECT *
FROM PROFESSOR
WHERE NAME LIKE '__';
-- 이름이 두 글자인 사람 (고정길이)

WHERE NAME LIKE '%원_';
--김원X 남궁원X  가능

__________________________________________________

SELECT * 
FROM PROFESSOR
WHERE PAY > 500;

SELECT * 
FROM PROFESSOR
WHERE PAY <= 300;
-- 300 이하

SELECT * 
FROM PROFESSOR
WHERE PAY >= 250 AND PAY < 500;
-- 250 <= PAY > 500


--문제--
--1 급여가 500이상이고, 보너스가 60이상 받는 교수는? (professor table)
SELECT * 
FROM PROFESSOR
WHERE PAY >= 500 AND BONUS >= 60;

--2 이름이 '나한라'을 '너한라'으로 변경 (emp2)
UPDATE EMP2
SET NAME = '너한라'
WHERE NAME = '나한라';
SELECT * FROM EMP2;

--3 취미가 등산인 사람들만 찾아서 '수영'으로 변경
UPDATE EMP2
SET HOBBY = '수영'
WHERE HOBBY = '등산';

--4 계약직 직원 찾아서 삭제하기
DELETE FROM EMP2
WHERE EMP_TYPE = '계약직'

--5 pay(or bonus)가 50이상인 사람만 출력 (professor )
SELECT * FROM  PROFESSOR
WHERE PAY >= 50 OR BONUS >= 50;

--6 ~세트가 아닌 상품들만 출력 ( gift table)
SELECT * FROM GIFT
WHERE GNAME NOT LIKE '%세트';

--7 gno가 10인 상품의 이름을 널처리(null) 하세요.
UPDATE GIFT
SET GNAME = NULL
WHERE GNO = 10;
SELECT * FROM GIFT;

--8  gname 이름이 없고, g_start가 999인 값을 갖는 데이터 입력하세요.
INSERT INTO GIFT(GNO, G_START, G_END) VALUES (11,999, 1000000);
 
--9 gname이 null이거나 ' ' 인 데이터를 제외하고 출력하시오.
SELECT * FROM GIFT
WHERE GNAME IS NOT NULL
AND GNAME != ' ';
-- NOT IN ('NULL', '') ORDER BY GNO DESC; NOT IN으로 간략하게 쓸 수 있다.

-- 정규직이면서 '백원만' 찾기
select * from emp2
where name = '백원만' and emp_type = '정규직';

--정규직이거나 '유도봉' 찾기
select * from emp2
where name= '유도봉' or emp_type = '정규직';

--수습직이거나 김씨 성을 가진 사람 찾기
select * from emp2
where emp_type = '수습직' or name like '김%';

--김씨가 아닌 수습직 찾기
select * from emp2
where emp_type = '수습직' and name not like '김%';
______________________________________________________________
 
 ANY : 최소값 보다 크다
 필드명(pay) >= ANY : 최소값보다 크거나 같으면   any( 300, 550, 400 )
  < ANY : 최대값보다 작으면
  <= ANY : 최대값보다 작거나 같으면
   = ANY : IN과 같은 효과
  != ANY : NOT IN과 같은 효과

select * from professor where pay >= any( 300, 550, 400 ); --300보다 월급이 큰 사람
select * from student where weight > any( 70, 80 );  -- 70보다 큰 것
select * from student where weight < any( 60, 70 );  --70보다 작은 것

ALL

ANY와는 반대되는 개념입니다.

  필드명(pay) > ALL : 최대값 보다 크면  all( 300, 550, 400 )
>= ALL : 최대값보다 크거나 같으면
< ALL : 최소값보다 작으면
<= ALL : 최소값보다 작거나 같으면
= ALL : SUBSELECT의 결과가 1건이면 상관없지만 여러 건이면 오류가 발생합니다.
!= ALL : 위와 마찬가지로 SUBSELECT의 결과가 여러 건이면 오류가 발생합니다
*/
select * from professor where pay >= all( 300, 550, 400 ); -- 550보다 큰 것
select * from student where weight > all( 70, 80 );  -- 80 보다 큰 것
select * from student where weight < all( 60, 70 ); -- 60보다 작은 것


--함수----------------------------------------------------------
-- 1. 집계 함수 (그룹 함수)---------------------------------------
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "최저가합계",  sum(g_end) "상품 최고가의 총합" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start), avg(g_end) from gift;

select * from gift, emp2, professor;
select * from gift;
select * from emp2;
select * from professor;

--평균 구하기

select  count(name), count(bonus), -- => 총 레코드수(null값은 제외함) 
    avg(pay), avg(bonus)  -- 평균(null 값은 제외하고 나눔)
    from professor;
    
select  count(name), count(bonus), -- => 총 레코드수(null값은 제외함)
    avg(pay),  avg(nvl(bonus, 0)), count(bonus) , count(nvl(bonus, 0)) --   평균(null 값은 제외하고 나눔)
    from professor;
_______________________________________________________________________________ 
select count(*) from professor;   -- count(*)  null 포함 갯수 세어준다.
select count(hpage) from professor;  -- count(필드명) null 미포함

select name, pay, bonus
    from professor;

insert into gift(gno, g_start) values(11, 999);
insert into gift(gname, g_start) values(' ', 999);

select * from gift;
select count(*) from gift;
select count(gname) from gift;

-- Oracle은 null 값이 우선순위 높음.  MySQL은 null 값이 우선순위 낮음
SELECT RANK(600000) within GROUP(ORDER BY g_end desc)
    FROM gift
  where g_end is not null;
-- where g_end is not null or g_end='';
--  where g_end not in (' ', null);

--문제-----------------------------------------------------------
-- 문제10] 키가 168인 사람은 몇 번째로 큰지 확인?
select * from student;
select rank(168) within group(order by height desc)
from student;

-- 문제11] 몸무게가 58인 사람은 몇번째인지 등수 구하기
select rank(58) within group (order by weight desc)
from student;

-- 문제12] g_end가 200000, 600000 보다 작은 값 출력 (any 이용)
select * from gift where g_end < any(200000, 600000);

-- 문제13] 학생들의 키의 합과 평균, 가장 키가 큰 친구, 작은 친구 출력하세요.
select sum(height) 합, avg(height) 평균, max(height), min(height)
from student;

_____________________________________________________________________

--문제1] 이름에서 '김영조' 사람들을 보여주세요.
SELECT * FROM PROFESSOR
WHERE NAME LIKE '김영조';

--문제3] 이름이 두 글자인 사람 보여주세요.
SELECT * 
FROM PROFESSOR
WHERE NAME LIKE '__';

--문제4] id에 s or a 글자가 들어가는 사람 찾기
SELECT *
FROM  PROFESSOR
WHERE ID LIKE '%s%' OR ID LIKE '%a%';

--문제5] 전임강사 찾아주세요
SELECT *
FROM PROFESSOR
WHERE POSITION = '전임강사';

--문제6] 학년이 3학년(grade)이고 키(height)가 165이상인 학과코드(deptno1)가 201인 학생 찾기  
select * from student where grade = 3
and height >= 165
and deptno1 = 201;

--문제7] 생일이 77년 이전인 학생들 찾기
select * 
from student
where birthday < '77/01/01' order by birthday desc;

--문제8] 부전공(deptno2)을 가진 학생들만 찾기
select * from student where deptno2 is not null;

--문제9] 담당교수(profno)가 1000 ~ 2001 번 사이 학생들 찾기 
select * from student
where profno  between 1000 and 2001;