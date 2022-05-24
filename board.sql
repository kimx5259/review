CREATE TABLE tbl_board(
bno NUMBER,
title VARCHAR2(60) NOT NULL,
content VARCHAR2(3000) NOT NULL,
userid VARCHAR2(6) NOT NULL,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT SYSDATE,
viewcnt NUMBER DEFAULT 0,
CONSTRAINT pk_board_bno PRIMARY KEY(bno),
CONSTRAINT fk_board_userid foreign KEY(userid) references tbl_member (userid) ON DELETE CASCADE 
)

drop table tbl_board CASCADE CONSTRAINTS

