select * from DEPT2;

select * from board;

select rownum, rowid from board;

create table Board (
	num number(7) not null,
	writer varchar2(20) not null,
	email varchar2(30),
	subject varchar2(50) not null,
	passwd varchar2(12) not null,
	reg_date date not null,
	readcount number(3) default 0,
	ref number not null,
	re_step number not null,
	re_level number not null,
	content nvarchar2(2000) not null,
	ip varchar(20) not null,
	constraint board_num_pk primary key(num)
);

create sequence autonum;
drop sequenceselect * from board;



---------------------------------------------

select * from board
commit

drop table board;
desc board

create table board(
    num number not null primary key,
    writer varchar2(10) not null,
    email varchar2(20),
    subject varchar2(50) not null,
    passwd varchar2(12) not null,
    reg_date date not null,
    readcount number default 0,
    ref number not null,
    re_step number not null,
    re_level number not null,
    content varchar2(4000) not null,
    ip varchar2(20) not null
);

2. SEQUENCE(시퀀스)를 생성한다.
create sequence board_num;
  
 drop sequence autonum
 
 
 create sequence autonum 
     increment by 1   -- 1씩 증가하라는거고요 
     start with 1        -- 1부터 시작이고요 100 시작할려면 100 이라고 쓰시면 됩니다. 
     nomaxvalue       -- 최대값 제한이 없다 
     nocycle             
     nocache;
 
 alter sequence autonum
	increment by 1
	cycle;
	
	
-------------------------------------------------
select rownum, writer, subject from board

SELECT rownum, num, writer, subject
    FROM (SELECT * FROM board ORDER  BY num desc) ;	

	
select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, rownum r from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount from board order by ref desc, re_step asc) order by ref desc, re_step asc) where r>=? and r<=?;

select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, rownum r 
		from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount 
			from board order by ref desc, re_step asc) order by ref desc, re_step asc) where r>=1 and r<=7;
			

http://micropilot.tistory.com/entry/Oracle-ROWNUM-%EC%97%90-%EB%8C%80%ED%95%98%EC%97%AC

http://greatkim91.tistory.com/52
	
-----------------------------
- 
CREATE OR REPLACE PROCEDURE P_RESET_SEQ( SEQ_NAME IN VARCHAR2 )
IS
    L_VAL NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'select ' || SEQ_NAME || '.nextval from dual' INTO L_VAL;

    EXECUTE IMMEDIATE 'alter sequence ' || SEQ_NAME || ' increment by -' || L_VAL || ' minvalue 0';

    EXECUTE IMMEDIATE 'select ' || SEQ_NAME || '.nextval from dual' INTO L_VAL;

    EXECUTE IMMEDIATE 'alter sequence ' || SEQ_NAME || ' increment by 1 minvalue 0';
END;


http://www.mungchung.com/xe/?mid=protip&comment_srl=15077&listStyle=list&sort_index=readed_count&order_type=desc&document_srl=3568

