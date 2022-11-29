create database if not exists ecommerce;
use ecommerce;

create table supplier (supp_id int, supp_name varchar(50) not null, supp_city varchar(50) not null, supp_phone varchar(50) not null,
constraint sid_pk primary key(supp_id));

create table customer (cus_id int, cus_name varchar(50), cus_phone varchar(10),
constraint cusid_pk primary key(cus_id));
alter table customer 
add column cus_gender char(5);
alter table customer
add column cus_city varchar(20);

create table category(cat_id int, cat_name varchar(20) not null,
constraint cat_id_pk primary key(cat_id));

create table product (pro_id int, pro_name varchar(20) not null default "Dummy", pro_desc varchar(60), cat_id int,
constraint pro_id_pk primary key(pro_id), constraint cat_id_fk foreign key(cat_id) references category(cat_id));

create table supplier_pricing (pricing_id int, pro_id int, supp_id int, supp_price int default 0,
constraint pro_id_fk foreign key(pro_id) references product(pro_id), constraint supp_id_fk foreign key(supp_id) references supplier(supp_id));
alter table supplier_pricing
add constraint pricing_id_pk primary key(pricing_id);

create table Orders (ord_id int, ord_amount int not null, ord_date date not null, cus_id int, pricing_id int,
constraint ord_id_pk primary key(ord_id), constraint cus_id_fk foreign key(cus_id) references customer(cus_id), constraint pricing_id_fk foreign key(pricing_id) references supplier_pricing(pricing_id));

create table rating (rat_id int, ord_id int, rat_stars int not null,
constraint rat_id_pk primary key(rat_id), constraint ord_id_fk foreign key(ord_id) references Orders(ord_id));

insert into supplier values(1, 'Rajesh Retails', 'Delhi', '1234567891');
insert into supplier values(2, 'Appario Ltd', 'Mumbai', '1234567892');
insert into supplier values(3, 'Knome Products', 'Bangalore', '1234567893');
insert into supplier values(4, 'Menon Retails', 'Kochi', '1234567894');
insert into supplier values(5, 'Mittal Ltd.', 'Lucknow', '1234567895');

insert into customer values(1, 'Aakash', '2222222221', 'Delhi', 'M');
insert into customer values(2, 'Aman', '2222222222', 'Noida', 'M');
insert into customer values(3, 'Neha', '2222222223', 'Mumbai', 'F');
insert into customer values(4, 'Megha', '2222222224', 'Kolkata', 'F');
insert into customer values(5, 'Pulkit', '2222222225', 'Lucknow', 'M');

insert into category values(1, 'Books');
insert into category values(2, 'Games');
insert into category values(3, 'Groceries');
insert into category values(4, 'Electronics');
insert into category values(5, 'Clothes');

insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product values(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product values(3, 'ROG Laptop', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product values(4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into product values(5, 'Harry Potter', 'Best Collection of all time by J.K Rowling', 1);
insert into product values(6, 'MILK', '1L Toned Milk', 3);
insert into product values(7, 'BOAT Earphones', '1.5 mtr loing Dolby Atmos', 4);
insert into product values(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values(9, 'Project IGI', 'Compatible with windows 7 and above', 2);
insert into product values(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product values(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1);
insert into product values(12, 'Train Your Brain', 'By Shireen Stephen', 1);

insert into supplier_pricing values(1, 1, 2, 1500);
insert into supplier_pricing values(2, 3, 5, 30000);
insert into supplier_pricing values(3, 5, 1, 3000);
insert into supplier_pricing values(4, 2, 3, 2500);
insert into supplier_pricing values(5, 4, 1, 1000);
INSERT INTO SUPPLIER_PRICING VALUES(6, 12, 2, 780);
INSERT INTO SUPPLIER_PRICING VALUES(7, 12, 4, 789);
INSERT INTO SUPPLIER_PRICING VALUES(8, 3, 1, 31000);
INSERT INTO SUPPLIER_PRICING VALUES(9, 1, 5, 1450);
INSERT INTO SUPPLIER_PRICING VALUES(10, 4, 2, 999);
INSERT INTO SUPPLIER_PRICING VALUES(11, 7, 3, 549);
INSERT INTO SUPPLIER_PRICING VALUES(12, 7, 4, 529);
INSERT INTO SUPPLIER_PRICING VALUES(13, 6, 2, 105);
INSERT INTO SUPPLIER_PRICING VALUES(14, 6, 1, 99);
INSERT INTO SUPPLIER_PRICING VALUES(15, 2, 5, 2999);
INSERT INTO SUPPLIER_PRICING VALUES(16, 5, 2, 2999);

insert into Orders values(101, 1500,'2021-10-06', 2, 1);
insert into Orders values(102, 1000,'2021-10-12', 3, 5);
insert into Orders values(103, 30000,'2021-09-16', 5, 2);
insert into Orders values(104, 1500,'2021-10-05', 1, 1);
insert into Orders values(105, 3000,'2021-08-16', 4, 3);
insert into Orders values(106, 1450,'2021-08-18', 1, 9);
insert into Orders values(107, 789,'2021-09-01', 3, 7);
insert into Orders values(108, 780,'2021-09-07', 5, 6);
insert into Orders values(109, 3000,'2021-00-10', 5, 3);
insert into Orders values(110, 2500,'2021-09-10', 2, 4);
insert into Orders values(111, 1000,'2021-09-15', 4, 5);
insert into Orders values(112, 789,'2021-09-16', 4, 7);
insert into Orders values(113, 31000,'2021-09-16', 1, 8);
insert into Orders values(114, 1000,'2021-09-16', 3, 5);
insert into Orders values(115, 3000,'2021-09-16', 5, 3);
insert into Orders values(116, 99,'2021-09-17', 2, 14);

insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(6, 106, 3);
insert into rating values(7, 107, 4);
insert into rating values(8, 108, 4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(12, 112, 4);
insert into rating values(13, 113, 2);
insert into rating values(14, 114, 1);
insert into rating values(15, 115, 1);
insert into rating values(16, 116, 0);

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
(select Orders .*, customer.cus_gender, customer.cus_name from Orders inner join customer where Orders.cus_id=customer.cus_id having Orders.ord_amount>=3000)
as t1  group by t1.cus_id) as t2 group by t2.cus_gender;

select product.pro_name, Orders.* from Orders, supplier_pricing, product 
where Orders.cus_id=2 and 
Orders.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

select supplier.* from supplier where supplier.supp_id in 
	(select supp_id from supplier_pricing group by supp_id having 
	count(supp_id)>1) 
group by supplier.supp_id;

select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

select product.pro_id,product.pro_name from Orders inner join supplier_pricing on supplier_pricing.pricing_id=Orders.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where Orders.ord_date>"2021-10-05";

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

call proc();




