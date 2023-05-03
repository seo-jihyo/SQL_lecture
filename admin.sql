--설정
create user jihyo identified by oracle account unlock;
grant connect, resource to jihyo;

alter user jihyo default tablespace users quota unlimited on users;


create user mango identified by oracle account unlock;
grant connect, resource to mango;

alter user mango default tablespace users quota unlimited on users;