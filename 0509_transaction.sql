select * from c_emp100;
commit;   --전체 저장 완료
rollback; -- 전체 취소
 update c_emp100 set sal = 1000;
 delete from c_emp100 where deptno = 20;
 update c_emp100 set sal = 200 where detpno = 30;
 update c_emp100 set sal = 500 where deptno = 100;

 update c_emp100 set sal = 888 where deptno=10;
 savepoint update_sal;  --savepoint rollback to SAVEPOINT update_sal;
 
 update c_emp100 set sal = 99 where deptno = 30;
savepoint update_sal_30;

update c_emp100 set sal = 1 where deptno = 30;

select * from c_emp100;
select sum(sal) from c_emp100; --25721850

rollback to savepoint update_Sal;  --rollback to satevpoint 식별자

select sum(sal) from c_emp100;

rollback to SAVEPOINT update_sal;
________________________________________________________________________________

SAVEPOINT create_tt;

create table tt(id number);
insert into tt values (1);
insert into tt values (2);
insert into tt values (3);
insert into tt values (4);

commit;
select * from tt;
rollback to savepoint create_tt;

--drop table tt;
--commit / rollback은 'dm;명령어에만 적용'
--------------------------------------------------------------------------------


--다른 계정에 있는 테이블에 접근하기
-- select * from  사용자.테이블명;


select * from mango.tt;  --mango 계정 테이블 접근 안 되는 거 확인

grant select on jihyo.tt to mango;  --mango에게 jihyo의 emp 테이블에 접근 권한을 준다.

-- mango에서도 jihyo에게 권한 줌

insert into mango.tt values(7);  --mango에서 권한을 주면 insert가 가능함

--mango에서 revoke 후 다시 insert해보기 / 결과: 안됨
insert into mango.tt values(77);

revoke select on jihyo.tt from mango;
______________________________________________________________________

select * from dept2;
select * from emp2;

drop table dept;
-- 걸려 있는 제약조건 때문에 삭제되지 않음
drop table dept cascade constraints; 
-- 제약조건과 테이블 모두 다 지우는 방법












