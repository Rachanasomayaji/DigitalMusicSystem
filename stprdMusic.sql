
--use DigitalMusicStoreAnalysis
----------AddAlbum------------------
alter procedure addAlbum
	@albumId int,
	@title varchar(20),
	@ArtistId int

as
begin
	if @ArtistId not in (select ArtistId from Albums)
	  insert into Albums values(@albumId,@title,@ArtistId)
else
	print 'Already existed Album'

end


exec addAlbum  040,'Sugama',01

--------------if Artist is new create an album-----------------
--create view CityCorrCustomer

--as
--select city from customer where customerId in(select MAX(customerId) from Invoice)

------------

--drop view CityCorrCustomer

--------------CustomerSpendHightesMoney------------------------

alter procedure CustomerSpendHigh


as
begin
	select Firstname from customer1 where customerId in
	(select customerId from Invoice where InvoiceId in
	(select InvoiceId from InvoiceLine1))

end
exec CustomerSpendHigh

---using joins----------
select firstname from customer1 C inner join invoice I on c.customerId=i.CustomerId  
inner join invoiceline1 I1 on I.InvoiceId=I1.InvoiceId

select customerId from customer1
select CustomerId,InvoiceId from invoice
select invoiceid from InvoiceLine1
------------rock band------------------------

alter procedure rockBAND

as
begin
	select city from customer1 where customerId in
	(select customerId from Invoice where InvoiceId =
	(select InvoiceId from InvoiceLine1 where TrackId in
	(select TrackId from Track where GenreId in
	(select GenreId from Genre ))))

	--select c.city  from customer1 c inner join Invoice I on c.customerId=I.CustomerId   
end

exec rockBAND
-----------------City has best customer--------------------

alter procedure BestCustomer

as
Begin
	SELECT billingcity,SUM(total) AS InvoiceTotal
	FROM invoice
	GROUP BY billingcity
	ORDER BY InvoiceTotal DESC

    select *  from Invoice
end

exec BestCustomer

------BESTCustomer---------

select * from customer1

ALter procedure Number1Customer

as
begin
	SELECT c.customerid, firstname, lastname, SUM(total) AS total_spending
	FROM customer1 c
	JOIN invoice i ON c.customerid = i.customerid
	GROUP BY c.customerid,Firstname,LastName
	ORDER BY total_spending DESC

end

exec Number1Customer

select * from customer1
select * from Invoice

select c.customerid, firstname,lastname,SUM(TOTAL) as total_spending FROM customer1 c Right JOIN INVOICE I ON c.customerid=i.customerid 
group by c.customerid,Firstname,LastName order by total_spending desc


----Max no of Pop music who listened---------

Alter procedure Pop_mx_listerner

as
begin
	SELECT DISTINCT email,firstname, lastname
	FROM customer1 c
	JOIN invoice I ON c.customerid = I.customerid
	JOIN InvoiceLine1 IL ON I.invoiceid = IL.invoiceid
	WHERE trackid IN(
		SELECT trackid FROM track t
		JOIN genre g ON t.genreid = g.genreid
		WHERE g.Gname LIKE 'Pop'
	)
	ORDER BY email
end 

exec Pop_mx_listerner

--select * from customer1
--select * from InvoiceLine1
--select * from Genre
--select * from Track


-------wring the novel-------
create procedure writingNovel


as
begin
	SELECT art.artistid, art.Name,COUNT(art.artistid) AS number_of_songs
	FROM track t
	JOIN Albums a ON A.AlblumId = t.AlblumId
	JOIN Artists art ON art.artistid = A.artistid
	JOIN genre g ON g.genreid = t.genreid
	WHERE g.Gname in ('pop','melody')
	GROUP BY art.artistid,art.Name
	ORDER BY number_of_songs DESC
end
exec WritingNovel

select * from Track
select * from Albums
select * from Artists
select * from genre


------artist accoriding to Invoice------------
alter procedure ArtistAccInvoice

as
begin
	--SELECT art.ArtistId AS artistid,art.name,SUM(IL.unitprice*IL.quantity) AS total_sales
	--FROM invoiceline1 IL
	--JOIN track ON track.trackid = IL.trackid
	--JOIN albums a ON a.AlblumId = track.AlblumId
	--JOIN artist art ON art.artistid = a.artistid
	--GROUP BY art.ArtistId,art.Name
	--ORDER BY artistid DESC

 SELECT  SUM(il.unitprice*il.quantity) AS amount_spent,c.customerid,c.firstname,c.lastname
FROM invoice i
JOIN customer1 c ON c.customerid = i.customerid
JOIN InvoiceLine1 il ON il.invoiceid = i.invoiceid
JOIN track t ON t.trackid = il.trackid
JOIN Albums alb ON alb.AlblumId = t.AlblumId
JOIN Artists bsa ON bsa.artistid = alb.artistid
GROUP BY c.customerId,c.Firstname,c.LastName
 end

exec ArtistAccInvoice
select * from Albums
select * from artists

-----------------------------------Popular music Genre----------------------------------------------
Alter procedure PopularMusicGenre

as
begin
SELECT COUNT(*) AS purchases_per_genre, c1.country, g.Gname, g.genreid
FROM InvoiceLine1 IL
JOIN invoice i ON i.invoiceid = IL.invoiceid
JOIN customer1 c1 ON c1.customerid = i.customerid
JOIN track t ON t.trackid = IL.trackid
JOIN genre g ON g.genreid = t.genreid
group by c1.country,g.gname,g.genreid

end

exec PopularMusicGenre

-


--select * from customer1---

----spending more money on the music-----

create procedure SpendMuchmoneyOnMusic

as
begin
select c.customerid,firstname,lastname,billingcountry,SUM(total) AS totalspending
		FROM invoice i
		inner JOIN customer1 c ON c.customerid = i.customerid
		GROUP BY c.customerId,firstname,LastName,billingcountry
		ORDER BY c.customerId
end

exec SpendMuchmoneyOnMusic

-------------------Number of customer who listen very less number of times-----------

create procedure SpendLessOnMusic

as
begin
select c.customerId,firstname,lastname,billingcountry,min(total) as leastSpending
    from invoice i inner join customer1 c on c.customerid=i.CustomerId
	group by c.customerId,firstname,lastname,BillingCountry
	order by c.customerid,BillingCountry

end
exec SpendLessOnMusic

select * from invoice 
select * from customer1



