--PL SQL (Procedural Language)
/*
Sql의 장점은 쿼리문 하나로 원하는 데이터를 검색 조작 할 수 있다는 것.
그런데 sql문 자체는 비 절차성 언어이기에 몇 개의 쿼리문 사이에 어떠한 연
결 및 절차성 이 있어야 하는 경우 사용 할수 없음.
이점을 극복하기 위해 오라클 사에서 sql언어에 절차적인 프로그래밍 가능하도
록 PLSQL을 만듦.
*/

/*형식
Declare 
    선언(선택)
Begin
    실행(필수)
End;
*/

Begin
    DBMS_output.put_line('서지효');
End;

---------------------------------------------------
DECLARE name VARCHAR2(20):='김연아';
Begin
    DBMS_output.put_line('이름은' || name);
End;

----------------------------------------------------
DECLARE e_name emp.ename%type;    --declare e_name varchar2(10);
    e_sal emp.sal%type;           --e_sal NUMBER(7,2)
Begin
    select sal, ename into e_sal, e_name from emp where empno='7788';
    DBMS_output.put_line('7788님의 이름은 ' ||e_name || '급여는' ||e_sal);
End;
----------------------------------------------------
desc emp

declare data emp%rowtype;
begin
    select * into data from emp where empno = '7788';
    dbms_output.put_line(data.ename||',' ||data.job||','||data.mgr||','||data.deptno);
    end;
    --테이블로부터 가져온 필드의 값을 변수에 저장하기 위해서 select절에서 into 사용함
    -----------------------------------------------------
-- 제어문의 종류 if, for, while
/*if문
IF 조건식 THEN 실행문장;
ELSIF 조건식 THEN 실행문장;
ELSIF 조건식 THEN 실행문장;
....
ELSE 실행문장;
END IF;
*/

DECLARE
    num1 number:=3;
    num2 number:=5;
BEGIN
    if num1 >= num2 then
        dbms_output.put_line(num1||'이 큽니다');
    else dbms_output.put_line(num2||'가 큽니다');
    end if;
END;
--------------------------------------------------------------------
-- 값 입력받기
DECLARE
    num1 number:= &num1;
    num2 number:= &num2;
BEGIN
    if num1 >= num2 then
        dbms_output.put_line(num1||'이 큽니다');
    else dbms_output.put_line(num2||'가 큽니다');
    endif;
END;
--------------------------------------------------------------------
DECLARE
    n_sales number;
    n_commission number(10, 2) :=0;
BEGIN
    n_sales :=&n_sales; --입력받기
    
    if n_sales > 200 then n_commission := n_sales*0.1;
    ELSIF n_sales <= 200 and n_sales > 500 then n_commission := n_sales*0.05;
    ELSIF n_sales <= 500 and n_sales > 1000 then n_commission := n_sales*0.03;
    ELSE n_commission :=n_sales *0.02;
 end if;

 DBMS_output.put_line(n_sales || ',' ||n_commission);
END;
-----------------------------------------------------------------------------
Begin
 DBMS_output.put('Oracle 시험 잘 보세요');
 DBMS_output.put('Oracle 시험 잘 보세요222');
 DBMS_output.put_line(' 개행');
End;

create PROCEDURE p_test
is 
    Begin
    DBMS_output.put('Oracle 시험 잘 보세요');
    DBMS_output.put('Oracle 시험 잘 보세요222');
    DBMS_output.put_line(' 개행');
    End;
    ----------------------------------------------------
    exec p_test;
create procedure p_test2(name  in varchar2)
is
    Begin
        DBMS_output_line(name ||'님 시험 합격입니다.');
    End;
    -------------------------------------------------------
exec p_test2('서지효');

---------------------------------------------------------------------

select * from userlist;
create table userlist(
    id varchar2(10),
    name varchar2(20),
    age number,
    addr varchar2(50)
    );
    desc userlist;
 ------------------------------   
    create or replace procedure p_userlist(
        id in userlist.id%type := 'jihyo',
        name in userlist.name%type default 'yuna',
        age in userlist.age%type := 10 ,
        addr in userlist.addr%type := null
    )
    is
    begin
    insert into userlist values(id, name,age,addr);
        DBMS_output.put_line('insert 정보는' ||id||name||age||addr);
    End;
    ---
    exec p_userlist('서지효'); 
    exec p_userlist('happy','박보검',20,'서울');--전체 필드 추가
    exec p_userlist; --default data input
    exec p_userlist(id=>'gildong',age=>33); --골라서 필드 추가
    exec p_userlist(name=>'손연재',addr=>'jeju');
    
    select * from userlist;  
    
--문제1] 저장프로시저 emp 테이블에서 급여 상위 5위까지 출력하는 프로시저 만들기
select sal, rownum from emp where rownum = 1;

select * 
    from (select * from emp order by sal desc)-- 인라인뷰
    where rownum =1;   --1등만 뽑힘
    
select *
    from emp e, dept2 d;
    
select d.*
    from emp e, dept2 d;
    
--cf) MySql에 있는 명령
-- select top 5 sal from emp;
---------------------------------------------------------

-----문제 원인 찾기???-------------------------------------------------------
create or replace procedure p_empMaxSal
(
    out p_empno  emp.empno%type ,
    out p_ename  emp.ename%type ,
    out p_sal      emp.sal%type
)
is
  begin
      select p_empno, p_ename, p_sal
          from ( select * from emp order by sal desc )
          where rownum <= 5 ;
  end;
