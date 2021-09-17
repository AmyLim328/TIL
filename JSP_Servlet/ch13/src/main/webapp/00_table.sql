DROP TABLE tblPollList;

CREATE TABLE tblPollList (
  num NUMBER(6) NOT NULL,
  question VARCHAR(200) NOT NULL,
  sdate DATE DEFAULT NULL,
  edate DATE DEFAULT NULL,
  wdate DATE DEFAULT NULL,
  TYPE NUMBER(6) NOT NULL,
  active NUMBER(6),
  PRIMARY KEY (num)
);

DROP TABLE tblPollItem;

CREATE TABLE tblPollItem (
  listnum NUMBER(6) NOT NULL,
  itemnum NUMBER(6) NOT NULL,
  item varchar(50) NOT NULL,
  cnt NUMBER(6) NOT NULL,
  PRIMARY KEY (listnum, itemnum)
); 

commit

select * from tblPollList;
select * from tblPollItem;