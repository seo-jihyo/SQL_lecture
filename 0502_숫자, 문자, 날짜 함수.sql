--집계함수 사용시 GROUP BY: 소계(부분합)

--학생들의 키의 합, 평균, 가장 키가 큰 친구, 작은 친구를 학년별로 출력
--일반 필드는 그룹필드와 같이 쓸 수 없다.
select GRADE 학년, sum(height) 합, avg(height) 평균, max(height), min(height)
from student
GROUP BY GRADE;

--EMP TYPE별로 인원수, PAY 합, 최고 급여, 최하급여 구하기
SELECT EMP_TYPE 부서, COUNT(EMP_TYPE) 인원, SUM(PAY) 합, AVG(PAY) 평균, MAX(PAY), MIN(PAY)
FROM EMP2
GROUP BY EMP_TYPE;

--교수테이블에서 직급별로 연봉의 평균, 최고, 최하값 구하기
SELECT * FROM PROFESSOR;
SELECT POSITION, AVG(PAY), MAX(PAY), MIN(PAY)
FROM PROFESSOR
GROUP BY POSITION;

-- 조건: WHERE절, HAVING 절
/*
SELECT *
FROM tableName
[WHERE] 조건
[ORDER BY] 정렬
*/
--HAVING절은 GROUP BY가 있어야 사용 가능하다.
SELECT GRADE, SUM(HEIGHT), MAX(HEIGHT),MIN(WEIGHT)
FROM STUDENT
GROUP BY GRADE
HAVING AVG(HEIGHT) > 172;

SELECT EMP_TYPE, COUNT(EMP_TYPE), SUM(PAY), AVG(PAY), MAX(PAY), MIN(PAY)
FROM EMP2
GROUP BY EMP_TYPE
HAVING AVG(PAY) > 30000000;

--문제] 최고급여 받는 사람보다 작은 POSITION 구하기
SELECT * FROM PROFESSOR;

SELECT NAME, POSITION, AVG(PAY), MIN(PAY), MAX(PAY)
FROM PROFESSOR
GROUP BY POSITION;
HAVING AVG(PAY) >300;

--2 숫자 함수 -------------------------------------------------------------------
select round(12.3456789,0),round(12.7456789,0),round(12.3456789,2), round(12.3456789,3)from dual;
select ceil(12.34), ceil(-12.34) from dual; --올림 후 정수 반환
select floor(12.34), ceil(-12.34) from dual; --내림 후 정수 반환
select trunc(12.3456789,0),trunc(12.7456789,0),trunc(12.3456789,2), trunc(12.3456789,3)from dual;
select * from dept2;
select * from professor;
--문제 교수테이블에서 월급에 인상을 2%한 결과를 출력하세요 소수점0으로 처리
select name, pay, round(pay+pay*0.2,0) "인상된 월급"
from professor;

--문제 교수테이블에서 모든 교수들에게 보너스를 1000원씩 추가지급하기 (null 처리)
select name, bonus, NVL(BONUS,0)+1000 "보너스 지급"
from professor;

--3 문자열 함수 ------------------------------------------------------------------
select id, upper(id) from professor;
select id, initcap(id) from professor;
select id, length(id) from professor;

select * from dept2;
select dname, length(dname), lengthb(dname) from dept2;

select * from gogak;
select jumin, substr(jumin,7,1) from gogak;
select instr('abcd','b') from dual; -- index number: start 1
select id, instr(id,'b') from professor;
select instr('abcdpefghilkhkjhkjp','p',-1) from dual; -- 음수값이면 뒤에서부터 찾는다.
select instr('abcdpefghilkhkjhkjp','p') from dual; -- 앞에서부터 찾는다.
select lpad('abcd',20,'#') from dual;
select rpad('abcd',20,'@') from dual;
select rpad(length('한글'), 10, '$')from dual;
select rpad(lengthb('한글'), 10, '$')from dual;

select dname, length(dname), lengthb(dname) from dept2;
select dname, substr(dname,3) from dept2;  --3번째부터 끝까지 출력
select dname, substr(dname,2,3) from dept2;  --2번째부터 3번쨰 글짜 출력

--rpad, lpad
select rpad(dname,10, substr('1234567890', length(dname) + 1)) "RPAD연습" from dept2;
select lpad(dname,10, substr('1234567890', length(dname) + 1)) "LRPAD연습" from dept2;

-- concat
select concat(name , position) || '님'
from professor
where deptno=101;

select name || position ||'님'
from professor;

--order by
select * from emp2
order by name, deptno desc, pay desc;

--4 날짜 함수 ------------------------------------------------------------------
select sysdate from dual;
select months_between(sysdate, '2025/12/20') from dual;
select months_between('2025/12/20', sysdate ) from dual;
select months_between(sysdate, '2018/12/20') from dual;

SELECT NEXT_DAY(SYSDATE, '화') AS "NEXT_DAY" FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '일') AS "NEXT_DAY" FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 1) AS "NEXT_DAY" FROM DUAL;  -- 일요일 : 1, 월 : 2,.......
SELECT NEXT_DAY(SYSDATE, 6) AS "NEXT_DAY" FROM DUAL;

SELECT add_months(DATE '2023-05-01', 1)  FROM DUAL;
SELECT add_months(DATE '2023-05-01', 10)  FROM DUAL;

SELECT last_day(DATE '2023-05-01')  FROM DUAL;
SELECT last_day(DATE '2023-03-01')  FROM DUAL;
SELECT last_day(DATE '2023-03-01')  FROM DUAL;  -- '년/월/일'  또는 '년-월-일'

select * from professor;
select hiredate, next_day(hiredate, 1) from professor;   
select hiredate, add_months(hiredate, 1) from professor;

