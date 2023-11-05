create database qlsv

create table KHOA(
   makh char(10) not null primary key,
   vpkh nvarchar(20),
)

create table LOP(
   malop char(10) not null primary key,
   makh char(10),
   foreign key (makh) references KHOA(makh),
   
)

create table SINHVIEN(
   masv char(20) not null primary key,
   hosv nvarchar(10),
   tensv nvarchar(10),
   nssv date,
   dcsv nvarchar(30),
   loptr nvarchar(30),
   malop char(10)
   foreign key (malop) references LOP(malop),
)


create table MONHOC(
   mamh char(20) not null primary key,
   tenmh nvarchar(10),
   lt int,
   th int,
)
 
create table CTHOC(
   malop char(10), 
   foreign key (malop) references LOP(malop),
   hk int,
   mamh char(20),
   foreign key (mamh) references MONHOC(mamh),
)

create table DIEMSV(
    masv char(20),
	foreign key (masv) references SINHVIEN(masv),
	mamh char(20),
    foreign key (mamh) references MONHOC(mamh),
	lan int,
	diem float,
)

