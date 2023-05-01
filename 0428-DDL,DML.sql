CREATE TABLE TEST(
    NO NUMBER NOT NULL, --PRIMARY KEY,  직접 넣어도 된다.--
    NAME VARCHAR2(10) NOT NULL,
    BIRTHDATE DATE,  -- 생년월일: '년-월-일' OR  '년/월/일'
    AGE NUMBER,
    CONSTRAINT TEST_NO_PK PRIMARY KEY(NO)
);
--NUMBER: 4BYTE (-9999 ~ 9999)

SELECT * FROM TEST;
DESC TEST; --구조물 보기

--USERLIST TABLE--
SELECT * FROM USERLIST;
-- 1. 테이블 생성
CREATE TABLE USERLIST(
    ID VARCHAR2(10) CONSTRAINT ID_PK PRIMARY KEY,
    NAME VARCHAR2(10) NOT NULL
); 
-- 2. 컬럼 추가
insert into userlist values('kingsmile','aa');
insert into userlist values('yuna','연아');
    
-- 3. 컬럼 수정
ALTER TABLE USERLIST ADD PHONE VARCHAR2(15);
-- 하나 이상의 컬럼을 추가할 떄는 묶어 줘야 함
ALTER TABLE USERLIST ADD (NO NUMBER(2),
            GENDER CHAR(2));
-- UPDATE 테이블명 SET 변경할 내용  :  전체 컬럼 변경
-- UPDATE 테이블명 SET 변경할 내용 WHERE 조건절

UPDATE USERLIST SET NO = 1 WHERE ID = 'kingsmile';
SELECT * FROM USERLIST;

UPDATE USERLIST SET NO = 3, GENDER='F', NAME='수지' WHERE ID = 'kingsmile';

-- 4. 컬럼 삭제
alter table userlist drop column phone;
-- 여러 컬럼 삭제
alter table userlist drop (no, gender);

-- 5. datatype 변경
alter table userlist modify phone number; --컬럼에 데이터가 없었을 경우 타입 변경이 가능하다.--
alter table userlist modify no date;  -- 비어 있지 않은 경우는 데이터 타입 변경이 불가능하다. null 처리하거나 비우고 실행--

-- 비우는 방법
update userlist set no = '';
update userlist set no = null;

desc userlist;
select * from userlist;

-- 6. 컬럼 이름 변경
alter table userlist rename column phone to tel;
alter table userlist rename column no to num;

--7. 테이블 삭제
drop table userlist;
delete from userlist;
select * from userlist;
rollback

-- 삭제 테이블 목록 보기
SHOW RECYCLEBIN;
SELECT * FROM TAB;

DESC RECYCLEBIN;

SELECT * FROM EMP2;

-- 삭제된 테이블 복구
FLASHBACK TABLE USERLIST TO BEFORE DROP;
SELECT * FROM USERLIST;

-- 삭제된 목록 (휴지통) 비우기
SELECT * FROM TAB;
PURGE RECYCLEBIN;b

-- 레코드 삽입
-- insert into 테이블이름(컬럼명, 컬럼명...) values(값, 값, ...);
-- insert into 테이블이름 values(값, 값 ...)
--                          => 모든 컬럼에 모두 값은 넣을 떄 사용

select * from gift;
desc gift;

-- 모든 컬럼에 값 넣기
insert into gift values(100, '냉장고세트', 1000, 1000000);
-- 선택한 컬럼에 값 넣기
insert into gift(gname, g_end) values('동화책', 30000);



select * from professor;

select name, position, pay, bonus
from professor 
where position='정교수' or position='전임강사';
_________________________________________
select name, position, pay, pay*1.2 as 인상, bonus
from professor 
where position='정교수';

update professor 
set pay = pay * 1.2 
where position = '정교수';

select * 
from professor
where position = '전임강사';

-- 레코드 삭제
select * from gift;
delete gift  where gname like '%세트';  -- %는 * (모든), _는 한 문자를 의미 --

TRUNCATE TABLE GIFT 
-- WHERE GNAME='%세트';  --조건절을 쓸 수 없다., 
-- DML 명령어가 아니라 롤백 불가