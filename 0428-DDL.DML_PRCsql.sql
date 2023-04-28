select * from professor;
insert into professor (prof;

select * from dept2;
insert into dept2 (dcode, dname, pdept, area)
 values (9000, '특판1팀', '영업', '임시지역');
 desc dept2;
 
 insert into professor (profno, name, id, position, pay, hiredate)
 values (5001, '김설희', 'Love_me','정교수',510, '2011/11/14');
 
 insert all
 into p_01 values (profno, name)
 into p_02 values (profno, name)
 select profno, name
 from professor
 where profno between 3000 and 3999;
 
 select * from professor;
 update professor
 set bonus = 100
 where position = '조교수';
 
 update professor
 set pay = pay * 1.5
 where position = (select position 
                    from professor
                    where name = '차범철')
 and pay < 250;
 
 delete from dept2
 where dcode 
 select * from professor where position = '전임강사';

 select * from dept2;
delete from dept2
where dcode between 9000 and 9100;
rollback
