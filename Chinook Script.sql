--1.  ANALYZING SALES  BY COUNTRY... ANALYZING SALES  BY COUNTRY...ANALYZING SALES  BY COUNTRY

--Total number of customers in a each country
select "Country" as "Country", count("CustomerId") as "Number of customers" from "Customer" c group by"Country"  ;


-- Total value of sales for a each country 
select "BillingCountry" as"country",  concat('$',count("Total")) as"Sales value"  from "Invoice" i group by "BillingCountry" ;


-- Average sales per customer 
 select "CustomerId" as "Customer", concat('$', AVG("Total")) as"Average Sales " from "Invoice" i  group by "CustomerId" ; 


--Average sales/ order value per country
select "BillingCountry" as"country", concat('$', AVG("Total")) as"Average Sales "  from "Invoice" group by "BillingCountry"  ;




--3. ANALYZING EMPLOYEE SALES PERFORMANCE...ANALYZING EMPLOYEE SALES PERFORMANCE...ANALYZING EMPLOYEE SALES PERFORMANCE...

 -- Total sales in dollars made by each sales representative
select concat(e."LastName",' ',e."FirstName")as "Sales Rep" , Concat('$',sum(i."Total")) as "Total Sales" 
from "Invoice" as i
join "Customer" as c on c."CustomerId" = i."CustomerId" 
join "Employee" as e on e."EmployeeId" = c."SupportRepId" 
group by e."EmployeeId" ;





-- 4. MEDIA TYPES AND CORRESPONDING NUMBER OF TRACKS SOLD...MEDIA TYPES AND CORRESPONDING NUMBER OF TRACKS SOLD
select mt."Name" as "Media Type" , count(i."InvoiceId") as "Number of Tracks Sold"
from "Invoice" as i
join "InvoiceLine" as il on il."InvoiceLineId" = i."InvoiceId" 
join "Track" as t on t."TrackId" = il."TrackId" 
join "MediaType" as mt on mt."MediaTypeId" =t."MediaTypeId" 
group by mt."MediaTypeId" ;




--- 5.ALBUM AND ITS RESPECT NUMBER OF INVOICES
select a."Title" as "Album Title", count(i."InvoiceId") as "Number of album Sold"
from "Invoice" as i
join "InvoiceLine" as il on il."InvoiceLineId" = i."InvoiceId" 
join "Track" as t on t."TrackId" = il."TrackId" 
join "Album" as a on a."AlbumId" = t."AlbumId" 
group by a."Title"  ;




--- 6. TRACKS AND ITS RESPECT SALE
select t."Name" as "Track" , count(i."InvoiceId") as "Number of Tracks Sold"
from "Invoice" as i
join "InvoiceLine" as il on il."InvoiceLineId" = i."InvoiceId" 
join "Track" as t on t."TrackId" = il."TrackId" 
group by t."Name" 