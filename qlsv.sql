create database qlsv

create table SINHVIEN(
   masv varchar(30) not null primary key,
   hodem nvarchar(10),
   ten nvarchar(10),
   ngaysinh date,
   gioitinh char(5),
   noisinh nvarchar(50),
   malop char(20),
   foreign key (malop) references LOP(malop), 
)

create table LOP(
   malop char(20) not null primary key,
   tenlop varchar(30),
   khoa char(20),
   hedaotao char(20),
   namnhaphoc date,
   siso int,
   makhoa char(20),
   foreign key (makhoa) references KHOA(makhoa),
)

create table KHOA(
   makhoa char(20) not null primary key,
   tenkhoa nvarchar(30),
   dienthoai int,
)

create table DIEMTHI(
   diemlan1 int,
   check (0<=diemlan1 and diemlan1<=10),
   diemlan2 int,
   check(0<=diemlan2 and diemlan2<=10),
 
   mamonhoc char(20),
   foreign key (mamonhoc) references MONHOC(mamonhoc),
   masv varchar(30),
   foreign key (masv) references SINHVIEN(masv),
)

create table MONHOC(
   mamonhoc char(20) not null primary key,
   tenmonhoc char(20),
   sodvht int,
   check (1<=sodvht and sodvht<=5),
)

insert into KHOA values ('001','CNTT',0965341879),
                        ('002','KT',0955123875),
						('003','CK',0897593489),
						('004','CT',0937291473),
						('005','NN',0324474274),
						('006','HH',0324474285)


			

insert into LOP values ('1','CNTT4','CNTT','chinh quy','2021-07-20',70,'001'),
                       ('2','KT1','KT','chinh quy','2021-07-25',65,'002'),
					   ('3','CK1','CK','chinh quy','2021-07-15',68,'003'),
					   ('4','CT2','CT','chinh quy','2021-07-10',62,'004'),
					   ('5','NNA1','NN','chinh quy','2021-07-16',67,'005'),
					   ('6','HH1','HH','chinh quy','2021-07-09',74,'006')


insert into SINHVIEN values ('2151062707',N'Nguyễn Văn',N'Dũng','2003-07-24','nam',N'Hà Nội','1'),
                            ('2151062908',N'Nguyễn Hà',N'My','2003-08-05','nu',N'Nam Định','2'),
							('2151060405',N'Lê Văn',N'Duy','2003-03-18','nam',N'Tuyên Quang','3'),
							('2151062308',N'Vũ Văn',N'Hiếu','2003-10-20','nam',N'Tuyên Quang','4'),
							('0471031007',N'Lê Văn',N'Minh','2003-10-23','nam',N'Thanh Hóa','5'),
							('2357257576',N'Nguyễn Văn',N'Hải','2003-01-23','nam',N'Hà Tĩnh','6')

insert into MONHOC values ('010','Hoc may',1),
                          ('020','Tin hoc dai cuong',2),
						  ('030','Dai so tuyen tinh',3),
						  ('040','Xac suat thong ke',4),
						  ('050','Cau truc ngon ngu',5),
						  ('060','Cap thoat nuoc',6)

insert into DIEMTHI values (6,8,'010','2151062707'),
                           (5,7,'020','2151062908'),
						   (3,5,'030','2151060405'),
						   (4,9,'040','2151062308'),
						   (3,9,'050','0471031007'),
						   (2,7,'060','2357257576')


--I
update SINHVIEN set ngaysinh='1992-6-26' where masv='0471031007'
update DIEMTHI set diemlan1 = diemlan1 + 1 where mamonhoc='020'
update MONHOC set sodvht= sodvht +1 where sodvht =3

--II
delete from SINHVIEN where noisinh= N'Tuyên Quang'
delete from SINHVIEN where ngaysinh<'1991'

--III

select malop,tenlop,hedaotao from LOP

select * from KHOA

select LOP.malop, LOP.tenlop, KHOA.makhoa, KHOA.tenkhoa from LOP join KHOA on LOP.makhoa= KHOA.makhoa

select malop,tenlop,namnhaphoc from LOP

select masv,hodem,ten,gioitinh  from SINHVIEN

select tenmonhoc,sodvht*15 as sotiet  from MONHOC

select top 5 * from SINHVIEN order by hodem,ten,ngaysinh desc

