-- ���̺� �ʱ�ȭ
-- ���̺� �ʱ�ȭ�� ���� �ܷ�Ű�� ¥�����־� ������� ���ؾ��� 
DROP TABLE Reservation; -- ���� ������ ���̺�(��� ���̺��� �ܷ�Ű�� ������) // �����Ǿ ����

DROP TABLE Payment; -- ���� ���� �ٷ� �Ʒ��ܰ� ���̺�(�Ʒ� 3���� ���̺��� �ܷ�Ű�� ������)

DROP TABLE Tp;      -- �����̺��� �ܷ�Ű�� ������ �ִ� �̵����� ���̺�
DROP TABLE Travel;  -- �����̺��� �ܷ�Ű�� ������ �ִ� ������ ���̺�

DROP TABLE Customer; -- ���� ������ �����̺�

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

insert into Customer values(1,'��¸�','����� ����','010-1234-0001','��',901122);
insert into Customer values(2,'��뼱','������ ��ȱ�','010-5678-0002','��',910710);
insert into Customer values(3,'��ȣ��','��õ�� ����','010-1357-0003','��',920802);
insert into Customer values(4,'������','���� �ϻ굿��','010-2468-0004','��',930511);
insert into Customer values(5,'������','�뱸�� ����','010-9876-0005','��',940401);


insert into Travel values(101,'����','�ұ���','������ ������');
insert into Travel values(102,'�λ�','�ؿ��','�����ҹ�');
insert into Travel values(103,'����','������','��ġ��ȸ');
insert into Travel values(104,'����','�︪��','��������');


insert into Tp values(1001,'4��','���K5',10000);
insert into Tp values(1002,'9��','ī�Ϲ�',20000);
insert into Tp values(1003,'12��','��Ÿ����',40000);
insert into Tp values(1004,'16��','���Ƽ',60000);
insert into Tp values(1005,'20��','�̴Ϲ���',80000);
insert into Tp values(1006,'30��','��������',100000);


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