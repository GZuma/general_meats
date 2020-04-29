use General_Meats;

-- select employee_id, address_id, concat(last_name, ", " ,first_name) as "Last, First", city as "City", state as "State"
-- from Employee join Address using(address_id);

select concat(first_name, " ", last_name) as "Employee Name", pay_rate_per_hour , street , vision, phone_cell, email_address
from Employee join Human_Resources using(hr_id)
join Address using(address_id)
join Insurance using(insurance_id)
join Phone using(phone_id)
join Email using(email_id);

select vendor_name, city, state, phone_business, email_address
from vendor join address using(address_id)
join phone using(phone_id)
join email using(email_id);

select cut_name,  species_type, price , vendor_name from cuts join meat using(cuts_id)
join vendor using(vendor_id)
join prices using(price_id)
join Species using(species_id)
where price > 18.00; 

select count(*) from insurance;

select last_name, week_day, start_shift, end_shift 
from Employee  E join Schedule_Link SL on E.employee_id = SL.employee_id
join Emp_Schedule ES on SL.schedule_id = ES.schedule_id
join Day_Of_Week DW on ES.day_id = DW.day_id;

select cut_name, species_type, vendor_name, unit_price
from Cuts join Species_Cuts using(cuts_id)
join Species using(species_id)
join Meat_Items using(species_id)
join Vendor using(vendor_id);

