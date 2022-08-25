-- 테이블 초기화
-- 테이블 초기화는 전부 외래키로 짜여저있어 순서대로 행해야함 
DROP TABLE Reservation; -- 제일 상위의 테이블(모든 테이블의 외래키가 모여있음) // 수정되어서 없음

DROP TABLE Payment; -- 제일 상위 바로 아랫단계 테이블(아래 3개의 테이블의 외래키가 모여있음)

DROP TABLE Tp;      -- 고객테이블을 외래키로 가지고 있는 이동수단 테이블
DROP TABLE Travel;  -- 고객테이블을 외래키로 가지고 있는 여행지 테이블

DROP TABLE Customer; -- 제일 하위의 고객테이블

CREATE TABLE Customer(
Customer_ID    NUMBER  PRIMARY KEY, 
Customer_Name      VARCHAR2(40), 
Customer_Address    VARCHAR2(40),
Customer_Tel      VARCHAR2(40), 
Customer_SEX      VARCHAR2(40),
Customer_Birth  VARCHAR2(40)
);

CREATE TABLE Travel(
Travel_ID       NUMBER  PRIMARY KEY ,
Travel_Location          VARCHAR2(40), 
Travel_Place          VARCHAR2(40), 
Travel_Food            VARCHAR2(40)
);

CREATE TABLE Tp(
Tp_ID       NUMBER PRIMARY KEY,
Tp_Capacity   VARCHAR2(40),
Tp_Name       VARCHAR2(40),
Tp_Price    NUMBER
);

CREATE TABLE Payment(
Payment_ID    NUMBER  PRIMARY KEY,
Customer_ID    NUMBER,
Travel_ID   NUMBER,
Tp_ID   NUMBER,
CONSTRAINT FK_Customer_ID FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
CONSTRAINT FK_Travel_ID FOREIGN KEY(Travel_ID) REFERENCES Travel(Travel_ID),
CONSTRAINT FK_Tp_ID FOREIGN KEY(Tp_ID) REFERENCES Tp(Tp_ID)
);

insert into Customer values(1,'김승모','서울시 은평구','010-1234-0001','남',901122);
insert into Customer values(2,'김용선','수원시 장안구','010-5678-0002','남',910710);
insert into Customer values(3,'김호진','인천시 서구','010-1357-0003','남',920802);
insert into Customer values(4,'오세빈','고양시 일산동구','010-2468-0004','남',930511);
insert into Customer values(5,'오윤택','대구시 서구','010-9876-0005','남',940401);


insert into Travel values(101,'경주','불국사','떡갈비 한정식');
insert into Travel values(102,'부산','해운대','돼지불백');
insert into Travel values(103,'강릉','정동진','한치물회');
insert into Travel values(104,'포항','울릉도','독도새우');


insert into Tp values(1001,'4인','기아K5',10000);
insert into Tp values(1002,'9인','카니발',20000);
insert into Tp values(1003,'12인','스타리아',40000);
insert into Tp values(1004,'16인','쏠라티',60000);
insert into Tp values(1005,'20인','미니버스',80000);
insert into Tp values(1006,'30인','중형버스',100000);


insert into Payment values(10001,1,102,1002);
insert into Payment values(10002,2,102,1002);
insert into Payment values(10003,3,102,1002);
insert into Payment values(10004,4,102,1002);
insert into Payment values(10005,5,102,1002);


SELECT * FROM Customer;
SELECT * FROM Travel;
SELECT * FROM Tp;
SELECT * FROM Payment;

commit;