CREATE TABLE Member(

             email		varchar2(20) PRIMARY KEY not null,
             password	varchar2(20) not null,
             name		varchar2(20)
);

select * from Member
delete from member