------------------------------------------------------------
create or replace procedure p_empMaxSal
(
     p_empno  emp.empno%type ,
     p_ename  emp.ename%type ,
     p_sal      emp.sal%type,
     P_LASTSTATEMENTBALANCE OUT FLOAT
)
is
  begin
      select  empno, ename, sal, P_LASTSTATEMENTBALANCE
          from ( select empno, ename, sal from emp order by sal desc )
          where rownum <= 5 ;
  end;
------------------------------------------------------------
exec p_empMaxSal ;
-----방법1. ---------------------------------------------------
drop PROCEDURE p_empMaxSal;

create or replace procedure p_empMaxSal  --정상작동됨
is
  v_emprow  emp%ROWTYPE;
  Begin
    for i in 1..5 loop  --1부터 5까지
      select * into v_emprow from 
        ( SELECT *
            FROM ( select * from emp order by sal desc ) 
              WHERE ROWNUM <= i ) where rownum <= 5 ;
        dbms_output.put_line(v_emprow.empno || ' ' || v_emprow.ename || ' ' || v_emprow.sal);
    end loop;
  end;
------------------------------------------------------------------------------------------
exec p_empMaxSal ;
----방법2. ----------------------------------------------------
create or replace procedure emp_top5
is
  v_emprow emp%ROWTYPE;
begin
  for i in 1..5 loop
    select * into v_emprow from 
        (select * from (select * from emp order by sal desc)
         where rownum<=i order by sal, ename) where rownum=1 order by sal asc;
    dbms_output.put_line(v_emprow.empno || ' ' || v_emprow.ename || ' ' || v_emprow.sal);
  end loop;
end;
------------------------------------------------
exec emp_top5;
-------------------------------------------
select rownum, ename, sal from emp  where rownum <= 5
  order by sal desc;
------------------------------------------------------------
select * from emp;
___________________________________________________________________________________
--FOR
--1번 1~10 출력하기
bEGIN 
    FOR i in 1..10 loop
    dbms_output.put_line(i);
    end loop;
end;

Begin
    for i in 1..10 loop
    if(mod(i,2)=0) then dbms_output.put_line(i);
    end if;
end;


---------------------------------------------------\
--원하는 단 입력받아서 출력

DECLARE
    p_dan number(1):= &dan;
    total number(2) :=0;
Begin
    for i in 1..9 loop
    total :=p_dan*i;
    dbms_output.put_line(p_dan||'*'||i||'='||total);
    end loop;
end;
-------------------------------------------------------------------------
--loop end 문
declare i int :=1;
    begin
        loop
            dbms_output.put_line(i);
            i:= i+1;
        exit when (i > 10);
        end loop;
    end;
 --while loop
  DECLARE i INT :=1;

  BEGIN
     WHILE (i<=10) loop
         DBMS_OUTPUT.put_line(i);
         i:= i+1;
     END LOOP;
  END;
------------------------------
-- 1~10사이의 짝수 출력
Begin
  for i in 1..10 loop
     --dbms_output.put_line( mod(i, 2) );
     if( mod( i, 2 ) = 0 ) then DBMS_OUTPUT.put_line(i);
     end if;
  end loop;
End;
-------------------------------------
-- 2단 출력하기
-- BASIC LOOP로 구구단(2단 출력하기)
DECLARE   -- 선언(선택)
    dan NUMBER :=2;
    i NUMBER :=1;
BEGIN  -- 필수 
    loop
    dbms_output.put_line(dan || '*' ||i|| '=' || (dan*i));
    -- 2 * i = 2
    i:=i+1;
    IF i > 9 THEN exit;  
    END IF;
  END loop;
END;  -- 필수
-------------------------------------------------------------------
-- FOR LOOP로 구구단(2단) 출력하기
DECLARE
    dan NUMBER := 2;
    i NUMBER :=1;
BEGIN
    FOR i IN 1..9 loop
      dbms_output.put_line(dan||'*'||i||'='||(dan*i));
    END loop;
END;
---------------------------------------------------------------------
-- WHILE LOOP로 구구단 (2단) 출력하기
DECLARE 
    dan NUMBER := 2;
    i NUMBER :=1;
BEGIN
    While i <= 9 loop
       dbms_output.put_line(dan||'*'||i||'='||(dan*i));
       i:=i+1;
    END loop;
END;
--------------------------------------------------------
-- 사용자 입력(단수)를 받아 구구단 출력
-- &는 사용자입력값을 받을때 상요하는 키워드 . &공간이름
DECLARE vdan NUMBER(1) :=&dan;
    BEGIN
        FOR i IN 1.. 9 loop
            DBMS_output.put_line(vdan || ' * ' || i ||'='|| (vdan * i) );
        END LOOP;
     END;
     
-----------------------------------------------------------
--구구단 전체 출력 ( 2중 반복문 )
    BEGIN
        FOR i IN 1 .. 9 LOOP
            FOR j IN 2 .. 9 LOOP
                dbms_output.put( j || ' * ' || i ||'='|| ( i * j ) ||'    ');
            END LOOP;
                dbms_output.put_line(' ');
        END LOOP;
    END;   