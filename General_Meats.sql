/* This creates the database for 
General Meats a locally sourced farm to table
butcher shop
Gavin Erezuma
December 2019*/

use General_Meats;

/* **********Drop Statements******** */

drop table if exists Vendor_Grocery_Link;
drop table if exists Vendor_Dry_Goods_Link;
drop table if exists Vendor_Species_Link;
drop table if exists Employee_Schedule_Link;
drop table if exists Emp_Schedule;
drop table if exists Day_Of_Week;
drop table if exists Purchase_Order;
drop table if exists Customer;
drop table if exists Employee;
drop table if exists Human_Resources;
drop table if exists Insurance;
drop table if exists Emp_Schedule;
drop table if exists Species_Cuts_Link;
drop table if exists Species;
drop table if exists Cuts;
drop table if exists Grocery;
drop table if exists Dry_Goods;
drop table if exists Vendor;
drop table if exists Address;
drop table if exists Phone;
drop table if exists Email;


/* ******Table Creations******* */

create table Address
(
address_id int not null auto_increment,
street varchar(30) not null,
city varchar(30) not null,
state varchar(2) not null,
zip varchar (6) not null,

constraint Address_pk
	primary key (address_id)
);

 create table Phone
 (
phone_id int not null auto_increment, 
phone_house varchar(16) default null,
phone_cell varchar(16) default null,
phone_business varchar(16) default null,
phone_fax varchar(16) default null,

constraint Phone_pk
	primary key(phone_id)

 );

create table Email
(
email_id int not null auto_increment,
email_address varchar(50) default null,

constraint Email_pk
	primary key (email_id)
);

create table Insurance
(
insurance_id int not null auto_increment,
vision bit default 0 not null,
dental bit default 0 not null,
medical bit default 0 not null,

constraint Insurance_pk
	primary key (insurance_id)
);

create table Human_Resources
(
hr_id int not null auto_increment,
pay_rate_per_hour decimal(9,2) not null default 10.00,
address_id int not null,
phone_id int not null,
email_id int not null,
insurance_id int not null,
department varChar(20),

constraint Human_Resources_pk
	primary key (hr_id),
constraint Human_Resources_fk_Address
	foreign key (address_id) references Address (address_id),
constraint Human_Resources_fk_Phone
	foreign key (phone_id) references Phone (phone_id),
constraint Human_Resources_fk_Email
	foreign key (email_id) references Email (email_id),
constraint Human_Resources_fk_Insurnace
	foreign key (insurance_id) references Insurance (insurance_id)
);

create table Employee
(
employee_id int not null auto_increment,
first_name varchar(30) not null,
last_name varchar(30) not null,
hr_id int not null,

constraint Employee_pk
	primary key (employee_id),
constraint Employee_fk_Human_Resources
	foreign key (hr_id) references Human_Resources (hr_id)
);

create table Day_Of_Week
(
day_id int not null auto_increment,
week_day varChar(9),

constraint Day_Of_Week_pk primary key(day_id)
);

create table Emp_Schedule
(
emp_schedule_id int not null auto_increment,
day_id int not null,
start_shift time,
end_shift time,

constraint Emp_Schedule_pk
		primary key (emp_schedule_id),
constraint Emp_Schedule_fk_Day_Of_Week
	foreign key (day_id) references Day_Of_Week (day_id)
);

/* *****linking table for employee and schedule***** */

create table Employee_Schedule_Link
(
employee_id int not null,
emp_schedule_id int not null,

constraint Employee_Schedule_Link_pk primary key(employee_id, emp_schedule_id),
constraint fk_Employee_Schedule_Link_Employee foreign key (employee_id) references Employee (employee_id),
constraint fk_Employee_Schedule_Link_Emp_Schedule foreign key (emp_schedule_id) references Emp_Schedule (emp_schedule_id)
);

create table Species
(
species_id int not null auto_increment,
species_type varchar(20),

constraint Species_pk
	primary key (species_id)
);
create table Vendor
(
vendor_id int not null auto_increment,
vendor_name varChar(50) not null,
address_id int not null,
phone_id int not null,
email_id int not null,

constraint Vendor_pk
	primary key (vendor_id),
constraint Vendor_fk_Address
	foreign key (address_id) references Address (address_id),
    constraint Vendor_fk_Phone
	foreign key (phone_id) references Phone (phone_id),
constraint Vendor_fk_Email
	foreign key (email_id) references Email (email_id)
);