SELECT TOP 10 PERCENT hodem,ten,ngaysinh FROM SINHVIEN ORDER BY NEWID()

select mamonhoc,tenmonhoc   from MONHOC where sodvht>=4

--10
update SINHVIEN set ten='linh' where masv='2151062908'
select masv, hodem, ten, ngaysinh FROM SINHVIEN WHERE ten = 'linh' AND YEAR(2023)- YEAR(2003)>=21

--11
select hodem, ten,YEAR(2023)- YEAR(2003) as tuoi from SINHVIEN WHERE ten = 'linh' and YEAR(2023)-YEAR(2003) between 20 and 22

--12
select mamonhoc,tenmonhoc  from MONHOC where sodvht in(2,4,5)

--13
select hodem  from SINHVIEN where ten='Hoang'

--14 
create table TUOISV(
    tuoi int,
	hodem nvarchar(20),
	ten nvarchar(20)
	
)

--15 
select mamonhoc,tenmonhoc,sodvht FROM MONHOC ORDER BY sodvht ASC

--16
select hodem,ten,gioitinh, YEAR(2023)- YEAR(2003) as tuoi from SINHVIEN where ten='linh' order by tuoi desc, gioitinh desc

--17
select malop,tenlop from LOP where khoa='toan-tin'

--18 
select masv,hodem,ten, LOP.malop,LOP.tenlop,KHOA.tenkhoa   from SINHVIEN,KHOA,LOP
--19 
alter table SINHVIEN add makhoa char(15)
select hodem,ten,ngaysinh   from SINHVIEN join KHOA on SINHVIEN.makhoa= KHOA.makhoa where KHOA.tenkhoa='toan-tin'

--20
select hodem,ten,ngaysinh from SINHVIEN WHERE ngaysinh = (select ngaysinh FROM SINHVIEN WHERE hodem='Nguyễn Hoàng' and ten='ten')

--21
update LOP set malop='K45' where malop='5'
select hodem,ten,ngaysinh   from SINHVIEN join LOP on SINHVIEN.malop= LOP.malop where LOP.malop='K45'

--22
select avg(diemlan1) as trungbinhdiemlan1 from DIEMTHI

--23
select MAX(date() - YEAR(ngaysinh)) AS tuoilon,
       MIN(date() - YEAR(ngaysinh)) AS tuoinho,
       AVG(date() - YEAR(NgaySinh)) AS tuoitrungbinh
from SINHVIEN where noisinh= 'Thái Nguyên'

--24
select siso  from LOP

--25 
select tenmonhoc,avg(diemlan1) as trungbinhdiemlan1 from MONHOC, DIEMTHI

--26 
alter table DIEMTHI add diemtrungbinh char(15)
select avg(diemlan1) as diemtrungbinh from DIEMTHI where diemtrungbinh>=5  

--27
select makhoa, count(*) as solop from LOP group by KHOA

--28
select malop,tenlop, count(*) as solop from LOP group by KHOA

--29

select malop,tenlop, count(*) as solop from LOP

--30
select count(tenlop) as danhsachlop, count(*) as tonglop from LOP group by KHOA;

--31
update MONHOC set mamonhoc='TI001' where mamh='010'
select tenmonhoc from MONHOC where sodvht >= (select sodvht from MONHOC where mamonhoc = 'TI001')

--32
select hodem,ten from SINHVIEN, LOP where tenlop = 'Tin K45' and ngaysinh < (select min(ngaysinh) from SINHVIEN,LOP WHERE tenlop = 'Sinh K45')


--33
select hodem,ten,ngaysinh from SINHVIEN, LOP where tenlop = 'Tin K45' and ngaysinh = (select ngaysinh from SINHVIEN,LOP WHERE tenlop = 'Sinh K45')

--34
select hodem,ten from SINHVIEN where SINHVIEN.masv not in (select DIEMTHI.masv FROM DIEMTHI)

--35
select mamonhoc, ten, AVG(DiemLan1) AS TrungBinhLan1 FROM DiemThi GROUP BY MaMonHoc, TenMonHoc HAVING AVG(DiemLan1) > (SELECT AVG(DiemLan1) FROM DiemThi);


select *  from SINHVIEN
select * from MONHOC
select * from DIEMTHI

drop table SINHVIEN
drop table LOP
drop table KHOA
drop table MONHOC
drop table DIEMTHI

