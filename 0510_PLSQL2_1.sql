--PL SQL (Procedural Language)
select * from dept;

create or replace PROCEDURE  p_sal
is
    v_salary number := 0;    v_dept_id number := 0;
BEGIN
    v_dept_id := round(dbms_random.value(10, 40) , -1);
    
    DBMS_OUTPUT.PUT_LINE('v_dept_id = ' || v_dept_id );
    
    select sal into v_salary from emp where deptno = v_dept_id and rownum = 1;
     DBMS_OUTPUT.PUT_LINE( v_salary );
     
     if v_salary BETWEEN 1 and 3000 then
        DBMS_OUTPUT.PUT_LINE( '보수 적음' );
     ELSIF v_salary BETWEEN 3001 and 6000 then
        DBMS_OUTPUT.PUT_LINE( '시세에 맞춰줌' );
    ELSIF v_salary BETWEEN 6001 and 9000 then
        DBMS_OUTPUT.PUT_LINE( '보수 좋음' );
     else
        DBMS_OUTPUT.PUT_LINE( '완전 좋음' );
    end if;
end;
-----------------------------------------------
exec  p_sal;
-------------------------------------------------------------------
/*
ex) 사용자 입력(단수)를 받아 구구단 출력
[힌트] DECLARE vdan NUMBER(1) :=&dan;
*/

----------------------------------------------------
create or replace PROCEDURE  p_wantDan
is        
    dan number(1) := &inputDan;
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(dan ||'*'||i||'='|| i*dan);
    end loop;
end;
-------------------------------------------
exec p_wantDan;
--------------------------------------------
create or replace PROCEDURE  p_wantDan( v_dan in number  )    
is        
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(v_dan ||'*'||i||'='|| i* v_dan);
    end loop;
end;
-------------------------------------------
exec p_wantDan(&v_dan); -- 실행부터 입력 받으면서~
-------------------------------------------------------------
create table info2(
    id varchar2(10),
    name varchar2(20)
    );
    drop table info;


create or replace PROCEDURE input_info2(
    id in info2.id%TYPE,
    name in info2.name%TYPE)
is
BEGIN
   insert into info2 values(id, name);
    DBMS_OUTPUT.PUT_LINE('id : ' || id || 'name : ' || name);
END;
----------------------------------------------------------
exec input_info2 ('&id' ,'&name');

drop table info purge;
----------------------------------------------------------
create or replace procedure p_outTest (
    name out varchar2, age out varchar2
)
is
begin
    name := '이나영3';
    age := 33;
    dbms_output.put_line('out을 이용한 프로시저 완료');
end;
----------------------------------
variable v_name varchar2(20);
variable v_age varchar2(3);

exec p_outTest(:v_name, :v_age);
print v_name;
print v_age;

--print (v_name, v_age);  -- ??
---------------------------------------------
create or replace procedure p_out( x in out number )
as
begin
    dbms_output.put_line( 'x = ' || x );
    x := &x;
end;
-------------------------------------------------------------------------------------------------------------------
VARIABLE x varchar2(25);
exec p_out(:x);
print x;


/*
ex) 사용자 입력(단수)를 받아 구구단 출력
[힌트] DECLARE vdan NUMBER(1) :=&dan;
*/
declare
    dan number(1) := &inputDan;
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(dan ||'*'||i||'='|| i*dan);
    end loop;
end;
----------------------------------------------------
create or replace PROCEDURE  p_wantDan
is        
    dan number(1) := &inputDan;
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(dan ||'*'||i||'='|| i*dan);
    end loop;
end;
-------------------------------------------
exec p_wantDan;
--------------------------------------------
create or replace PROCEDURE  p_wantDan( v_dan in number  )    
is        
begin
    for i in 1..9 loop
        DBMS_OUTPUT.PUT_LINE(v_dan ||'*'||i||'='|| i* v_dan);
    end loop;
end;
-------------------------------------------
exec p_wantDan(&v_dan); -- 실행부터 입력 받으면서~
--------------------------------------------
----------------------------------------------------------
create or replace procedure p_outTest (
    name out varchar2, age out varchar2
)
is
begin
    name := '이나영3';
    age := 33;
    dbms_output.put_line('out을 이용한 프로시저 완료');
end;
----------------------------------
variable v_name varchar2(20);
variable v_age varchar2(3);

exec p_outTest(:v_name, :v_age);
print v_name;
print v_age;

print (v_name, v_age);  -- ??
---------------------------------------------
create or replace procedure p_out( x in out number )
as
begin
    dbms_output.put_line( 'x = ' || x );
    x := &x;
end;
------------------------------------------------