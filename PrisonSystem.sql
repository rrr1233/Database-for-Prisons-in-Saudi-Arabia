create table Enterprice(
Enterprice_Number number(10,0),
Enterprice_Name varchar2(20),
Locatione varchar2(20),
constraint Enterprice_Number_PK primary key (enterprice_number)
);


INSERT INTO Enterprice VALUES(0000000001,'Jed Enterprise','Alshmisi');
INSERT INTO Enterprice VALUES(0000000002,'RUH Enterprise','Almlz');
INSERT INTO Enterprice VALUES(0000000003,'TIF Enterprise','Alkhaldia');
INSERT INTO Enterprice VALUES(0000000004,'MID Enterprise','AmKhalid');
INSERT INTO Enterprice VALUES(0000000005,'TUU Enterprise','Almroj');


Create table Crime (
Crime_Number number(11,0),
Case_State varchar2(20) Check(Case_State in('Family Case', 'Criminal Case', 'Civil Case')),
Crime_Date Date Default SYSDATE,
Constraint Crime_Number_PK Primary Key(Crime_Number));


INSERT INTO Crime VALUES(11221122112,'Family Case','9-DEC-2021');
INSERT INTO Crime VALUES(11331133113,'Criminal Case','13-NOV-2022');
INSERT INTO Crime VALUES(11441144114,'Criminal Case','22-OCT-2023');
INSERT INTO Crime VALUES(11551155115,'Civil Case','11-JUN-2017');
INSERT INTO Crime VALUES(11661166116,'Family Case','29-DEC-2014');


Create table Victim (
Crime_Number number(11,0),
Victim Varchar(20),
Constraint Victim_PK Primary Key(Crime_Number, Victim),
Constraint Crime_Number_FK Foreign Key(Crime_Number) References Crime(Crime_Number));


INSERT INTO Victim VALUES(11221122112,'Sara');
INSERT INTO Victim VALUES(11331133113,'Khaled');
INSERT INTO Victim VALUES(11441144114,'Mohammed');
INSERT INTO Victim VALUES(11441144114,'Fasil');
INSERT INTO Victim VALUES(11551155115,'Soluman');
INSERT INTO Victim VALUES(11661166116,'Lara');


Create table Witness (
Crime_Number number(11,0),
Witness varchar2(20),
Constraint Witness_PK Primary Key(Crime_Number, Witness),
Constraint Crime_Number_FK2 Foreign Key(Crime_Number) References Crime(Crime_Number));


INSERT INTO Witness VALUES(11221122112,'Dr.Mohammed ALghamdi');
INSERT INTO Witness VALUES(11221122112,'miss.Fatimah ALsolmi');
INSERT INTO Witness VALUES(11331133113,'Talal Alharbi');
INSERT INTO Witness VALUES(11441144114,'Sami Khalid');
INSERT INTO Witness VALUES(11551155115,'Dr.Mi Ahmed');
INSERT INTO Witness VALUES(11661166116,'Nora');
INSERT INTO Witness VALUES(11661166116,'Bashayer');


Create table Prisoner (
Prisoner_ID number(10,0),
First_Name varchar2(10) Not null,
Last_Name varchar2(10) Not null,
Date_Of_Birth date,
Age number(3),
Entry_Date Date Default SYSDATE,
Gender varchar2(5) Check(Gender in('Male','Female')),
Years_Of_Punishment number(3,0),
Enterprice_Number number(10,0),
Constraint Prisoner_ID_PK Primary Key(Prisoner_ID),
Constraint EnterPrice_FK Foreign Key(Enterprice_Number) References Enterprice(Enterprice_Number)
);


INSERT INTO Prisoner VALUES(1111111111,'Fahad','Alsofane','9-DEC-1990',33,'11-JUN-2021','Male',20,0000000001);
INSERT INTO Prisoner VALUES(1111111112,'Salim','Asiri','2-OCT-1982',41,'17-NOV-2022','Male',3,0000000001);
INSERT INTO Prisoner VALUES(1111111113,'Saad','Alghamdi','4-SEP-1998',25,'14-DEC-2021','Male',17,0000000002);
INSERT INTO Prisoner VALUES(1111111114,'Tariq','ALshihre','22-NOV-2000',23,'27-OCT-2007','Male',5,0000000003);
INSERT INTO Prisoner VALUES(1111111115,'Hossam','ALqhtani','1-OCT-1992',31,'5-NOV-2012','Male',1,0000000004);


Create table Participating_Criminal (
Crime_Number number(11,0),
Prisoner_ID number(10,0),
Constraint Crime_Number_FK3 Foreign Key(Crime_Number) References Crime(Crime_Number),
Constraint Prisoner_ID_FK Foreign Key(Prisoner_ID) References Prisoner(Prisoner_ID),
Constraint Participating_Criminal_PK Primary Key(Crime_Number, Prisoner_ID)
);


