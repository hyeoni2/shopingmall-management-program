drop table member;
drop table grade;
drop table buy;

create table member(
memno char(4) not null primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4)
);


insert into member values('1001', '김고객', '경북 경산시 중방동', '02/01/01', 'F', '010', '1234', '1001');
insert into member values('1002', '이고객', '경북 경산시 삼북동', '02/02/01', 'M', '010', '1234', '1002');
insert into member values('1003', '박고객', '경북 경산시 옥산동', '02/03/01', 'M', '010', '1234', '1003');
insert into member values('1004', '조고객', '대구 광역시 달서구', '02/04/01', 'M', '010', '1234', '1004');
insert into member values('1005', '유고객', '대전 광역시 유성구', '02/05/01', 'M', '010', '1234', '1005');
insert into member values('1006', '여고객', '대구 광역시 수성구', '02/06/01', 'M', '010', '1234', '1006');
insert into member values('1007', '남고객', '충남 금산군 중도리', '02/07/01', 'F', '010', '1234', '1007');
insert into member values('1008', '황고객', '서울 특별시 관악구', '02/08/01', 'F', '010', '1234', '1008');
insert into member values('1009', '전고객', '서울 특별시 강서구', '02/09/01', 'F', '010', '1234', '1009');

select * from member;


-----------------select.jsp-----------------
--select memno,name, address,
--to_char(hiredate, 'yyyy.mm.dd.'), 
--decode(gender, 'M','남','F','여'),
-- tel1, tel2, tel3
--from member;
--
----------------deleate 조건--------------------
--delete from member where 컬럼명 = 컬럼값; 


create table grade(
memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values(1, 150001, 500000);
insert into grade values(2, 100001, 150000);
insert into grade values(3, 50001, 100000);
insert into grade values(4, 1, 50000);

select * from grade;

create table buy(
memno char(4) not null,
prodno char(4) not null,
product varchar2(20) not null,
price number(30),
bno number(30),
primary key(memno, prodno)
);

insert into buy values('1009', '0001', '긴 바지', 30000, 4);
insert into buy values('1009', '0002', '점퍼', 100000, 1);
insert into buy values('1006', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1006', '0002', '점퍼', 100000, 1);
insert into buy values('1005', '0003', '반팔 셔츠', 20000, 3);
insert into buy values('1002', '0003', '반팔 셔츠', 20000, 2);
insert into buy values('1002', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0004', '긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0005', '긴팔 후드티', 23000, 2);

select * from buy;

-----------------select2.jsp-----------------
--조인순서 : natural join >결과가 안나오면
--		  inner join(=join) : 등가조인(=같은 컬럼 있을 시)
--		  					  비등가조인(같은 컬럼 없을 시)
--		  outer join(full > left > right)

--[방법1-1] > inner join
--select 속성들(컬럼의 이름)
--from 테이블명1, 테이블명2
--where 조인조건
--and 검색조건;

--[방법1-2] > inner join
--select 속성들(컬럼의 이름)
--from 테이블명1, 테이블명2
--where 조인조건
--and 검색조건 or 검색조건2;
--(우선순위로 문제 발생이 됨 and가 높아서 조인조건 + 조건1을 조인조건으로 생각)

--[방법2] > inner join
--select 속성들(컬럼의 이름)
--from 테이블명1 join 테이블명2
--on 조인조건;
--where 검색조건
--
--select
--(member의 별칭, buy의 별칭을 주고 둘을 합친다)
--from member m  join buy b
--(공통된 회원번호는 똑같음을 나타냄)
--on m.memno = b.memno;

--[등가방식]
--select *
--from member m join buy b
--on m.memno = b.memno;
--
--
--select m.memno(어디에 뭐가 있는지 정확히 알려줘야), price, bno
--from member m join buy b
--on m.memno = b.memno;


select memno, name, sum(price*bno) as amount
from member natural join buy
group by memno, name;

select 
decode(memgrade, '1', 'VIP', '2', 'Gold', '3', 'Silver', '4', 'Normal'),
memno, name, amount
from grade join (select memno, name,
					sum(price*bno) as amount
						from member natural join buy
							group by memno, name)
on amount between loprice and hiprice
order by amount desc;