select hiredate, to_char(hiredate, 'YYYY-MM-DD') from professor;
select hiredate, to_char(hiredate,'YYYY-MM-DD HH:MI:SS') from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') from professor;

select to_char(2000, '999,999') from dual; -- => 2,000
select to_char(200200, '999,999') from dual;
select to_char(2000, 'L999,999')  from dual;  --=> \2,000 => 지역에 따른 화페표시
select to_char(2000, '$999,999')  from dual;  -- => $2,000

select to_date('20000501', 'YYYYMMDD') from dual;
select to_date('abcd', 'YYYYMMDD') from dual;  -- error , 숫자 문자여야됨. 
select TO_DATE('20050102123456', 'YYYYMMDD HH24MISS') from dual;   --

SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';  -- 지정한 형식만 확인
select * from NLS_SESSION_PARAMETERS;  -- 현재 시스템에서의 셋팅 상태 확인

-- ALTER SESSION SET NLS_DATE_FORMAT = [변경할 포맷]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';  -- 날짜 형식 변경
--메뉴 : 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식

select *
    from NLS_SESSION_PARAMETERS
    where parameter = 'NLS_DATE_FORMAT';


SELECT TO_CHAR(NEXT_DAY(SYSDATE,'일요일'), 'yyyymmdd hh24:mi:ss') AS "NEXT_DAY" FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'일'), 'yyyymmdd hh24:mi:ss') AS "NEXT_DAY" FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'월'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'목'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'Wednesday'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'Thursday'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'Friday'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'Saturday'), 'yyyymmdd hh24:mi:ss') FROM DUAL;

SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';  -- 지정한 형식만 확인
select * from NLS_SESSION_PARAMETERS;  -- 현재 시스템에서의 셋팅 상태 확인

-- ALTER SESSION SET NLS_DATE_FORMAT = [변경할 포맷]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';  -- 날짜 형식 변경
--메뉴 : 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식

select *
from NLS_SESSION_PARAMETERS
where parameter = 'NLS_DATE_FORMAT';

SELECT '1234' + 200, TO_NUMBER('1234'), TO_NUMBER('1234') + 100 FROM DUAL;


DESC EMP2; 
SELECT NAME,TO_CHAR(PAY, '999,999,999,999,999') FROM EMP2;

--DECODE
SELECT * FROM EMP; --14개의 직원
SELECT * FROM DEPT; --4
--SELECT절에서 조건을 주어 조건에 따라 실행문장을 다르게 할때 사용

--DPPT NO
ELECT deptno, 
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END as "Dept Name"
  FROM dept
  GROUP BY ENAME, DEPTNO;
_____________________________________________________________
SELECT deptno, 
               NVL(SUM(DECODE(deptno, 101, pay)),0) deptno101, 
               NVL(SUM(DECODE(deptno, 102, pay)),0) deptno102,
               NVL(SUM(DECODE(deptno, 103, pay)),0) deptno103,
               NVL(SUM(DECODE(deptno, 201, pay)),0) deptno201,
               NVL(SUM(DECODE(deptno, 202, pay)),0) deptno202,
               NVL(SUM(DECODE(deptno, 203, pay)),0) deptno203,
               NVL(SUM(DECODE(deptno, 301, pay)),0) deptno301
  FROM professor
  GROUP BY deptno
  order by deptno; 
 SELECT * FROM DEPT2;
 
SELECT deptno, 
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END as "Dept Name"
  FROM dept;
 
SELECT ename , 
       CASE
          WHEN sal < 1000  THEN sal+(sal*0.8)
          WHEN sal BETWEEN 1000 AND 2000 THEN sal+(sal*0.5)
          WHEN sal BETWEEN 2001 AND 3000 THEN sal+(sal*0.3)
          ELSE sal+(sal*0.1)
       END sal
  FROM emp; 

SELECT ename , sal,
       CASE
          WHEN sal < 1000  THEN sal+(sal*0.8)
          WHEN sal BETWEEN 1000 AND 2000 THEN sal+(sal*0.5)
          WHEN sal BETWEEN 2001 AND 3000 THEN sal+(sal*0.3)
          ELSE sal+(sal*0.1)
       END sal
  FROM emp; 

--문제] pdept 에 따라서 지사명을 출력하세요. (dcode, case 이용)
select * from dept2;
SELECT pdept,
	CASE PDEPT
		WHEN nvl(TO_char(1000), 0) THEN AREA
		WHEN nvl(TO_char(0001), 0) THEN AREA
		WHEN nvl(TO_char(1003), 0) THEN AREA
		WHEN nvl(TO_char(1002), 0) THEN AREA
		WHEN nvl(TO_char(1006), 0) THEN AREA
		WHEN nvl(TO_char(1007), 0) THEN AREA
	END
FROM DEPT2 d
where area is not null;

SELECT pdept,
	CASE PDEPT 
		WHEN TO_char(1000) THEN AREA
		WHEN TO_char(0001) THEN AREA
		WHEN TO_char(1003) THEN AREA
		WHEN TO_char(1002) THEN AREA
		WHEN TO_char(1006) THEN AREA
		WHEN TO_char(1007) THEN AREA  
	END 
FROM DEPT2 
where area is not null and pdept is not null;

SELECT pdept,
	CASE PDEPT 
		WHEN '1000' THEN AREA
		WHEN '0001' THEN AREA
		WHEN '1003' THEN AREA
		WHEN '1002' THEN AREA
		WHEN '1006' THEN AREA
		WHEN '1007' THEN AREA  
	END 
FROM DEPT2 
where area is not null and pdept is not null;


select * from dept2;
desc dept2;

-- ppt 2장 단일행함수 실습하기