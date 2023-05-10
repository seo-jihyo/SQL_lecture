--설정
create user jihyo identified by oracle account unlock;
grant connect, resource to jihyo;

alter user jihyo default tablespace users quota unlimited on users;

GRANT CREATE ANY TABLE TO jihyo;



________________________________________________________
create user mango identified by oracle account unlock;
grant connect, resource to mango;

alter user mango default tablespace users quota unlimited on users;
________________________________________________________________________

grant execute any procedure to jihyo;
grant create procedure to jihyo;