create table Cuts
(
cuts_id int not null auto_increment,
cut_name varchar(50),

constraint Cuts_pk
	primary key (cuts_id)
);

/* ********linking table for species and cuts****** */
create table Species_Cuts_Link
(
species_id int not null,
cuts_id int not null,

constraint pk_Species_Cuts_Link primary key (species_id, cuts_id),
constraint fk_Species_Cuts_Link_Species foreign key (species_id) references Species(species_id),
constraint fk_Species_Cuts_Link_Cuts foreign key (cuts_id ) references Cuts(cuts_id)
);

/* ********linking table for vendor and species****** */
create table Vendor_Species_Link
(
species_id int not null,
vendor_id int not null,
vendors_price decimal(9,2),

constraint pk_Vendor_Species_Link primary key (species_id, vendor_id),
constraint fk_Vendor_Species_Link_Species foreign key (species_id) references Species(species_id),
constraint fk_Vendor_Species_Link_Vendor foreign key (vendor_id) references Vendor(vendor_id)
);

create table Grocery
(
grocery_id int not null auto_increment,
item_name varchar(50) not null,
case_size int,
unit_price decimal(9,2) not null,

constraint Gorcery_pk
	primary key (grocery_id)
);

create table Dry_Goods
(
dry_goods_id int not null auto_increment,
item_name varchar(50) not null,
case_size int,
unit_price decimal(9,2) not null,

constraint Dry_Goods_pk
	primary key (dry_goods_id)
);

create table Customer
(
customer_id int not null auto_increment,
last_name varChar(20),
first_name varChar (20),

constraint pk_Customer primary key (customer_id)
);


create table Purchase_Order
(
purchase_id int not null auto_increment,
customer_id int not null,
species_id int not null,
species_type varChar(20),
cut_id int not null,
cut_name varChar (50),
quantity int,
purchase_time time,
purchase_price decimal(9,2),


constraint pk_Purchase_Order primary key (purchase_id),
constraint fk_Purchase_Order_Customer foreign key (customer_id) references Customer (customer_id),
constraint fk_Purchase_Order_Species foreign key (species_id) references Species(species_id)

);

create table Vendor_Grocery_Link
(
grocery_id int not null,
vendor_id int not null,
vendors_price decimal(9,2),

constraint pk_Vendor_Grocery_Link primary key (grocery_id, vendor_id),
constraint fk_Vendor_Grocery_Link_Grocery foreign key (grocery_id) references Grocery(grocery_id),
constraint fk_Vendor_Grocery_Link_Vendor foreign key (vendor_id) references Vendor(vendor_id)
);

create table Vendor_Dry_Goods_Link
(
dry_goods_id int not null,
vendor_id int not null,
vendors_price decimal(9,2),

constraint pk_Vendor_Dry_Goods_Link primary key (dry_goods_id, vendor_id),
constraint fk_Vendor_Dry_Goods_Link_Dry_Goods foreign key (dry_goods_id) references Dry_Goods(dry_goods_id),
constraint fk_Vendor_Dry_Goods_Link_Vendor foreign key (vendor_id) references Vendor(vendor_id)
);


/* *********Table Alters*********** */

alter table Employee auto_increment=100;
alter table Dry_Goods auto_increment=200;
alter table Cuts auto_increment=500;
alter table Species auto_increment=600;
alter table Grocery auto_increment = 700;
alter table Vendor auto_increment=1000;
alter table Address auto_increment=2000;
alter table Phone auto_increment=3000;
alter table Email auto_increment=4000;
alter table Insurance auto_increment=7000;
alter table Human_Resources auto_increment=8000;

/* ************Inserts************* */

insert into Email values
(default,"Mike's Ruminants@yahoo.com"),
(default,"Tony's Pigs@gmail.com"),
(default,"Frank's Birds@gmail.com"),
(default,"Prather Ranch@aol.com"),
(default,"Chicken Coup Farms.com"),
(default,"whostillhasAOL@aol.com"),
(default,"Lori2389@earthlink.com"),
(default,"thefan28workswell@gmail.com"),
(default,"thefan28workswell@gmail.com"),
(default,"CiaoRagaza@gmail.com");

