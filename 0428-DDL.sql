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
alter table userlist modify no date;  -- 비어 있지 않은 경우는 데이터 타입 변경이 불가능하다. 비우고 실행--

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
PURGE RECYCLEBIN;