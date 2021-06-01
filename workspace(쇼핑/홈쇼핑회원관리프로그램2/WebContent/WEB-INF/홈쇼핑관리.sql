drop table member_tbl_02;
drop table money_tbl_02;

create table member_tbl_02(
  custno number(6) not null primary key,
custname varchar2(20),
   phone varchar2(13),
 address varchar2(60),
joindate date,
   grade char(1),
    city char(2)
);

insert into MEMBER_TBL_02 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경 1동', '20151202', 'A', '01');
insert into MEMBER_TBL_02 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경 2동', '20151206', 'B', '01');
insert into MEMBER_TBL_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도 1리', '20151001', 'B', '30');
insert into MEMBER_TBL_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도 2리', '20151113', 'A', '30');
insert into MEMBER_TBL_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into MEMBER_TBL_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');


select custno, sum(pcost*amount) as price
from money_tbl_02
group by custno;

select custno, custname, decode(grade, 'A','VIP','B','일반','C','직원'), to_char(price,'L999,999,999,999')
from member_tbl_02 
natural join 
(select custno, sum(pcost*amount) as price
from money_tbl_02
group by custno)
order by price desc;

create table money_tbl_02(
 custno number(6) not null,
salenol number(8),
  pcost number(8),
 amount number(4),
  price number(8),
  pcode varchar2(4),
  sdate date,
  primary key(custno, salenol)
);

insert into MONEY_TBL_02 values(100001, 20160001,  500, 5, 2500, 'A001', '20160101');
insert into MONEY_TBL_02 values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into MONEY_TBL_02 values(100001, 20160003,  500, 3, 1500, 'A008', '20160101');
insert into MONEY_TBL_02 values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into MONEY_TBL_02 values(100002, 20160005,  500, 1,  500, 'A001', '20160103');
insert into MONEY_TBL_02 values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into MONEY_TBL_02 values(100004, 20160007,  500, 2, 1000, 'A001', '20160104');
insert into MONEY_TBL_02 values(100004, 20160008,  300, 1,  300, 'A005', '20160104');
insert into MONEY_TBL_02 values(100004, 20160009,  600, 1,  600, 'A006', '20160104');
insert into MONEY_TBL_02 values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');


--방법 1
--select custno, custname, grade, sum(price) as price
--from member_tbl_02 natural join money_tbl_02
--group by custno, custname, grade
--order by price desc;

--방법2
--select custno, custname, grade, sum(amount * pcost) as price
--from member_tbl_02 natural join money_tbl_02
--group by custno, custname, grade
--order by price desc;

--방법3
--select custno, sum(amount * pcost) as price
--from money_tbl_02
--group by custno;
--
--select custno, custname, grade, price
--from member_tbl_02 natural join 
--(select custno, sum(amount * pcost) as price
--from money_tbl_02
--group by custno)
--order by price desc;