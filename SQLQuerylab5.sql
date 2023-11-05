create database qLoto;

create table oTo(
     MAXE nvarchar(12) not null primary key,
	 TENXE nvarchar(20),
	 HANGXE nvarchar(20),
	 GIAXE int,
	 NAMSX datetime,
	 
)

insert into oTo values('1', 'BMW2022','BMW', 10000, 12/3/2022)
insert into oTo values('2', 'BMW2002','BMW', 50000, 14/3/2020)


create table HangXe(
     IdHX nvarchar(20) not null primary key,
	 TenHang nvarchar(30),
	 DatNuoc nvarchar(30),
);
insert into HangXe values('1','Hang1','England')
insert into HangXe values('2','Hang2','Germany')
drop table HangXe


create table KhachHang(
    IdK nvarchar(30) not null primary key,
	TenKH nvarchar(30),
	CMT int,
);
insert into KhachHang values('1','A','0012030405')
insert into KhachHang values('2','B','0012040506')


create table KhachHangXe(
   Id nvarchar(20) not null primary key,
   IdK nvarchar(30),
   IdX nvarchar(12),
   
)
insert into KhachHangXe values('1','001','A01')
insert into KhachHangXe values('2','002','A02')

drop table KhachHangXe


select TenHang from HangXe
