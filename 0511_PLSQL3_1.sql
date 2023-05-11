create or replace PROCEDURE p_stdMaxHeight
is
    v_stdrow  student%rowtype;
begin
    for i in 1..5 loop
        select * into  v_stdrow
            from ( select * from (select * from student order by height desc )
                        where rownum <= i  order by height, name desc) 
            where rownum =1 order by height desc ;
          dbms_output.put_line(v_stdrow.studno || '  ' || v_stdrow.name ||'  '|| v_stdrow.height );
    end loop;
end;
--------------------------------------------------
exec p_stdMaxHeight;
---------------------------------------------------------
select * from professor;  -- 10개 필드
select * from student;  -- 12 개 필드
select * from department; -- 4개 필드

------------------------------------------------------------
create view v_join 
as 
     select  p.PROFNO 교수번호, p.name 교수이름, p.position 직위,
               s.studno 학번, s.name 학생이름, s.grade 학년, d.dname 학과명
                from professor p  join  student s  
                on p.PROFNO = s.PROFNO join DEPARTMENT d 
                on s.DEPTNO1= d.DEPTNO;
                
select * from v_join;
-------------------------------------------------------------------------  
-- 조인으로 되어 있는 구문은 뷰로 새로 만들어서 저장 프로시저로 생성함. (조인, 프로시저, 커서 이용함)
create or replace procedure p_join
is
    hapName  v_join%rowtype;
    cursor c_name  is select * from v_join;   -- 커서선언
begin
     open c_name;   -- 커서 열기
     loop
        fetch c_name into hapName;   -- 커서로부터 데이터 읽기
        exit when c_name%notfound;   -- 찾을 데이터가 없으면 반복문 탈출
        dbms_output.put_line(hapName.교수이름 ||', ' || hapName.학생이름||', '|| hapName.학과명);
     end loop;
--     dbms_output.put_line('result recode count ==> ' || c_name%rowcount);
     close c_name;  -- 커서 닫기
end;
----------------------------------------------------------------
exec p_join;
-----------------------------------------------------------------
              


-- 참고 사이트
--https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/overview.html#GUID-14ABA325-6475-4F86-95ED-1C0632F30459






 CREATE OR REPLACE PROCEDURE usp_EmpList
(
   p_sal IN number,
    p_cursor OUT SYS_REFCURSOR --APP 사용하기 위한 타입
)
IS
   BEGIN
           OPEN p_cursor
        FOR
               SELECT empno, ename, sal FROM EMP WHERE sal > p_sal;

  END; 

exec usp_EmpList;


------ 저장프로시저 찾기 -------------------------------
select * from user_objects
  where lower(object_type)='procedure' ;
------- 저장프로시저가 작성된 SQL문 보기 -------------------
select text from user_source
  where lower(name) = '보고자하는 프로시저명' ;
  
select text from user_source
  where lower(name) = 'p_test' ;
---------------------------------------------------------------------
create or replace procedure p_outTest (
    name out varchar2,  age out number
)
is
  begin
      name := '이나영';
      age := 20;
      dbms_output.put_line('out을 이용한 프로시저 작성');
  end;
------------------------------------------------------------
variable v_name varchar2(30);
variable v_age number;    -- 이부분 수정함

exec p_outTest( :v_name, :v_age );
print v_name;
print v_age;
--------------------------------------------------------------