--create database DigitalMusicStoreAnalysis

--use DigitalMusicStoreAnalysis

----Artist Table----

--create table Artist(ArtistId int,Name varchar(20))
create table Artists(ArtistId int primary key,Name varchar(20))

------Album table---------
create table Albums(AlblumId int primary key,Title varchar(20),ArtistId int,Foreign key (ArtistId) references Artists(ArtistId))
select * from albums
--------MediaType
create table MediaType(MediaTypeId varchar(10)primary key,Mname varchar(20))

---------Genre table
create table Genre(GenreId int primary key,Gname varchar(20))

--drop table genre

-------Track table---------
create table Track(TrackId char(5)primary key,TName varchar,AlblumId int,MediaTypeId varchar(10) 
,GenreId int,composer varchar(20),Mileseconds time ,Bytes bit,Unitprice numeric,Foreign key(AlblumId) references Albums(AlblumId),foreign key(MediaTypeId) references MediaType(MediaTypeId),foreign key (genreId) references genre(genreId))

ALTER TABLE Track
alter column Tname varchar(20)
--desc track
alter table track
alter column UnitPrice numeric(5,2)
select * from track
-----InvoiceLine-----
create table InvoiceLine1(InvoiceLineId int,InvoiceId int,TrackId char(5),unitPrice numeric(10,5),quantity int,foreign key(Trackid) references track(trackid))
select * from InvoiceLine1

 --drop table InvoiceLine1
-----Invoice table-----

--create table Invoice(InvoiceId int primary key,CustomerId int,InvoiceDate date,BillingAddress varchar(50),BillingCity varchar(20),BillingState varchar(20),BillingCountry varchar(20),BillingPostalCode int,total float,foreign key(CustomerId) references customer(Custerid))

-------customer
create table customer1(customerId int primary key,Firstname varchar(20),LastName varchar(10),Comapany varchar(20),Address varchar(20),city varchar(20),State varchar(20),country varchar(20),postalCode int,phone numeric ,check(len(phone)=10),fax int,email varchar(20),SupportRepId int,foreign key(fax) references employee(Fax))
--drop table customer1
-----Invoice table-----

create table Invoice(InvoiceId int primary key,CustomerId int,InvoiceDate date,BillingAddress varchar(50),BillingCity varchar(20),BillingState varchar(20),BillingCountry varchar(20),BillingPostalCode int,total float,foreign key(CustomerId) references Customer1(Customerid))
--drop table Invoice
--------Employee-----
create table employee(EmployeeId int ,LastName varchar(20),FirstName varchar(20),Title varchar(20),ReportsTo int,BirthDate date,HireDate date,Address varchar(20),city varchar(20),State varchar(20),country varchar(20),PostalCode int,Phone numeric,Fax int primary key,Email varchar(20))

--drop table employee