insert into Phone values
(default, default, default, 4153980322,default),
(default, default, default, 4153786490,default),
(default, default, default, 4154839284,default),
(default, default, default, 5103980322,default),
(default, default, default, 5108937653,default),
(default, 5103452389, 4158930092,default,default),
(default, 4154769032, 9177293141,default,default),
(default, default, 4158439221,default,default),
(default, default, 4158234231,default,default),
(default, default, 4153423224,default,default);


insert into Address values
(default,"20 Monigue Way","San Francisco","CA","94127"), 
(default,"589 Piper Street","Oakland","CA","94607"), 
(default,"239 D Street","San Rafael","CA","94901"), 
(default,"982 Hazelnut Ave","San Jose","CA","95050"), 
(default,"125 Evergreen Blvd","Novato","CA","94947"), 
(default,"984 Ornage Lane","Oakland","CA","94930"),
(default,"453 A Street","San Rafael","CA","94901"),
(default,"3645 B Street","San Rafael","CA","94901"),
(default,"345 C Street","San Rafael","CA","94901"),
(default,"7654 D Street","San Rafael","CA","94901"),
(default,"547 E Street","San Rafael","CA","94901"),
(default,"947 F Street","San Rafael","CA","94901");

insert into Insurance values
(default,0,0,0),
(default,1,0,0),
(default,0,1,0),
(default,0,0,1),
(default,1,1,0),
(default,1,0,1),
(default,0,1,1),
(default,1,1,1);

insert into Human_Resources values
(default, 12.50, 2006, 3005, 4005, 7003, "Butcher"),
(default, 14.00, 2007, 3006, 4006, 7005, "Front House"),
(default, 20.00, 2008, 3007, 4007, 7005, "Butcher"),
(default, 25.50, 2009, 3008, 4008, 7007, "Front House");

insert into Employee values
(default,"Gavin","Erezuma",8000),
(default,"Martin","Fullone",8001),
(default,"George","Lopresti",8002),
(default,"Aldo","Baraverro",8003);

insert into Vendor values
(default, "Mike's Ruminants", 2000, 3000, 4000),
(default, "Tony's Pigs", 2001, 3001, 4001),
(default, "Frank's Birds", 2002, 3002, 4002),
(default, "Prather Ranch", 2003, 3003, 4003),
(default, "Chicken Coup Farms", 2004, 3004, 4004);

insert into Cuts values
-- ruminants
(default, "Boneless Short Rib"),
(default, "BoneIn Short Rib"),
(default, "Stew Meat"),
(default, "Shabu Shabu"),
(default, "Neck Roll"),
(default, "Chuck Eye Prime Roast"),
(default, "Chuck Eye Steak"),
(default, "Chuck Roll"),
(default, "Flat Iron"),
(default, "Mock Tender Loin"),
(default, "Cross Rib Roast"),
(default, "Petite Tender"),
(default, "Marrow Bones"),
(default, "Ribeye Boneless"),
(default, "Ribeye BoneIn"),
(default, "Prime Rib Roast"),
(default, "Skirt Steak"),
(default, "Flank Steak"),
(default, "Bavette"),
(default, "Strip Loin"),
(default, "NY Strip Steak"),
(default, "PorterHouse"),
(default, "Tenderloin"),
(default, "Coulette"),
(default, "Top Sirloin"),
(default, "Chateau Brinad"),
(default, "Spider Steak"),
(default, "Poire"),
(default, "London Broil"),
(default, "Sirloin Steak"),
(default, "Bottom Round"),
(default, "Top Round"),
(default, "Velvet Steak"),
(default, "Ossobucco"),
-- chickens
(default, "Leg"),
(default, "Thigh"),
(default, "Breast"),
(default, "Whole Bird"),
(default, "Half Bird"),
-- pigs
(default, "Trotters"),
(default, "Ears"),
(default, "Whole Pig"),
(default, "Half Pig"),
(default, "Whole Leg"),
(default, "Whole Animal");

insert into Species values
(default, "Beef"),
(default, "Lamb"),
(default, "Goat"),
(default, "Rabbit"),
(default, "Pig"),
(default, "Chicken"),
(default, "Turkey");


insert into Vendor_Species_Link values
(600, 1000 , 10.00),
(600, 1003 , 9.50),
(601, 1000 , 7.99),
(601, 1003, 7.59),
(602, 1003, 8.75),
(602, 1000 , 12.00),
(603, 1003, 9.50),
(604, 1001, 5.89),
(605, 1002, 4.50),
(605, 1004, 3.80),
(606, 1002, 2.75),
(606, 1004, 2.85);

