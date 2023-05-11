--정규식
--https://ko.wikipedia.org/wiki/%EC%A0%95%EA%B7%9C_%ED%91%9C%ED%98%84%EC%8B%9D
--https://cheezred.tistory.com/35
SELECT * FROM reg_test --oracle 10g 적용

select *    
    from reg_test
    while REGEXP_LIKE(text, '([aeiou])\1',' 'i']);   --문자열(또는 문자열 포함 필드명), 패턴;  대소문자 구분안함
    
select * 
    from reg_test
    where REGEXP_LIKE(text, '[abc]' );  -- [ 와 ] 사이에 있는 문자들 중 하나
    
 select * 
    from reg_test
    where REGEXP_LIKE(text, '[a-z] [0-9]' );   -- 소문자 a~z 공백 숫자

select * 
    from reg_test
    where REGEXP_LIKE(text, '[a-z][0-9]' );    -- 위의 것과 차이 비교
    
insert into reg_test values('789ABC');
insert into reg_test values('789 ABC');
insert into reg_test values('123kbs');
insert into reg_test values('mbc567');
insert into reg_test values('sbs 567');    

-- 소문자나 공백이나 숫자가 들어가는 것    
select *  from reg_test where REGEXP_LIKE(text, '[a-z]?[0-9]' );   -- 대소문자 구분 없음. ?
select *  from reg_test where REGEXP_LIKE(text, '[0-9]?[a-z]' );     
    
select *  from reg_test where REGEXP_LIKE(text, '[A-Z]*[0-9]' );   -- 대소문자 구분 없음. *
select *  from reg_test where REGEXP_LIKE(text, '[A-Z]?[0-9]' );     
select *  from reg_test where REGEXP_LIKE(text, '[0-9]?[A-Z]' );         
select *  from reg_test where REGEXP_LIKE(text, '[0-9]*[A-Z]' );   
-- * : 0회 이상 0개, 이상의 문자를포함한다.
--

 
--a를 포함하고 숫자가 포함되어 있는 id를 정규식으로 찾기

SELECT id FROM professor WHERE REGEXP_LIKE(id, 'a.*[0-9]+'); -- 숫자가 먼저 나올 경우 안됨

