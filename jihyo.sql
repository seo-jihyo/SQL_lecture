select sysdate from dual;  --가상 테이블을 제공하고 있음

-- 테이블 생성 방법
create table 테이블이름 (
 컬럼명 datatype [ null | not null ] [ constraint 별칭 제약조건 ],
 컬럼명 datatype [ null | not null ] [ constraint 별칭 제약조건 ],
  )
  create table userlist(
    id varchar2(10) constraint id_pk primary key,
    name varchar2(10) not null
    );
    -- 기본키, 중복 안 되고 not null임
    -- 하나의 테이블에 기본키는 반드시 한 개만 존재한다.
    select * from userlist;
    insert into userlist values('kingsmile','aa');
    insert into userlist values('yuna','연아');
  
    delete from userlist;  -- 테이블의 레코드만 삭제됨
    drop table userlist;

create table fk_member(
code number(2) not null,
id varchar2(20) not null
constraint id_fk references member(id),
etc varchar2(10)
);

create table userlist_un(
id varchar2(10) constraint userlist_un_id_pk primary key,
jumin char(13) constraint jumin_un unique
);
select * from userlist_un;

insert into userlist_un values('aa', '111');
insert into userlist_un values('bb', '222');
insert into userlist_un values('cc', '33');

insert into userlist_un (id) values('bb');
insert into userlist_un (id) values('ppp');


create table ck_Test(
name varchar2(10) not null,
age number(2) not null
    check (age between 20 and 30));
        --age 컬럼의 값는 20~30 사이만 허용
        
select * from ck_test;
insert into ck_test values('aa', '10');
insert into ck_test values('aa', '25');
insert into ck_test values('aa', '33');

create table de_Test(
    NAME VARCHAR2(10) NOT NULL,
    ADDR VARCHAR2(20) DEFAULT '서울'
);
    
SELECT * FROM DE_TEST;
INSERT INTO DE_TEST VALUES ('AA','제주');
INSERT INTO DE_TEST VALUES ('BB','부산');
INSERT INTO DE_TEST VALUES ('CC','경기');
INSERT INTO DE_TEST (NAME) VALUES ('DD');



