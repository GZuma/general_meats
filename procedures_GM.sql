use General_Meats;

/* ***********Drop Functions************** */

drop function if exists findAddress;
drop function if exists findCuts;
drop function if exists findDryGoods;
drop function if exists findEmail;
drop function if exists findEmployee;
drop function if exists findGrocery;
drop function if exists findHR;
drop function if exists findInsurance;
drop function if exists findPhone;
drop function if exists findVendor;
drop function if exists findDay;
drop function if exists findEmpSchedule;
drop function if exists findSpecies;
drop function if exists findCustomer;

/* ***********Drop Procedures************** */

drop procedure if exists addAddress;
drop procedure if exists addCuts;
drop procedure if exists addDryGoods;
drop procedure if exists addVendor;
drop procedure if exists addEmail;
drop procedure if exists addEmployee;
drop procedure if exists addGrocery;
drop procedure if exists addPhoneHouse;
drop procedure if exists addPhoneCell;
drop procedure if exists addPhoneBusiness;
drop procedure if exists addPhoneFax;
drop procedure if exists linkVendorGrocery;
drop procedure if exists linkVendorDryGoods;
drop procedure if exists addEmployeeSchedule;
drop  procedure if exists linkSpeciesCuts;
drop procedure if exists linkVendorSpecies;
drop procedure if exists addSpecies;
drop procedure if exists printSchedule;
drop procedure if exists sell_Meat_Item;
drop procedure if exists addCustomer;
/* ***********Change Delimiter************** */
delimiter //

/* ***********Functions************** */

create function findAddress
(
street_param varChar(30),
city_param varChar(30),
state_param varChar(2),
zip_param varChar(6)
)
returns int
deterministic reads sql data
begin

declare address_id_var int;

declare continue handler for not found
set address_id_var  = 0;

select address_id into address_id_var  
from Address
where street = street_param and
city = city_param and
state = state_param and
zip = zip_param;

return address_id_var;
end//

create function findCuts
(
cut_name_param varChar(40)
)
returns int
deterministic reads sql data
begin


declare cuts_id_var int;

declare continue handler for not found
set cuts_id_var  = 0;

select cuts_id into cuts_id_var  
from Cuts
where cut_name = cut_name_param;

return cuts_id_var;
end//

create function findDryGoods
(
item_name_param varChar(50)
)
returns int
deterministic reads sql data
begin

declare dryGoods_id_var int;

declare continue handler for not found
set dryGoods_id_var  = 0;

select dry_goods_id into dryGoods_id_var  
from Dry_Goods
where item_name = item_name_param;

return dryGoods_id_var;
end//

create function findEmail
(
email_address_param varChar(40)
)
returns int
deterministic reads sql data
begin

declare email_id_var int;

declare continue handler for not found
set email_id_var  = 0;

select email_id into email_id_var  
from Email
where email_address = email_address_param;

return email_id_var;
end//

create function findEmployee
(
employee_first_name_param varChar(50),
employee_last_name_param varChar(50)
)
returns int
deterministic reads sql data
begin

declare employee_id_var int;

declare continue handler for not found
set employee_id_var = 0;

select employee_id into employee_id_var 
from Employee
where concat(first_name," ", last_name) = concat(employee_first_name_param," ",employee_last_name_param);

return employee_id_var;
end//

create function findDay
(
week_day_param varChar(9)
)
returns int
deterministic reads sql data
begin

declare day_id_var int;

declare continue handler for not found
set day_id_var  = 0;

select day_id into day_id_var  
from Day_Of_Week
where week_day = week_day_param;


return day_id_var;
end//


create function findEmpSchedule
(
week_day_param varChar(9),
start_shift_param time,
end_shift_param time
)
returns int
deterministic reads sql data
begin

declare emp_schedule_id_var int;
declare day_id_var int;

declare continue handler for not found
set emp_schedule_id_var = 0;


if findDay(week_day_param) > 0 then
set day_id_var = findDay(week_day_param);
select emp_schedule_id into emp_schedule_id_var
from Emp_Schedule
where day_id = day_id_var and start_shift = start_shift_param and end_shift = end_shift_param;
end if;

return emp_schedule_id_var;
end//

create function findGrocery
(
item_name_param varChar(50)
)
returns int
deterministic reads sql data
begin

