--프로시저 cursor 활용
CREATE or REPLACE PROCEDURE p_job_emp(e_job in emp.job%type)
IS  
    name emp.ename%type;
BEGIN
    select ename INTO name from emp where job = e_job;
    dbms_output.put_line(name ||'님 담당업무는' ||e_job);
end;
------------------------------------------------------------
select * from emp;

exec p_job_emp('PRESIDENT'); --1명은 정상 출력
exec p_job_emp('MANAGER'); --CLERAK, PRESIDENT, ANALYST
exec p_job_emp('ANALYST');  --1명 이상의 데이터가 있을 경우 에러 발생
___________________________________________________________________________
create or REPLACE PROCEDURE p_emp_job(v_job in emp.job%type)
IS  
    name emp.ename%type;
    empno emp.empno%type;
    sal emp.sal%type;
--  cursor c_name is select empno, ename, sal from emp where job = upper(v_job) or job = lower(v_job)
    --1. 커서 선언
    cursor c_name is select empno, ename, sal 
    from emp where job in (upper(v_job), lower(v_job));
    
BEGIN
    open c_name; --2. 커서 열기
    dbms_output.put_line('----------------');
    loop
        fetch c_name into empno, name, sal; --3. 커서로부터 데이터 읽기
        exit when c_name%NOTFOUND; --찾을 데이터가 없으면 반복문 탈출
        dbms_output.put_line(name||' '||empno||' '||sal||' '||v_job);
    end loop;
--        dbms_output.put_line('result recode count ==> '|| c_name%rowcount);
    close c_name;  --4. 커서 닫기
--        dbms_output.put_line(c_name%isopen);
end;
----------------------------------------------------------------------------
exec p_emp_job('PRESIDENT'); 
exec p_emp_job(lower('PRESIDENT')); 
exec p_emp_job('MANAGER'); 
exec p_emp_job('ANALYST');
___________________________________________________________________________
--문제 학생 테이블에서 키가 제일 큰 순서대로 3명 출력하는 프로시저 만들기
select name, height from student order by height desc;
create or replace procedure p_student_hei(v_height in student.height%type)
is
    name student.name%type;
    height student.height%type;
    
    cursor c_student is select name, height
    from select * from (student order by height desc)
        where rownum <= i order by height, name desc) 
        where rownum = 1 order by height desc;
   
begin
    open c_student;
     dbms_output.put_line('----------------');
    loop
        fetch c_student into name,height;
        exit when n;
    end loop;
    close c_student;
end;

exec p_student_hei;