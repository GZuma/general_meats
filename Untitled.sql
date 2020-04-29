/* This creates the database for 
General Meats a locally sourced farm to table
butcher shop*/
 use General_Meats;

drop table if exists Human_Resources;
drop table if exists Emp_Status;
drop table if exists Address;
drop table if exists Phone;
drop table if exists Email;
drop table if exists Insurance;
drop table if exists Emp_Schedule;
drop table if exists Employee;
drop table if exists Cuts;
drop table if exists Species;
drop table if exists Meat;
drop table if exists Grocery;
drop table if exists Dry_Goods;
drop table if exists Vendor;
drop table if exists Inventory;

create table Human_Resources
(
hr_id int,
pay_rate_per_hour decimal(9,2) not null default 10,
employment_status varchar(20) default "employed",
insurance_id int,
deductions decimal(9,2),
emp_status_id int not null,

constraint Human_Resources_pk
	primary key (hr_id),
    
    constraint Human_Resources_fk_Emp_Status
		foreign key (emp_status_id) references Emp_Status (emp_status_id)
);
create table Emp_Status
(
emp_status_id int,
emp_start_date date,
emp_end_date date default null,
emp_status varchar(20)
);
create table Address
(
address_id int,
street varchar(30) not null,
aptment_number varchar(20) default null,
city varchar(30) not null,
state varchar(2) not null,
zip varchar (6) not null,
country varchar(74) default "United States"
);
 create table Phone
 (
phone_id int, 
phone_house bigint default null,
phone_cell bigint default null,
phone_buisiness bigint default null,
phone_fax bigint default null
 );
create table Email
(
email_id int,
email_address varchar(40) default null
);
create table Insurance
(
insurance_id int,
vision varchar(30)  default null,
dental varchar(30) default null,
medical varchar(30) default null
);
create table Emp_Schedule
(
emp_schedule_id int,
start_time 
);