declare grocery_id_var int;

declare continue handler for not found
set grocery_id_var = 0;

select grocery_id into grocery_id_var 
from Grocery
where item_name = item_name_param;

return grocery_id_var;
end//

create function findHR
(
address_id_param varChar(11)
)
returns int
deterministic reads sql data
begin


declare hr_id_var int;

declare continue handler for not found
set hr_id_var  = 0;

select hr_id into hr_id_var  
from Human_resources
where address_id = address_id_param;

return hr_id_var;
end//

create function findInsurance
(
vision_param bit(1),
dental_param bit(1),
medical_param bit(1)
)
returns int
deterministic reads sql data
begin


declare insurance_id_var int;

declare continue handler for not found
set insurance_id_var  = 7000;

if vision_param = 1  and dental_param = 0 and medical_param = 0 then
set insurance_id_var = 7001;
else if vision_param = 1  and dental_param = 1 and medical_param = 0 then
set insurance_id_var = 7004;
else if vision_param = 1  and dental_param = 0 and medical_param = 1 then
set insurance_id_var = 7005;
else if vision_param = 0  and dental_param = 1 and medical_param = 0 then
set insurance_id_var = 7002;
else if vision_param = 0  and dental_param = 1 and medical_param = 1 then
set insurance_id_var = 7006;
else if vision_param = 0  and dental_param = 0 and medical_param = 1 then
set insurance_id_var = 7003;
else if vision_param = 1  and dental_param = 1 and medical_param = 1 then
set insurance_id_var = 7007;
end if;
end if;
end if;
end if;
end if;
end if;
end if;

return insurance_id_var;
end//

create function findPhone
(
phone_param varChar(16)
)
returns int
deterministic reads sql data
begin

declare phone_id_var int;

declare continue handler for not found
set phone_id_var  = 0;

select phone_id into phone_id_var  
from Phone
where phone_house = phone_param or
phone_cell = phone_param or
phone_business = phone_param or
phone_fax = phone_param;

return phone_id_var;
end//

create function findSpecies
(
species_type_param varChar(20)
)
returns int
deterministic reads sql data
begin

declare species_id_var int;

declare continue handler for not found
set species_id_var  = 0;

select species_id into species_id_var  
from Species
where species_type = species_type_param;


return species_id_var;
end//


create function findVendor
(
vendor_name_param varChar(50)
)
returns int
deterministic reads sql data
begin

declare vendor_id_var int;

declare continue handler for not found
set vendor_id_var = 0;

select vendor_id into vendor_id_var 
from Vendor
where vendor_name = vendor_name_param;

return vendor_id_var;
end//

create function findCustomer()
returns int
deterministic reads sql data
begin
declare customer_id_var int;
select max(customer_id) into customer_id_var
from Customer;

return customer_id_var;
end//

/* ********************************Procedures******************************** */

/* *************Adds*************** */

create procedure addAddress
(
street_param varChar(30),
city_param varChar(30),
state_param varChar(2),
zip_param varChar(6)
)
begin

-- declare address_id_var int;

if findAddress(street_param, city_param, state_param, zip_param) = 0 then
insert into Address (street,city,state,zip) values
(street_param, city_param, state_param, zip_param);
end if;

end//

create procedure addCuts
(
cut_name_param varChar(50)
)
begin
declare cut_id_var int;

if findCuts(cut_name_param) = 0 then
insert into Cuts (cut_name) values (cut_name_param);
end if;

end//

create procedure addEmail
(
email_address_param varChar(50)
)
begin

if findEmail(email_address_param) = 0 then
insert into Email (email_address) values
(email_address_param);
end if;

end//

create procedure addEmployee
(
first_name_param varChar(30),
last_name_param varChar(30),
street_param varChar(30),
city_param varChar(30),
state_param varChar(2),
zip_param varChar(6),
phone_param varChar(16),
email_address_param varChar(50),
pay_rate_param decimal(9,2),
vision_param bit(1),
dental_param bit(1),
medical_param bit(1),
department_param varChar(20)
)
begin