INSERT INTO Participating_Criminal VALUES(11221122112,1111111111);
INSERT INTO Participating_Criminal VALUES(11331133113,1111111112);
INSERT INTO Participating_Criminal VALUES(11441144114,1111111113);
INSERT INTO Participating_Criminal VALUES(11551155115,1111111114);
INSERT INTO Participating_Criminal VALUES(11661166116,1111111115);



Create table Visitor (
Visitor_ID number(10,0),
First_Name varchar2(10) NOT NULL,
Last_Name varchar2(10) NOT NULL,
Constraint Visitor_ID_PK Primary Key(Visitor_ID));
R ., [Nov 10, 2022 at 11:15 AM]
INSERT INTO Visitor VALUES(4256377721,'Huda','Alsofane');
INSERT INTO Visitor VALUES(6662331198,'Abdulah','Asiri');
INSERT INTO Visitor VALUES(6774322190,'Salim','ALghamdi');
INSERT INTO Visitor VALUES(9443222217,'ghada','ALharbi');
INSERT INTO Visitor VALUES(7651190865,'mriam','ALzharine');
INSERT INTO Visitor VALUES(7611190865,'Khalid','ALzharine');


Create table Visitor_Prisoner(
Visitor_ID number(10,0),
Prisoner_ID number(10,0),
Relation varchar2(10) Check(Relation in('Wife', 'Husband','Sibling', 'Parent')),
Constraint Prisoner_ID_FK2 Foreign Key(Prisoner_ID) References Prisoner(Prisoner_ID),
Constraint Visitor_ID_FK Foreign Key(Visitor_ID) References Visitor(Visitor_ID),
Constraint Visitor_Prisoner_PK Primary Key(Visitor_ID, Prisoner_ID)
);


INSERT INTO Visitor_Prisoner VALUES(4256377721,1111111111,'Wife');
INSERT INTO Visitor_Prisoner VALUES(6662331198,1111111112,'Sibling');
INSERT INTO Visitor_Prisoner VALUES(6774322190,1111111113,'Parent');
INSERT INTO Visitor_Prisoner VALUES(9443222217,1111111114,'Husband');
INSERT INTO Visitor_Prisoner VALUES(7651190865,1111111115,'Sibling');
INSERT INTO Visitor_Prisoner VALUES(7611190865,1111111115,'Sibling');


Create table Equipment (
Equipment_ID number(10,0),
Enterprice_Number number(10,0),
Type varchar2(10),
Quantity number(10,0),
Warehouse_Number number(10,0) not null,
Constraint EnterPrice_FK2 Foreign Key(Enterprice_Number) References Enterprice(Enterprice_Number),
Constraint Equipment_PK Primary Key(Equipment_ID)
);


INSERT INTO Equipment VALUES(311111,0000000001,'guns',3000,130);
INSERT INTO Equipment VALUES(311122,0000000002,'gas bomb',6000,130);
INSERT INTO Equipment VALUES(311133,0000000003,'1st aid',20000,120);
INSERT INTO Equipment VALUES(311144,0000000004,'hooks',5000,110);
INSERT INTO Equipment VALUES(311155,0000000005,'noose',300,110);


create table Item(
Item_Number number(4),
Item_Name varchar2(20),
Constraint item_pk Primary Key(Item_number)
);


INSERT INTO Item VALUES(1111,'bullet');
INSERT INTO Item VALUES(1122,'silencer');
INSERT INTO Item VALUES(1133,'magazine');
INSERT INTO Item VALUES(1144,'clip');
INSERT INTO Item VALUES(1155,'keys');


create table Supplier(
Sup_Number number(10,0),
Supplier_Name varchar2(20),
constraint Sup_Number_PK primary key(Sup_Number)
);


INSERT INTO Supplier VALUES (4000,'MoFA');
INSERT INTO Supplier VALUES (4100,'MoD');
INSERT INTO Supplier VALUES (4200,'IA');
INSERT INTO Supplier VALUES (4300,'PSA');
INSERT INTO Supplier VALUES (4400,'AGAoAaE');


create table Item_eq(
Item_Number number(4),
Eq_Number number(10,0),
Sup_Number number(10,0),
constraint Item_eq_pk primary key (Item_Number,Eq_Number,Sup_Number),
Constraint item_number_fk Foreign Key(Item_Number) References Item(Item_Number),
Constraint Eq_Number_fk Foreign Key(Eq_Number) References Equipment(Equipment_ID),
Constraint Sup_Number_fk Foreign Key(Sup_Number) References supplier(Sup_Number)

);


INSERT INTO Item_eq VALUES (1111,311111,4000);
INSERT INTO Item_eq VALUES (1122,311122,4400);
INSERT INTO Item_eq VALUES (1133,311133,4300);
INSERT INTO Item_eq VALUES (1144,311144,4300);
INSERT INTO Item_eq VALUES (1155,311144,4200);

create table Department(
Dep_Number number(10,0),
Enterprice_Number number(10,0),
Dep_Name varchar2(20),
constraint Dep_Number_PK primary key (Dep_Number),
constraint Enterprice_Number_FK foreign key (Enterprice_Number) references Enterprice (Enterprice_Number)
);


