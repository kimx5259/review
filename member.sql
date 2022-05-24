select * from tbl_member

create table tbl_member(
	userid VARCHAR2(6),
	userpw VARCHAR2(10) not null,
	username VARCHAR2(15) not null,
	email VARCHAR2(100),
	regdate DATE DEFAULT SYSDATE,
	updatedate DATE DEFAULT SYSDATE,
	PRIMARY KEY(userid)
)


drop table tbl_member