if findAddress(street_param,city_param,state_param,zip_param) = 0 then
call addAddress(street_param,city_param,state_param,zip_param);
end if;
if findPhone(phone_param) = 0 then
call addPhoneCell(phone_param);
end if;
if findEmail(email_address_param) = 0 then
call addEmail(email_address_param);
end if;

if findEmployee(first_name_param, last_name_param) = 0 then
insert into Human_Resources ( hr_id,pay_rate_per_hour, address_id, phone_id, email_id, insurance_id, department) values
(
default,
pay_rate_param, 
findAddress(street_param,city_param,state_param,zip_param), 
findPhone(phone_param), 
findEmail(email_address_param), 
findInsurance(vision_param, dental_param, medical_param),
department_param
);

insert into Employee(first_name, last_name, hr_id) values 
(first_name_param, last_name_param, findHr(findAddress(street_param,city_param,state_param,zip_param)));
end if;


end//


create procedure addGrocery
(
item_name_param varChar(50),
case_size_param int,
unit_price_param decimal(9,2)
)
begin

 if findGrocery(item_name_param) = 0 then
 insert into Grocery(item_name, case_size, unit_price) values
 (item_name_param, case_size_param, unit_price_param);
 end if;

end//

create procedure addDryGoods
(
item_name_param varChar(50),
case_size_param int,
unit_price_param decimal(9,2)
)
begin

 if findDryGoods(item_name_param) = 0 then
 insert into Dry_Goods(item_name, case_size, unit_price) values
 (item_name_param, case_size_param, unit_price_param);
 end if;

end//


create procedure addPhoneHouse
(
phone_param varChar(16)
)
begin

if findPhone(phone_param) = 0 then
insert into Phone (phone_house) values
(phone_param);
end if;

end//

create procedure addPhoneCell
(
phone_param varChar(16)
)
begin

if findPhone(phone_param) = 0 then
insert into Phone (phone_cell) values
(phone_param);
end if;

end//

create procedure addPhoneBusiness
(
phone_param varChar(16)
)
begin

if findPhone(phone_param) = 0 then
insert into Phone (phone_business) values
(phone_param);
end if;

end//

create procedure addPhoneFax
(
phone_param varChar(16)
)
begin

if findPhone(phone_param) = 0 then
insert into Phone (phone_fax) values
(phone_param);
end if;

end//

create procedure addSpecies
(
species_type_param varChar(20)
)
begin

 if findSpecies(species_type_param) = 0 then
 insert into Species(species_type) values
 (species_type_param);
 end if;

end//

create procedure addVendor
(
vendor_name_param varChar(50),
street_param varChar(30),
city_param varChar(30),
state_param varChar(2),
zip_param varChar(6),
phone_param varChar(16),
email_address_param varChar(50)
)
begin


if findAddress(street_param,city_param,state_param,zip_param) = 0 then
call addAddress(street_param,city_param,state_param,zip_param);
end if;

if findPhone(phone_param) = 0 then
call addPhoneBusiness(phone_param);
end if;

if findEmail(email_address_param) = 0 then
call addEmail(email_address_param);
end if;


if findVendor(vendor_name_param) = 0 then
insert into Vendor(vendor_name, address_id, phone_id, email_id) values 
(vendor_name_param, findAddress(street_param,city_param,state_param,zip_param), findPhone(phone_param),findEmail(email_address_param));
end if;

end//

create procedure addEmployeeSchedule
(
last_name_param varChar (30),
first_name_param varChar (30),
week_day_param varChar(9),
start_shift_param time,
end_shift_param time
)
begin
declare duplicate_entry tinyint default false;

declare continue handler for 1062
set duplicate_entry = true;

if duplicate_entry = false then

if findEmployee(first_name_param, last_name_param)  and
findEmpSchedule(week_day_param, start_shift_param, end_shift_param)
then
insert into Employee_Schedule_Link (employee_id, emp_schedule_id) 
values (findEmployee(first_name_param, last_name_param),findEmpSchedule(week_day_param, start_shift_param, end_shift_param));
end if;
end if;

if findEmployee(first_name_param, last_name_param) = 0 then
select "No employee found" as Message;
end if;

if findEmpSchedule(week_day_param, start_shift_param, end_shift_param) = 0 then
select "Schedule Invalid" as Message;
end if;

end//