INSERT INTO Department VALUES (91,0000000001,'FINANCIAL MANAGEMNT');
INSERT INTO Department VALUES (92,0000000001,'911 CALL CENTER');
INSERT INTO Department VALUES (93,0000000003,'ARREST');
INSERT INTO Department VALUES (94,0000000005,'INVESTIGATION');
INSERT INTO Department VALUES (95,0000000004,'Prisoner');


create table Employee (
Emp_id number(10,0),
First_Name varchar2(10) NOT NULL,
Last_Name varchar2(15) NOT NULL,
Date_Of_Hiring Date  default SYSDATE,
Years_Of_Duty number(3),
Salary number(10,0),
Age number(5),
Address varchar2(20),
Gender varchar2(6) check(Gender in('Male','Female')),
Phone_Number number(10,0),
Typee varchar2(10),
R ., [Nov 10, 2022 at 11:15 AM]
constraint Emp_id_PK primary key (Emp_id),
constraint Manager_id_FK foreign key (Emp_id) References Employee(Emp_id)
);


INSERT INTO Employee VALUES(120000,'Abdullah','AL-Rogi','20-OCT-2012',10,12000,36,'TIF','Male',9665543789,'Gaurd');
INSERT INTO Employee VALUES(190070,'Arwa','AL-Ghamdi','03-JAN-2019',3,7500,28,'JED','Female',9665599250,'Driver');
INSERT INTO Employee VALUES(150140,'Waad','AL-Saad','16-MAR-2015',7,15000,33,'RID','Female',9665603004,'Maneger');
INSERT INTO Employee VALUES(200005,'Salem','AS-Sharif','02-MAR-2020',2,7500,28,'TUU','Male',9665473627,'Driver');
INSERT INTO Employee VALUES(170067,'Mohammed','AL-Sahafi','07-OCT-2017',5,13500,30,'MID','Male',9665526926,'Maneger');
INSERT INTO Employee VALUES(180010,'Reham','AL-Ghamdi','15-FEB-2018',4,4700,27,'JED','Female',9665659066,'Gaurd');
INSERT INTO Employee VALUES(210045,'Shahd','AL-Shamari','02-DEC-2021',1,7000,26,'RID','Female',9665757790,'Driver');
INSERT INTO Employee VALUES(160565,'Mohammed','AL-Shirari','08-MAY-2016',6,8600,34,'TUU','Male',9665765490,'Driver');
INSERT INTO Employee VALUES(120976,'Saad','AL-Mutairi','14-SEP-2012',10,10000,37,'RID','Male', 9665342729,'Driver');
INSERT INTO Employee VALUES(160985,'Majed','AL-Zahrani','25-MAY-2016',6,5300,30,'JED','Male',9665577624,'Gaurd');
INSERT INTO Employee VALUES(189850,'Reem','AS-Saleh','28-DEC-2018',4,4700,29,'TUU','Female',9665659176,'Gaurd');
INSERT INTO Employee VALUES(189854,'Ameer','AL-Harbi','06-JUL-2016',6,5300,31,'MID','Male',9665556724,'Gaurd');


create table Gaurd(
G_Emp_id number(10,0),
The_Gaurd_Section number(10,0),
constraint G_Emp_id_PK primary key (G_Emp_id)
);


INSERT INTO Gaurd VALUES (120000,21);
INSERT INTO Gaurd VALUES (180010,23);
INSERT INTO Gaurd VALUES (160985,23);
INSERT INTO Gaurd VALUES (189850,21);
INSERT INTO Gaurd VALUES (189854,21);


create table Vehicle(
Vehicle_Number number(4),
D_Emp_id number(10,0),
Vehicle_type varchar2(10),
constraint Vehicle_Number_PK primary key (Vehicle_Number)
);


INSERT INTO Vehicle VALUES(1276,190070,'Car');
INSERT INTO Vehicle VALUES(1270,200005,'Car');
INSERT INTO Vehicle VALUES(1277,210045,'Car');
INSERT INTO Vehicle VALUES(1298,160565,'Van');
INSERT INTO Vehicle VALUES(1290,120976,'Van');


select* from Enterprice;
select* from Crime;
select* from Victim;
select* from Witness;
select* from Prisoner;
select* from Participating_Criminal;
select* from Visitor;
select* from Visitor_Prisoner;
select* from Equipment;
select* from Item;
select* from Item_eq;
select* from supplier;
select* from Department;
select* from Employee;
select* from Gaurd;
select* from Vehicle;

select supplier_name, type ,quantity
from supplier , item_eq , equipment
where equipment.equipment_id = item_eq.eq_number and supplier.sup_number=item_eq.sup_number and type = 'guns' and supplier_name='MoFA';


select supplier_name, type ,quantity
from supplier , equipment
where (equipment.equipment_id , supplier.sup_number ) =
(select equipment.equipment_id , supplier.sup_number
from supplier , equipment ,item_eq
where equipment.equipment_id =item_eq.eq_number and supplier.sup_number= item_eq and type= 'guns' and Supplier_Name = 'MoFA');
