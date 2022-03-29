-- member 테이블 생성
-- id(숫자, 8) pk
-- name(가변문자열)

CREATE TABLE member (
    id    NUMBER(8) PRIMARY KEY,
    name  VARCHAR2(20) NOT NULL,
    addr  VARCHAR2(50) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    age   NUMBER(3)
);

select * from member;

delete from member where id=13;

commit;

create sequence member_seq;