insert into Day_Of_Week values
(default, "Sunday"),
(default, "Monday"),
(default, "Tuesday"),
(default, "Wednesday"),
(default, "Thursday"),
(default, "Friday"),
(default, "Saturday");

insert into Emp_Schedule values
(default, 1, "06:00:00", "14:30:00"),
(default, 2, "06:00:00", "14:30:00"),
(default, 3, "06:00:00", "14:30:00"),
(default, 4, "06:00:00", "14:30:00"),
(default, 5, "06:00:00", "14:30:00"),
(default, 6, "06:00:00", "14:30:00"),
(default, 7, "06:00:00", "14:30:00"),
(default, 1, "10:00:00", "18:30:00"),
(default, 2, "10:00:00", "18:30:00"),
(default, 3, "10:00:00", "18:30:00"),
(default, 4, "10:00:00", "18:30:00"),
(default, 5, "10:00:00", "18:30:00"),
(default, 6, "10:00:00", "18:30:00"),
(default, 7, "10:00:00", "18:30:00"),
(default, 1, "12:00:00", "20:30:00"),
(default, 2, "12:00:00", "20:30:00"),
(default, 3, "12:00:00", "20:30:00"),
(default, 4, "12:00:00", "20:30:00"),
(default, 5, "12:00:00", "20:30:00"),
(default, 6, "12:00:00", "20:30:00"),
(default, 7, "12:00:00", "20:30:00"),
(default, 1, "12:30:00", "21:00:00"),
(default, 2, "12:30:00", "21:00:00"),
(default, 3, "12:30:00", "21:00:00"),
(default, 4, "12:30:00", "21:00:00"),
(default, 5, "12:30:00", "21:00:00"),
(default, 6, "12:30:00", "21:00:00"),
(default, 7, "12:30:00", "21:00:00");

insert into Employee_Schedule_Link values

(101,8),
(101,9),
(101,10),
(101,12),
(101,13),
(102,15),
(102,16),
(102,17),
(102,18),
(102,19);


insert into Species_Cuts_Link values
(600,500),
(600,501),
(600,502),
(600,503),
(600,504),
(600,505),
(600,506),
(600,507),
(600,508),
(600,509),
(600,510),
(600,511),
(600,512),
(600,513),
(600,514),
(600,515),
(600,516),
(600,517),
(600,518),
(600,519),
(600,520),
(600,521),
(600,522),
(600,523),
(600,524),
(600,525),
(600,526),
(600,527),
(600,528),
(600,529),
(600,530 ),
(600,531 ),
(600,532 ),
(600,533 ),
(601,500 ),
(601,501 ),
(601,502 ),
(601,503 ),
(601,504 ),
(601,505 ),
(601,506 ),
(601,507 ),
(601,508 ),
(601,509 ),
(601,510 ),
(601,511 ),
(601,512 ),
(601,513 ),
(601,514 ),
(601,515 ),
(601,516 ),
(601,517 ),
(601,518 ),
(601,519 ),
(601,520 ),
(601,521 ),
(601,522 ),
(601,523 ),
(601,524 ),
(601,525 ),
(601,526 ),
(601,527 ),
(601,528 ),
(601,529 ),
(601,530 ),
(601,531 ),
(601,532 ),
(601,533 ),
(602,500 ),
(602,501 ),
(602,502 ),
(602,503 ),
(602,504 ),
(602,505 ),
(602,506 ),
(602,507 ),
(602,508 ),
(602,509 ),
(602,510 ),
(602,511 ),
(602,512 ),
(602,513 ),
(602,514 ),
(602,515 ),
(602,516 ),
(602,517 ),
(602,518 ),
(602,519 ),
(602,520 ),
(602,521 ),
(602,522 ),
(602,523 ),
(602,524 ),
(602,525 ),
(602,526 ),
(602,527 ),
(602,528 ),
(602,529 ),
(602,530 ),
(602,531 ),
(602,532 ),
(602,533 ),
(603,544 ),
(605,534 ),
(605,535 ),
(605,536 ),
(605,537 ),
(605,538 ),
(606,534 ),
(606,535 ),
(606,536 ),
(606,537 ),
(606,538 ),
(604,539 ),
(604,540 ),
(604,541 ),
(604,542 ),
(604,543 );





