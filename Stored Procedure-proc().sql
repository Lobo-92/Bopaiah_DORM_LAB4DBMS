CREATE DEFINER=`root`@`localhost` PROCEDURE `proc`()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    	WHEN report.Average >4 THEN 'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_stars)/count(test2.rat_stars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_STARS from supplier_pricing inner join
(select Orders.pricing_id, rating.ORD_ID, rating.RAT_STARS from Orders inner join rating on rating.ord_id = Orders.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END