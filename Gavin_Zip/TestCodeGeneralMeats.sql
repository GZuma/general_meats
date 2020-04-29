use General_Meats;




/* *****************Employee************* */
select concat(last_name,", ", first_name) as Employee,
street , city, state, 
pay_rate_per_hour as "Hourly Rate",
department as "Department"
from
Employee join Human_Resources using(hr_id)
join Address using(address_id);


call addEmployee("Lori", "Erezuma","20 Rose Way","San Francisco","CA","94127",4157890323,"loir1234@lnet.com",15.50,1,0,1,"Front House");
call addEmployee("Bill", "Weather","3298 Big Street","Novato","CA","94134",4153427765,"bigBill@yahoo.com",15.50,1,1,1,"Buthcer");
call addEmployee("Mike", "Stover","887 Petaluma Blv","Petaluma","CA","94334",4152469000,"hammerHead23@gmail.com",18.50,0,0,1,"Front House");

select concat(last_name,", ", first_name) as Employee,
street , city, state, 
pay_rate_per_hour as "Hourly Rate",
department as "Department"
from
Employee join Human_Resources using(hr_id)
join Address using(address_id);

call printSchedule("Martin","Fullone");
call addEmployeeSchedule("Erezuma","Gavin","Tuesday","06:00:00", "14:30:00");
call addEmployeeSchedule("Erezuma","Gavin","Monday","06:00:00", "14:30:00");
call addEmployeeSchedule("Erezuma","Gavin","Wednesday","06:00:00", "14:30:00");
call addEmployeeSchedule("Erezuma","Hector","Tuesday","06:00:00", "14:30:00");
call printSchedule("Gavin","Erezuma");



/* **********adding vendor************ */
select * from Vendor;
call addVendor("Gavin's Chicken Ranch","299 Mills Ave","Okland","CA","94563",5107839998,"ChickenDontBit@loopnet.com");
call addVendor("Willies Grocery","299 Mills Ave","Okland","CA","94563",5107839998,"ChickenDontBit@loopnet.com");
call addVendor("Lily Produce","289 Windmill Rd","Okland","CA","94533",5107833422,"lilypond23@gmail.com");
call addVendor("Oliver E Ranch","387 Backalley St","Okland","CA","94233",5108856732,"theAlley@aol.com");
select * from Vendor;


/* ***********adding species and linking to Vendor and cut********* */

select vendor_name as "Vendor", 
species_type as "Species",
cut_name as "Cut",
vendors_price as "Our Cost"
from Vendor
join Vendor_Species_Link using(vendor_id)
join Species using(species_id)
join Species_Cuts_Link using(species_id)
join Cuts using(cuts_id)
order by species_type desc;

call addSpecies("Quail");
call linkVendorSpecies("Quail","Chicken Coup Farms",9.50);
call linkSpeciesCuts("Quail","Whole Bird");
call linkSpeciesCuts("Quail","Half Bird");

select vendor_name as "Vendor", 
species_type as "Species",
cut_name as "Cut",
vendors_price as "Our Cost"
from Vendor
join Vendor_Species_Link using(vendor_id)
join Species using(species_id)
join Species_Cuts_Link using(species_id)
join Cuts using(cuts_id)
order by species_type desc;




/* **********adding Grocery Item and linking to Vendor************ */
select * from Grocery;
call addGrocery("Golden Delicious Apple",  24, .50);
call addGrocery("Bartlett Pear",  24, 1.25);
call addGrocery("Mandarin",  12, 2.50);
call addGrocery("Almonds", 10, 10.25);
call addGrocery("Onion",  24, .75);
call addGrocery("Garlic",  24, .22);
call addGrocery("Carrots", 10, 10.25);
call addGrocery("Onion",  24, .75);
call addGrocery("Oranges",  24, .22);
call addGrocery("Walnuts",  24, .50);
call addGrocery("Thyme",  24, 1.25);
call addGrocery("Rosemary",  12, 2.50);
call addGrocery("Russett Potato", 10, 10.25);
call addGrocery("Apple",  24, .75);
call addGrocery("Bay Leaf",  24, .22);
select * from Grocery;

select vendor_name as "Vendor",
item_name as "Item",
vendors_price as "Our Price", 
unit_price as "Sell Price"
from Grocery
join Vendor_Grocery_Link using(grocery_id)
join Vendor using(vendor_id);

