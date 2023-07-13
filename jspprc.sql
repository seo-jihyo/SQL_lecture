select * from tab;
select * from members;

drop table members;

create table Members (
	id varchar2(20) not null primary key,
	passwd varchar2(20) not null,
	name varchar2(30) not null,
	jumin1 varchar2(6) not null,
	jumin2 varchar2(7) not null,
	email varchar2(30),
	blog varchar2(50),
	reg_date date not null
) segment creation immediate;

insert into members (id, passwd, name, jumin1, jumin2, email, blog, reg_date)
	values( 'aa', '1004', 'doyeon', '11', '11', 'aa@kosta.or.kr', 'aaaaa', '2015/12/20');
	
commit;

select * from MEMBERS;


update members set name = '지효' where id = 'jihyo';
select * from members where id = 'f';
