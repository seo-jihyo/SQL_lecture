select sysdate from dual;  --���� ���̺��� �����ϰ� ����

-- ���̺� ���� ���
create table ���̺��̸� (
 �÷��� datatype [ null | not null ] [ constraint ��Ī �������� ],
 �÷��� datatype [ null | not null ] [ constraint ��Ī �������� ],
  )
  create table userlist(
    id varchar2(10) constraint id_pk primary key,
    name varchar2(10) not null
    );
    -- �⺻Ű, �ߺ� �� �ǰ� not null��
    -- �ϳ��� ���̺� �⺻Ű�� �ݵ�� �� ���� �����Ѵ�.
    select * from userlist;
    insert into userlist values('kingsmile','aa');
    insert into userlist values('yuna','����');
  
    delete from userlist;  -- ���̺��� ���ڵ常 ������
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
        --age �÷��� ���� 20~30 ���̸� ���
        
select * from ck_test;
insert into ck_test values('aa', '10');
insert into ck_test values('aa', '25');
insert into ck_test values('aa', '33');

create table de_Test(
    NAME VARCHAR2(10) NOT NULL,
    ADDR VARCHAR2(20) DEFAULT '����'
);
    
SELECT * FROM DE_TEST;
INSERT INTO DE_TEST VALUES ('AA','����');
INSERT INTO DE_TEST VALUES ('BB','�λ�');
INSERT INTO DE_TEST VALUES ('CC','���');
INSERT INTO DE_TEST (NAME) VALUES ('DD');



