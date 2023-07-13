-- work_schedule_type --  
select * from work_schedule_type;

CREATE TABLE WORK_SCHEDULE_TYPE (
	work_sch_type_num	number	NOT NULL,
	work_name	varchar(50)	NOT NULL,
	dept	varchar2(20)	NULL,
	rank	varchar2(20)	NULL
);
DROP TABLE WORK_SCHEDULE_TYPE;

-- work_schedule_type 시퀀스 --  
CREATE SEQUENCE  work_schedule_type_seq
    START WITH 1
    INCREMENT BY 1;
    
    SELECT * FROM CODE_TABLE;
drop sequence work_schedule_type_seq;
    
-- test    
    update work_schedule_type set work_name = 'aa', work = 'asd', rank ='aa' where work_sch_type_num = 5;
  
   insert into work_schedule_type(work_sch_type_num, work_name, work_start, work_end) 
   values (work_schedule_type_seq.nextval,'외근', TO_CHAR('09:00', 'HH24:MI'), TO_CHAR('16:00', 'YYYY-MM-DD HH24:MI:SS'));
   
-- work_sch_type_num
SELECT work_sch_type_num, work_name, rank_table.code_value, dept_table.code_value
FROM work_schedule_type
INNER JOIN code_table rank_table
ON work_schedule_type.rank = rank_table.code_name
INNER JOIN code_table dept_table
ON work_schedule_type.dept = dept_table.code_name; 

ALTER TABLE ATTENDANCE 
ADD (BREAK_TIME NUMBER DEFAULT 1 );



----------------------------------------------
select e.emp_num, e.emp_name, e.dept, e.rank, a.go_work, a.leave_work, a.break_time, w.work_name
from emp e, attendance a, work_schedule_type w
where e.emp_num = a.emp_num
and e.rank = w.rank;




insert into attendance (att_num, emp_num, att_status, apr_status, go_work, leave_work)
values  (1, 1070,1, '4',TO_DATE('2023-07-11 09' , 'YYYY-MM-DD HH24'),TO_DATE('2023-07-11 18' , 'YYYY-MM-DD HH24')) ;
select * from emp;
select * from attendance;
select * from work_schedule_type;
select * from code_table;


UPDATE ATTENDANCE
SET GO_WORK = TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD') || ' 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    LEAVE_WORK = TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD') || ' 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE EMP_NUM = 1070;

--시간 출력 쿼리
SELECT att_num, EMP_NUM, ATT_STATUS, APR_STATUS, TO_CHAR(GO_WORK, 'YYYY-MM-DD HH24:MI:SS') AS GO_WORK, TO_CHAR(LEAVE_WORK, 'YYYY-MM-DD HH24:MI:SS') AS LEAVE_WORK, BREAK_TIME
FROM ATTENDANCE;

SELECT
    a.emp_num,
    e.emp_name,
    a.go_work,
    a.leave_work, 
    w.work_name,
    a.break_time,
    TRUNC((a.leave_work - a.go_work) * 24) AS work_hours
FROM attendance a
JOIN emp e ON a.emp_num = e.emp_num
join work_schedule_type w on a.att_status= w.work_sch_type_num;


select * from emp;

사원번호	직원	날짜	근무시간	근무일정	부서	직급	휴게시간	총 시간
into attendance (emp_num, att_status,) 
(work_sch_type_num, work_name, dept, rank) values 
(work_schedule_type_seq.nextval,#{work_name},#{dept},#{rank});
commit;

update work_schedule_type set 
			work_name = '외근',
			work_start = to_date('2023-07-01 09:01','yyyy-MM-dd HH24:mi'),
			work_end = to_date('2023-07-01 18:01','yyyy-MM-dd HH24:mi')
		where work_sch_type_num = 6;
        desc work_schedule_type;
        select * from work_schedule_type;

insert into WORK_SCHEDULE_TYPE values (work_sch_type_num_seq.nextval, '외근' , TO_DATE('13:00' , 'HH24:mi'), TO_DATE('16:00' , 'HH24:mi'));

        select         
        to_char(work_start, 'HH24:MI') as start_date, 
        to_char(work_end,  'HH24:MI') as end_date
        from WORK_SCHEDULE_TYPE;
        
        select work_sch_type_num, work_name,
        to_char(work_start, 'HH24:MI') as work_start, 
        to_char(work_end,  'HH24:MI') as work_end
        from WORK_SCHEDULE_TYPE;