call linkVendorGrocery("Sage","Oliver E Ranch",.20);
call linkVendorGrocery("Bartlett Pear","Willies Grocery",.70);
call linkVendorGrocery("Mandarin","Willies Grocery",1.00);
call linkVendorGrocery("Almonds","Lily Produce",5.75);
call linkVendorGrocery("Onion","Willies Grocery",.20);
call linkVendorGrocery("Garlic","Lily Produce",.10);
call linkVendorGrocery("Carrots","Oliver E Ranch",.20);
call linkVendorGrocery("Celery","Willies Grocery",.70);
call linkVendorGrocery("Oranges","Willies Grocery",1.00);
call linkVendorGrocery("Walnuts","Lily Produce",7.75);
call linkVendorGrocery("Thyme","Willies Grocery",.10);
call linkVendorGrocery("Rosemary","Lily Produce",.10);
call linkVendorGrocery("Russett Potato","Oliver E Ranch",.80);
call linkVendorGrocery("Apple","Willies Grocery",1.70);
call linkVendorGrocery("Bay Leaf","Willies Grocery",.40);
call linkVendorGrocery("Walnuts","Oliver E Ranch",5.90);
call linkVendorGrocery("Thyme","Oliver E Ranch",.25);
call linkVendorGrocery("Rosemary","Oliver E Ranch",.10);
call linkVendorGrocery("Russett Potato","Oliver E Ranch",.66);
call linkVendorGrocery("Apple","Oliver E Ranch",.89);
call linkVendorGrocery("Bay Leaf","Oliver E Ranch",.10);

select vendor_name as "Vendor",
item_name as "Item",
vendors_price as "Our Price", 
unit_price as "Sell Price"
from Grocery
join Vendor_Grocery_Link using(grocery_id)
join Vendor using(vendor_id);


/* **********adding DryGoods Item and linking to Vendor************ */
select * from dry_goods;
call addDryGoods("salt",12,.55);
call addDryGoods("pepper",12,.75);
call addDryGoods("water",24,1.25);
call addDryGoods("Olive Oil",12,4.85);
select * from dry_goods;

select vendor_name as "Vendor",
item_name as "Item",
vendors_price as "Our Price", 
unit_price as "Sell Price" 
from Dry_Goods join Vendor_Dry_Goods_Link using(dry_goods_id)
join Vendor using(vendor_id);

call linkVendorDryGoods("water","Gavin's Chicken Ranch", 12.75);
call linkVendorDryGoods("pepper","Prather Ranch", 10.75);

select vendor_name as "Vendor",
item_name as "Item",
vendors_price as "Our Price", 
unit_price as "Sell Price" 
from Dry_Goods join Vendor_Dry_Goods_Link using(dry_goods_id)
join Vendor using(vendor_id);

/* ************purchases****************** */

call addCustomer("Orwell","George");
call sell_Meat_Item("Beef","Tenderloin", 1,23.25);
call sell_Meat_Item("Lamb","Stew Meat", 2,8.30);
call sell_Meat_Item("Beef","Ribeye Boneless", 4,22.50);

call addCustomer("Lions","Frank");
call sell_Meat_Item("Beef","Stew Meat", 2,5.25);
call sell_Meat_Item("Beef","Ribeye Boneless", 4, 22.50);

call addCustomer("Jarmish","Jim");
call sell_Meat_Item("Beef","Chuck Roll", 3, 9.89);
call sell_Meat_Item("Chicken","Whole Bird", 1, 7.50);
call sell_Meat_Item("Chicken","Leg", 3, 9.89);
call sell_Meat_Item("Goat","Bottom Round", 1,13.50);


call addCustomer("willson","Luke");
call sell_Meat_Item("Lamb","Whole Animal", 1, 4.25);
call sell_Meat_Item("Lamb","PorterHouse", 3, 7.50);
call sell_Meat_Item("Beef","Ribeye Boneless", 4,9.50);


call addCustomer("Libre","Nacho");
call sell_Meat_Item("Chicken","Leg", 9 ,4.25);
call sell_Meat_Item("Chicken","Breast", 7, 8.50);

call addCustomer("Segate","Elen");
call sell_Meat_Item("Quail","Whole", 3, 9.50);
call sell_Meat_Item("Chicken","Whole Bird", 1,7.50);
call sell_Meat_Item("Chicken","Leg", 3,9.89);
call sell_Meat_Item("Goat","Bottom Round", 1,13.50);

select  distinct last_name as "Customer",
Purchase_Order.cut_name as "Cut",
Purchase_Order.species_type as "Species", 
purchase_time as "Time of Purchase",
quantity as "Quantity",
purchase_price as "Price",
(quantity * purchase_price) as "Total Line Item"
from
Customer join Purchase_Order using(customer_id)
join Species using(species_id)
join Species_Cuts_Link using(species_id)
join Cuts using(cuts_id)
order by last_name;
