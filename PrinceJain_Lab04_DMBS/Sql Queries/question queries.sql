/* Q4) Display the total number of customers based on gender who have placed indiviual orders of worth at least Rs.3000. */

select c.cus_gender as Gender, count(*) as Total from customer c 
join orders o using(cus_id) 
where ord_amount >= 3000 
group by CUS_GENDER;


/* Q5) Display all the orders along with product name ordered by a customer having Customer_Id=2. */

select pro_name, orders.* from orders join supplier_pricing using(pricing_id) join product using(pro_id) where cus_id= 2;


/* Q6) Display the Supplier details of who is supplying more than two product.*/

select supp_name as 'Supplier Name', count(*) as Total from supplier s join supplier_pricing using(supp_id) group by s.supp_name having Total > 2;


/* Q7) Find the least expensive product from each category and print the table with category id, name, and price of the product*/

select category.cat_id as 'Category Id', category.CAT_name as 'Category Name', product.pro_name as 'Product Name', t1.price as Price from category 
join product using(cat_id) join supplier_pricing using(pro_id) 
join (select cat_id, min(supp_price) as price from category join product using(cat_id) 
join supplier_pricing using(pro_id) group by cat_id) as t1
where category.cat_id = t1.cat_id and supplier_pricing.supp_price = t1.price order by t1.price;

/* Q8) Display the Id and Name of the Product ordered after “2021-10-05”. */

select p.pro_id, p.pro_name from product as p 
join supplier_pricing as sp using(pro_id)
join orders as o using(pricing_id) where ord_date > '2021-10-05';

/* Q9) Display customer name and gender whose names start or end with character 'A'. */

select cus_name as 'Customer Name', cus_gender as Gender from customer where cus_name like '%a' or cus_name like 'a%'

/* Q10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and 
 Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
 Service” else print “Poor Service”. Note that there should be one rating per supplier.  */

DELIMITER &&  
CREATE PROCEDURE displaySupplierDetails()
BEGIN
select report.supp_id as 'Supplier Id', report.supp_name as 'Supplier Name', report.Average as 'AVG Rating',
CASE
	WHEN report.Average = 5 THEN 'Excellent Service'
    	WHEN report.Average > 4 THEN 'Good Service'
    	WHEN report.Average > 2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS 'Type of Service' from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select orders.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from orders inner join rating on rating.ord_id = orders.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END &&  
DELIMITER ;  

CALL displaySupplierDetails();
