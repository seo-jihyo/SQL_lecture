--예약 테이블 (BOOK table)
DROP TABLE BOOK;
select * from book;
create table BOOK (
    B_NUM NUMBER PRIMARY KEY,             --예약 번호
    B_RT_NUM NUMBER NOT NULL,             --식당 번호, FK
    B_NAME VARCHAR2(50) NOT NULL,          --예약자명
    B_PHONE VARCHAR2(20) NOT NULL,        --예약자 연락처
    B_DATE DATE default sysdate NOT NULL, --예약 일자
    B_TIME VARCHAR2(10) NOT NULL,         --예약 시간
    B_INWON NUMBER NOT NULL               --예약 인원수    
);

-- 식당 테이블 
DROP TABLE RT;
select * from rt;
create table RT (
    RT_NUM NUMBER PRIMARY KEY,            -- 식당 번호
    RT_NAME VARCHAR2(50) NOT NULL,        -- 식당 이름
    RT_TYPE VARCHAR2(50)NOT NULL,         -- 식당 카테고리 
    RT_INWON  NUMBER NOT NULL,             -- 시간당 수용 인원
    RT_START  VARCHAR2(10) NOT NULL,              -- 오픈 시간
    RT_END    VARCHAR2(10) NOT NULL               -- 마감 시간
);
-- rt_type이 같고 B_TIME도 같고 B_DATE도 같은 시간에 B_INWON이  RT_INWON보다 적은 경우만 출력


UPDATE BOOK SET B_RT_NUM = ( select b.b_rt_num from book b join rt r on b.b_rt_num = r.rt_num WHERE R.RT_NAME = ? )
WHERE B_NUM = B_NUM;

UPDATE BOOK B
    SET B_RT_NUM = (SELECT B_RT_NUM FROM BOOK

--join
select b_name, b_date, b_time, b_inwon, rt_name, rt_inwon
from book b, rt r
where b.b_rt_num = r.rt_num;

UPDATE BOOK SET rt_name = ? WHERE B_NUM = ? 

select * from rt where rt_type = '분식';



--??--
SELECT B.B_RT_NUM , R.RT_INWON, COUNT(*) AS RESERVATION_COUNT
    FROM BOOK B
        JOIN RT R ON B.B_RT_NUM = R.RT_NUM
            WHERE TRUNC(B.B_DATE) = TRUNC(SYSDATE) -- 같은 날짜
            AND B.B_TIME = TO_CHAR(SYSDATE, 'HH24:MI') -- 같은 시간
                GROUP BY B.B_RT_NUM, R.RT_INWON
                HAVING COUNT(*) <= R.RT_INWON;




--제약조건----------------
ALTER TABLE BOOK ADD CONSTRAINT BK_FK foreign KEY(B_RT_NUM) references RT (RT_NUM);
ALTER TABLE BOOK DROP CONSTRAINT BK_FK;
--insert----------------------------------------------------------------------
insert into book values (1, 222, '서지효', '01071194007', '2023-06-01', '12', 5);
insert into book values (2, 234, '망고', '01000004007', '2023-06-02', '17', 3);
insert into book values (3, 222, 'seo', '01009094007', '2023-05-30', '14', 4);
insert into book values (4, 222, '서지효', '01071194007', '2023-06-01', '12', 5);
insert into book values (5, 222, '서지효', '01071194007', '2023-06-01', '12', 5);

insert into rt values(222, '둘리분식', '분식', 30, '10', '22' );
insert into rt values(234, '오이지', '한식', 20, '11', '20');
insert into rt values(345, '버거파크', '양식', 25, '14', '22');
insert into rt values(456, 'tt', '양식', 30, '16', '23');
insert into rt values(567, 'oo', '분식', 15, '13', '16');
insert into rt values(678, 'wer', '분식', 20, '17', '24' );
insert into rt values(789, 'poj', '한식', 40, '09', '17' );
