--rownum-------------------------------------
-- 검색할 때 자동 행 번호 추가 / rowid
select * From emp;
select ename, job, rownum from emp;

select rownum, ename, job from emp;

delete from emp where rownum = 4; -- rownum 으로 insert, delete 모두 불가능 select에만 가능하다.

--dual: 테이블
--rownum : 번호 부여, 오라클 데이터베이스 이용한 게시판 만들 경우 페이징 처리에 사용 cf) 1 limit 7 : MySql

--row id: 시스템에서 지정해주며, 모두 다르게 지정된다.
select rowid, ename, job, rownum from emp;

select ename, job, rownum from emp where sal > 3000;

select rownum ename, sal
    from (select * from emp order by sal); --inline 뷰
    
--Sequence : 자동 증가 번호
/* 생성 방법
create sequence 시퀀스이름 -- 1부터 시작
[start with 시작값 ]
[increment by 증가치 ]
[maxvalue 최대값 ]
[minvalue 최소값 ]
[cycle | nocycle ] default는 cycle이다.
[cache | nocache ]
*/

drop sequence autonum;
create SEQUENCE autonum;  --아무것도 지정해주지 않으면 1부터 1씩 증가하게끔 자동생성됨

select autonum.nextval from dual; -- 시퀀스값 증가
select autonum.currval from dual; --현재 시퀀스값 가져오기

create table kosa_T(
    no number,
    name varchar2(20)
    );
    
    select * from kosa_T;
    insert into kosa_T values(autonum.nextval, 'aa');    
    insert into kosa_T values(autonum.nextval, 'bb');    
    insert into kosa_T values(autonum.nextval, 'cc');    
    insert into kosa_T values(autonum.nextval, 'dd');
    
    create SEQUENCE seq_kosa;
    
    create table kosa(
        num number,
        id  varchar2(20),
        name varchar2(20)
    );
        create table kosa(
        num number,
        id  varchar2(20),
        name varchar2(20)
    );
insert into kosa_T values(autonum.nextval, 'aa');    
    insert into kosa_T values(autonum.nextval, 'bb');    
    insert into kosa_T values(autonum.nextval, 'cc');    
    insert into kosa_T values(autonum.nextval, 'dd');

    insert into kosa_T values(seq_kosa.nextval,'dd', 'name');    
    insert into kosa_T values(seq_kosa.nextval,'ff', 'name');    
    insert into kosa_T values(seq_kosa.nextval,'hh', 'name');
    
    
    
    select * from kosa_t;
    
    drop sequence seq_kosa;
    create sequence seq_kosa
    maxvalue 10
    cycle
    cache 2;
--    increment by 100;

drop sequence of
-----------

create table kosa2 (
num number,
id varchar2(20),
name varchar2(20)
);

create SEQUENCE seq_board
start with 10
increment by 10;

    insert into kosa2 values(seq_board.nextval,'dd', 'name');    
    insert into kosa2 values(seq_board.nextval,'ff', 'name');    
    insert into kosa2 values(seq_board.nextval,'hh', 'name');
    
select * from kosa2;
-------------------------------------------------------------
create sequence seq_jumin_no
    start with 10
    increment by 10
    maxvalue 150
    minvalue 9
    cycle
    cache 2;
    
    create table jumin_T (
    seq number, 
    name varchar2(20),
    phone varchar2(15)
    );
    drop table jumin_T;
    
insert into jumin_T values(seq_jumin_no.nextval, 'aa', '1111');
insert into jumin_T values(seq_jumin_no.nextval, 'bb', '2222');
insert into jumin_T values(seq_jumin_no.nextval, 'cc', '3333');
insert into jumin_T values(seq_jumin_no.nextval, 'dd', '4444');
insert into jumin_T values(seq_jumin_no.nextval, 'ee', '5555');
insert into jumin_T values(seq_jumin_no.nextval, 'ff', '6666');

select * from jumin_T;
-------------------------------------------------------------------------
--transaction
create table c_emp100
as
    select * from e-mp where 1=0; -- 조건이 맞지 않으면 레코드 없이 생성됨
----------------------------------
begin
    for i in 1..10000 loop
    insert into c_emp100
    select * from emp;
    end loop;
end;



select * from c_emp100;y


