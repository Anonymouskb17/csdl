create database QlOTO;
create table OTO
(
    MaXe nvarchar(12) not null primary key,
	TenXe nvarchar(20),
	HangXe nvarchar(20),
	GiaXe int,
	NamSX datetime,

)
insert into OTO values('1','GLC','merce',1000000, '');