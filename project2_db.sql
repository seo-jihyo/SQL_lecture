 --CustomerCallSystem
select * from ccs;
 create table CCS (
    no NUMBER PRIMARY KEY,
    phone VARCHAR2(20)NOT NULL,
    people number NOT NULL,
    time DATE DEFAULT SYSDATE NOT NULL,
    state VARCHAR2(30) NOT NULL
    );
drop table ccs;

 --Sequence    

 CREATE SEQUENCE CCS_SEQUENCE
 INCREMENT BY 1
 START WITH 1
 NOCYCLE ;
  
  drop sequence ccs_sequence;
  
  
  
    desc ccs;
    select * from CCS order by no asc;
    describe ccs;    
  drop table ccs;
    select count(*) from ccs where state = '입장 대기';  

    UPDATE CSS SET STATE = '입장 완료';
SET 
컬럼1 = 변경할 값,
컬럼2 = 변경할 값
.....
WHERE
조건;
--입장 대기로 상태 변경    
    alter table ccs modify (state default '입장 대기');  
    
--줄서기 등록
    insert into ccs values(CCS_SEQUENCE.nextval, '010-1212-2323', 3, sysdate, default);
    insert into ccs values(CCS_SEQUENCE.nextval, '010-2425-2343', 5, sysdate, default);
    insert into ccs values(CCS_SEQUENCE.nextval, '010-4567-8765', 4, sysdate, default);
    
--입장 대기 인원 카운트   
    select count(*) from ccs where state = '입장 대기';
    
    delete from ccs where no = 11;
    
    commit;
    
    create user
    
SELECT COUNT(CASE WHEN state='입장 대기' THEN 1 END) count FROM ccs