create procedure addCustomer
(
last_name_param varChar(20),
first_name_param varChar(20)
)
begin
insert into Customer values(default, last_name_param ,first_name_param );
end//


/* ***********Links*********** */

create procedure linkSpeciesCuts
(
species_type_param varChar (50),
cut_name_param varChar (50)
)
begin
declare duplicate_entry tinyint default false;

declare continue handler for 1062
set duplicate_entry = true;

if duplicate_entry = false then

if findSpecies(species_type_param) and findCuts(cut_name_param) then
insert into  Species_Cuts_Link (species_id, cuts_id) 
values (findSpecies(species_type_param),findCuts(cut_name_param));
end if;
end if;

if findSpecies(species_type_param) = 0 then
select "No species found" as Message;
end if;

if findCuts(cut_name_param) = 0 then
select "No cut found" as Message;
end if;

end// 

create procedure linkVendorGrocery
(
item_name_param varChar (50),
vendor_name_param varChar (50),
vendors_price_param decimal(9,2)
)
begin
declare duplicate_entry tinyint default false;

declare continue handler for 1062
set duplicate_entry = true;

if duplicate_entry = false then
if findGrocery(item_name_param) and findVendor(vendor_name_param) then
insert into Vendor_Grocery_Link (grocery_id, vendor_id, vendors_price) 
values (findGrocery(item_name_param),findVendor(vendor_name_param),vendors_price_param);
end if;
end if;

if findGrocery(item_name_param) = 0 then
select "No item found" as Message;
end if;

if findVendor(vendor_name_param) = 0 then
select "No vendor found" as Message;
end if;

end// 

create procedure linkVendorDryGoods
(
item_name_param varChar (50),
vendor_name_param varChar (50),
vendors_price_param decimal(9,2)
)
begin
declare duplicate_entry tinyint default false;

declare continue handler for 1062
set duplicate_entry = true;

if duplicate_entry = false then
if findDryGoods(item_name_param) and findVendor(vendor_name_param) then
insert into Vendor_Dry_Goods_Link (dry_goods_id, vendor_id, vendors_price) 
values (findDryGoods(item_name_param),findVendor(vendor_name_param),vendors_price_param);
end if;
end if;

if findDryGoods(item_name_param) = 0 then
select "No item found" as Message;
end if;

if findVendor(vendor_name_param) = 0 then
select "No vendor found" as Message;
end if;

end// 


create procedure linkVendorSpecies
(
species_type_param varChar (50),
vendor_name_param varChar (50),
vendors_price_param decimal(9,2)
)
begin
declare duplicate_entry tinyint default false;

declare continue handler for 1062
set duplicate_entry = true;

if duplicate_entry = false then
if findSpecies(species_type_param) and findVendor(vendor_name_param) then
insert into Vendor_Species_Link (species_id, vendor_id, vendors_price) 
values (findSpecies(species_type_param),findVendor(vendor_name_param),vendors_price_param);
end if;
end if;

if findSpecies(species_type_param) = 0 then
select "No species found" as Message;
end if;

if findVendor(vendor_name_param) = 0 then
select "No vendor found" as Message;
end if;

end// 


/* *********Updates*********** */

create procedure printSchedule
(
employee_first_name_param varChar(50),
employee_last_name_param varChar(50)
)
begin
declare employee_id_var int;

select employee_id into employee_id_var from Employee where employee_id = findEmployee(employee_first_name_param, employee_last_name_param);

if findEmployee(employee_first_name_param, employee_last_name_param) = 0 then
select "No Employee Found" as Message;
else
select concat(first_name, " " , last_name) as "Employee", 
week_day as "Day" , start_shift as "Start Time", end_shift as "End Time"
from Employee join Employee_Schedule_Link using(employee_id) 
join Emp_Schedule using(emp_schedule_id)
join Day_Of_Week using(day_id)
where Employee_Schedule_Link.employee_id =  employee_id_var;
end if;


end//


 create procedure sell_Meat_Item
(
species_param varChar(20),
cut_param varChar(50),
quantity_param int,
price_param decimal(9,2)
)
begin
declare cus_id_var int;

insert into Purchase_Order values (default,findCustomer(),findSpecies(species_param),species_param,
findCuts(cut_param),cut_param,quantity_param,current_timestamp(),price_param);

end//

delimiter ;



