/* adding to tables for General_Meats Schema*/

use General_Meats;

-- primary key Reference Guide

-- Employee auto_increment=100;
-- Address auto_increment=2000;
-- Phone auto_increment=3000;
-- Email auto_increment=4000;
-- Insurance auto_increment=7000;
-- Human_Resources auto_increment=8000;

-- "Mike's Ruminants", 2000, 3000, 4000),
-- (default, "",2001, 3003, 4002),
-- (default, "",2002, 3004, 4003),
-- (default, "",2004, 3002, 4001),
-- (default, "",

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


 -- create table Phone

-- phone_id int not null auto_increment, 
-- phone_house bigint default null,
-- phone_cell bigint default null,
-- phone_business varchar(20) default null,
-- phone_fax varchar(20) default null,
-- phone_country_code int default 1,

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


-- create table Address

-- address_id int not null auto_increment,
-- street varchar(30) not null,
-- apartment_number varchar(20) default null,
-- city varchar(30) not null,
-- state varchar(2) not null,
-- zip varchar (6) not null,
-- country varchar(74) default "United States",

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




-- create table Insurance

-- insurance_id int not null auto_increment,
-- vision bit default 0 not null,
-- vision_decuction decimal(9,2) default 0,
-- dental bit default 0 not null,
-- dentaldecuction decimal(9,2) default 0,
-- medical bit default 0 not null,
-- medical_decuction decimal(9,2) default 0,

insert into Insurance values
(default,0,0,0,0,0,0),
(default,1,2.50,0,0,0,0),
(default,0,0,1,7.50,0,0),
(default,0,0,0,0,1,250.00),
(default,1,2.50,1,7.50,0,0),
(default,1,2.50,0,0,1,250.00),
(default,0,0,1,7.50,1,250.00),
(default,1,2.50,1,7.50,1,250.00);


-- create table Human_Resources

-- hr_id int not null auto_increment,
-- pay_rate_per_hour decimal(9,2) not null default 10.00,
-- deductions decimal(9,2),
-- address_id int not null,  Address auto_increment=2000;
-- phone_id int not null,  Phone auto_increment=3000;
-- email_id int not null,  Email auto_increment=4000;
-- insurance_id int not null,  Insurance auto_increment=7000;

insert into Human_Resources values
(default, 12.50, 0, 2006, 3005, 4005, 7003),
(default, 14.00, 0, 2007, 3006, 4006, 7005),
(default, 20.00, 0, 2008, 3007, 4007, 7005),
(default, 25.50, 0, 2009, 3008, 4008, 7007);


-- create table Employee
-- (
-- employee_id int not null auto_increment,
-- last_name varchar(30) not null,
-- first_name varchar(30) not null,
-- middle_name varchar(30) default null,
-- hr_id int not null,  Human_Resources auto_increment=8000;
-- address_id int not null, Address auto_increment=2000;

insert into Employee values
(default,"Gavin","Erezuma",8000),
(default,"Martin","Fullone",8001),
(default,"George","Lopresti",8002),
(default,"Aldo","Baraverro",8003);

-- create table Vendor
-- vendor_id int not null auto_increment,
-- vendor_name varChar(50) not null,
-- address_id int not null, Address auto_increment=2000
-- phone_id int not null, Phone auto_increment=3000;
-- email_id int not null,  Email auto_increment=4000;


insert into Vendor values
(default, "Mike's Ruminants", 2000, 3000, 4000),
(default, "Tony's Pigs", 2001, 3001, 4001),
(default, "Frank's Birds", 2002, 3002, 4002),
(default, "Prather Ranch", 2003, 3003, 4003),
(default, "Chicken Coup Farms", 2004, 3004, 4004);

insert into Meat_Prices values
(default, 10.99),
(default, 11.99),
(default, 12.99),
(default, 14.99),
(default, 15.99),
(default, 16.99),
(default, 17.99),
(default, 18.99),
(default, 19.99),
(default, 20.99),
(default, 21.99),
(default, 22.99),
(default, 23.99);

-- create table Cuts
-- (
-- cuts_id int not null auto_increment,
-- cut_name varchar(20),
-- price_id int not null, alter table Prices auto_increment 400;

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


-- create table Species
-- (
-- species_id int not null auto_increment,
-- species_type varchar(20),


insert into Species values
(default, "Beef"),
(default, "Lamb"),
(default, "Goat"),
(default, "Rabbit"),
(default, "Pig"),
(default, "Chicken"),
(default, "Turkey");



-- create table Meat_Items
-- (
-- species_id int not null,
-- vendor_id int not null,
-- unit_price decimal(9,2),

insert into Meat_Items values
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


-- create table Meat
-- (
-- meat_id int not null auto_increment,
-- species_id int not null, alter table Species auto_increment=600;
-- cuts_id int not null, alter table Cuts auto_increment=500;
-- vendor_id int not null, alter table Vendor auto_increment=1000;


-- beef 500 - 533
-- chicken 534 -538
-- pork 539 -543 and 500 - 533

-- price 400 (10.99)- 412(23.99)

-- insert into Meat values
-- (default, 600,500, 410, 1000),
-- (default, 600,501, 409, 1000),
-- (default, 600,502, 400, 1000),
-- (default, 600, 503, 401, 1000),
-- (default, 600,504, 402, 1000),
-- (default, 600,505, 404, 1000),
-- (default, 600,506, 405, 1000),
-- (default, 600,507, 403, 1000),
-- (default, 600,508, 406, 1000),
-- (default, 600,509, 401, 1000),
-- (default, 600,510, 402, 1000),
-- (default, 600,511, 401, 1000),
-- (default, 600,512, 400, 1000),
-- (default, 600,513, 412, 1000),
-- (default, 600,514, 411, 1000),
-- (default, 600,515, 409, 1000),
-- (default, 600,516, 411, 1000),
-- (default, 600,517, 410, 1000),
-- (default, 600,518, 408, 1000),
-- (default, 600,519, 411, 1000),
-- (default, 600,520, 412, 1000),
-- (default, 600,521, 410, 1000),
-- (default, 600,522, 412, 1000),
-- (default, 600,523, 409, 1000),
-- (default, 600,524, 406, 1000),
-- (default, 600,525, 407, 1000),
-- (default, 600,526, 403, 1000),
-- (default, 600,527, 402, 1000),
-- (default, 600,528, 405, 1000),
-- (default, 600,529, 409, 1000),
-- (default, 600,530, 410, 1000),
-- (default, 600,531, 400, 1000),
-- (default, 600,532, 400, 1000),
-- (default, 600,533, 401, 1000),
-- (default, 605,534, 403, 1002),
-- (default, 605,535, 400, 1002),
-- (default, 605,536, 403, 1002),
-- (default, 605,537, 400, 1002),
-- (default, 605,538, 402, 1002),
-- (default, 604,539, 400, 1003),
-- (default, 604,540, 400, 1003),
-- (default, 604,541, 400, 1003),
-- (default, 604,542, 401, 1003),
-- (default, 604,543, 407, 1003);

-- create table Grocery
-- (
-- grocery_id int not null auto_increment,
-- item_name varchar(50) not null,
-- price int not null,
-- weight decimal(5,2),
-- case_size int,
-- vendor_id int not null,

-- insert into Grocery values
-- (default, "Canned Tomatoes", 

-- create table Dry_Goods
-- (
-- dry_goods_id int not null auto_increment,
-- item_name varchar(50) not null,
-- price int not null,
-- case_size int,
-- vendor_id int not null,

-- create table Inventory
-- (
-- inventory_id int not null auto_increment,
-- meat_id int not null,
-- grocery_id int not null,
-- dry_goods_id int not null,


-- create table Day_Of_Week

-- day_id int not null,
-- week_day varChar(9),


insert into Day_Of_Week values
(default, "Sunday"),
(default, "Monday"),
(default, "Tuesday"),
(default, "Wednesday"),
(default, "Thursday"),
(default, "Friday"),
(default, "Saturday");

-- create table Emp_Schedule

-- schedule_id int not null auto_increment,
-- day_id int not null,
-- start_shift time,
-- end_shift time,

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

-- create table Schedule_Link
-- (
-- employee_id int not null,
-- schedule_id int not null,

insert into Schedule_Link values
(100,1),
(100,2),
(100,3),
(100,4),
(100,5),
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


-- create table Species_Cuts
-- (
-- species_id int not null,
-- cut_id int not null,
-- beef 500 - 533
-- chicken 534 -538
-- pork 539 -543 and 500 - 533
insert into Species_Cuts values
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
(600,530),
(600,531),
(600,532),
(600,533),
(601,500),
(601,501),
(601,502),
(601,503),
(601,504),
(601,505),
(601,506),
(601,507),
(601,508),
(601,509),
(601,510),
(601,511),
(601,512),
(601,513),
(601,514),
(601,515),
(601,516),
(601,517),
(601,518),
(601,519),
(601,520),
(601,521),
(601,522),
(601,523),
(601,524),
(601,525),
(601,526),
(601,527),
(601,528),
(601,529),
(601,530),
(601,531),
(601,532),
(601,533),
(602,500),
(602,501),
(602,502),
(602,503),
(602,504),
(602,505),
(602,506),
(602,507),
(602,508),
(602,509),
(602,510),
(602,511),
(602,512),
(602,513),
(602,514),
(602,515),
(602,516),
(602,517),
(602,518),
(602,519),
(602,520),
(602,521),
(602,522),
(602,523),
(602,524),
(602,525),
(602,526),
(602,527),
(602,528),
(602,529),
(602,530),
(602,531),
(602,532),
(602,533),
(603,544),
(605,534),
(605,535),
(605,536),
(605,537),
(605,538),
(606,534),
(606,535),
(606,536),
(606,537),
(606,538),
(604,539),
(604,540),
(604,541),
(604,542),
(604,543);





