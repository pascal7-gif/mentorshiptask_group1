-- ANALYZING SALES  BY COUNTRY... ANALYZING SALES  BY COUNTRY...ANALYZING SALES  BY COUNTRY

--Total number of customers in a each country
select "Country" as "Country", count("CustomerId") as "Number of customers" from "Customer" c group by"Country"  ;


-- Total value of sales for a each country 
select "BillingCountry" as"country",  concat('$',count("Total")) as"Sales value"  from "Invoice" i group by "BillingCountry" ;


-- Average sales per customer 
 select "CustomerId" as "Customer", concat('$', AVG("Total")) as"Average Sales " from "Invoice" i  group by "CustomerId" ; 


--Average sales/ order value per country
select "BillingCountry" as"country", concat('$', AVG("Total")) as"Average Sales "  from "Invoice" group by "BillingCountry"  ;




--ANALYZING EMPLOYEE SALES PERFORMANCE...ANALYZING EMPLOYEE SALES PERFORMANCE...ANALYZING EMPLOYEE SALES PERFORMANCE...
-- Names of employees/sales rep
 select concat("LastName",'',"FirstName")from "Employee" e 
 