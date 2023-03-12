use QLDA

-- Tao bang ghi
create table NHANVIEN(
	manv varchar(5) not null,
	honv nvarchar(20) not null,
	tenlot nvarchar(20) not null,
	tennv nvarchar(10) not null,
	ngaysinh date not null,
	diachi nvarchar(100) not null ,
	phai varchar(5) not null ,
	luong decimal(10, 2) not null ,
	mapb varchar(5) not null,
	primary key(manv)
);

create table PHONGBAN(
	mapb varchar(5) not null,
	tenpb nvarchar(50) not null,
	truongphong varchar(5) not null,
	ng_nhanchuc date not null
	primary key(mapb)
);

create table DEAN(
	mada varchar(5) not null,
	tenda nvarchar(50) not null,
	ddiem_da nvarchar(100) not null,
	mapb varchar(5) not null,
	primary key(mada)
);

create table THANNHAN(
	manv varchar(5) not null,
	tentn nvarchar(30) not null,
	phai varchar(5) not null,
	ngaysinh date not null,
	quanhe nvarchar(20) not null
	primary key(manv, tentn)
);

create table PHANCONG(
	manv varchar(5) not null,
	mada varchar(5) not null,
	thoigian decimal(5,1) not null
	primary key(manv, mada)
);

create table DDIEMPB(
	mapb varchar(5) not null,
	diadiem nvarchar(100) not null, 
	primary key(mapb, diadiem)
);

-- Them Khoa ngoai

alter table PHONGBAN
add constraint FK_PHONGBAN_NHANVIEN
foreign key (truongphong)
references NHANVIEN(manv);

alter table NHANVIEN
add constraint FK_NHAN_VIEN_PHONGBAN
foreign key (mapb)
references PHONGBAN(mapb);

alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN
foreign key (manv)
references NHANVIEN(manv);

alter table DEAN
add constraint FK_DEAN_PHONGBAN
foreign key (mapb)
references PHONGBAN(mapb);

alter table DDIEMPB
add constraint FK_DDIEMPB_PHONGBAN
foreign key (mapb)
references PHONGBAN(mapb);

alter table PHANCONG
add constraint FK_PHANCONG_DEAN
foreign key (mada)
references DEAN(mada);

alter table PHANCONG
add constraint FK_PHANCONG_NHANVIEN
foreign key (manv)
references NHANVIEN(manv);

-- nhap du lieu

BEGIN
	alter table NHANVIEN
	nocheck constraint ALL

	insert into dbo.NHANVIEN(manv, honv, tenlot, tennv, ngaysinh, diachi, phai, luong, mapb)
	values
		('NV1','DINH','BA','TIEN','1985-09-01','731 Tran Hung Dao , Q1, TPHCM', 'NAM', 30000, 'P3'),
		('NV2', 'VO', 'THANH', 'TUNG', '1975-08-12', '638 Tran Hung Dao', 'NAM', 40000, 'P3'),
		('NV3', 'TRAN', 'THANH', 'TAM', '1982-07-31', '853 Mai Thi Luu , Q1 , TPHCM', 'NAM', 25000, 'P2'),
		('NV4', 'VO', 'MANH', 'HUNG', '1972-09-15', '975 Ba Ria , Vung Tau', 'NAM', 38000, 'P2'),
		('NV5', 'LE', 'NGOC', 'QUYEN', '1987-10-10', '450 Trung Vuong , Ha Noi', 'NU', 55000, 'P1'),
		('NV6', 'TRAN', 'MINH', 'KHANG', '1982-06-24', 'Tran Binh Trong , TPHCM', 'NAM', 58000, 'P1'),
		('NV7', 'LE', 'THI', 'NHAN', '1981-06-20', '291 Ho Van Huc , QPN , TPHCM', 'NU', 43000, 'P3'),
		('NV8', 'TRAN', 'HONG', 'QUANG', '1979-03-29', '980 Le Hong Phong , Q10 , TPHCM', 'NAM', 25000, 'P2'),
		('NV9', 'BUI', 'THUY', 'VU', '1978-07-19', '332 Nguyen Thai Hoc , Q1 , TPHCM', 'NU', 25000, 'P1');
	
	alter table NHANVIEN
	check constraint ALL

	update NHANVIEN
	set diachi = '731 Tran Hung Dao , Q1, TPHCM'
	where manv = 'NV1'
END

BEGIN
	alter table PHONGBAN nocheck constraint all

	insert into dbo.PHONGBAN(mapb, tenpb, truongphong, ng_nhanchuc)
	values
		('P1', 'QUANLY', 'NV5', '2016-06-19'),
		('P2', 'DIEUHANH', 'NV8', '2018-01-01'),
		('P3', 'NGHIENCUU', 'NV2', '2017-05-22');

	alter table PHONGBAN check constraint all
END

BEGIN
	alter table DDIEMPB nocheck constraint all
	insert into dbo.DDIEMPB(mapb, diadiem)
	values
		('P1', 'TPHCM'),
		('P2', 'HA NOI'),
		('P3', 'NHA TRANG'),
		('P3', 'TPHCM'),
		('P3', 'VUNG TAU');
	alter table DDIEMPB nocheck constraint all
END

BEGIN
	alter table DEAN nocheck constraint all
	insert into dbo.DEAN(mada, tenda, ddiem_da, mapb)
	values
		('DA1', 'San pham X', 'VUNG TAU', 'P3'),
		('DA2', 'San pham Y', 'NHA TRANG', 'P3'),
		('DA3', 'San pham Z', 'TPHCM', 'P3'),
		('DA4', 'Tin hoc hoa', 'HA NOI', 'P2'),
		('DA5', 'Cap quang', 'TPHCM', 'P1'),
		('DA6', 'Dao tao', 'HA NOI', 'P2');
	alter table DEAN check constraint all
END

BEGIN
	alter table PHANCONG nocheck constraint all
	insert into dbo.PHANCONG(manv, mada, thoigian)
	values
		('NV1', 'DA1', 32.5),
		('NV1', 'DA2', 7.5),
		('NV1', 'DA3', 10),
		('NV2', 'DA3', 40),
		('NV2', 'DA4', 20),
		('NV2', 'DA5', 20),
		('NV3', 'DA1', 20),
		('NV3', 'DA2', 20),
		('NV4', 'DA3', 10),
		('NV5', 'DA4', 10),
		('NV5', 'DA5', 10),
		('NV7', 'DA6', 30),
		('NV8', 'DA4', 10),
		('NV8', 'DA6', 20),
		('NV9', 'DA4', 15);
	alter table PHANCONG check constraint all
END

BEGIN
	alter table THANNHAN nocheck constraint all
	insert into dbo.THANNHAN(manv, tentn, phai, ngaysinh, quanhe)
	values
		('NV1','DINH BA KIEN', 'NAM', '1995-07-15', 'CON TRAI'),
		('NV1', 'NGUYEN THANH THAO', 'NU', '1988-04-08', 'VO'),
		('NV2', 'VO THANH SON', 'NAM', '1950-09-23', 'CHA'),
		('NV3', 'LE THI HUONG', 'NU', '1984-01-09', 'VO'),
		('NV3', 'TRAN LE NGOC HOA', 'NAM', '2017-09-12', 'CON GAI'),
		('NV6', 'TRAN MINH AN', 'NAM', '1980-08-05', 'ANH TRAI'),
		('NV7', 'LE THI NGAN', 'NU', '1980-06-07', 'EM AI'),
		('NV9', 'TRAN QUOC VUONG', 'NAM', '1975-05-05', 'CHONG');
	alter table THANNHAN check constraint all
END

--bai tap

--1 Ten tuoi tung NV
select (NHANVIEN.honv + ' ' + NHANVIEN.tenlot + ' ' + NHANVIEN.tennv) as 'Ten NV', (year(getdate())-year(nhanvien.ngaysinh)) as 'Tuoi'
from NHANVIEN

--2 
select * from NHANVIEN
where NHANVIEN.diachi like '%Tran Hung Dao%' and NHANVIEN.phai = 'NAM'

--3
select * from NHANVIEN
where NHANVIEN.honv = 'LE' and NHANVIEN.tennv like 'N%'

--4 
select * from NHANVIEN
where month(NHANVIEN.ngaysinh)=7 and year(NHANVIEN.ngaysinh)=1978

--5 Nhan vien sinh vao quy 3
select * from NHANVIEN
where datepart(quarter,NHANVIEN.ngaysinh)=3

--6 Dem de an duoc phan cong cho tung nhan vien
select PC.manv, NV.tennv, count(PC.mada) as 'So lg de an' 
from PHANCONG PC join NHANVIEN NV on PC.manv = NV.manv
group by PC.manv, NV.tennv

--7

select TN.manv, NV.tennv
from NHANVIEN NV join THANNHAN TN on NV.manv = TN.manv
group by TN.manv, NV.tennv
having count(TN.quanhe) >= 2

--8

select NHANVIEN.tennv from NHANVIEN
where NHANVIEN.manv in(
	select PHANCONG.manv from NHANVIEN, PHANCONG, DEAN
	where NHANVIEN.manv = PHANCONG.manv and PHANCONG.mada = DEAN.mada and DEAN.ddiem_da = 'TPHCM' and (year(GETDATE()) - year(NHANVIEN.ngaysinh) > 30)
	--group by PHANCONG.manv
)

--9 bao nhieu de an o tphcm

select count(*) as 'So de an TPHCM' from DEAN
where DEAN.ddiem_da = 'TPHCM'
group by DEAN.ddiem_da

--10 ten va so de an o moi tp

select DEAN.ddiem_da, count(*) as 'So de an' from DEAN
group by DEAN.ddiem_da

--11 Tham nien cua truong phong

select (NHANVIEN.honv + ' ' + NHANVIEN.tenlot + ' ' + NHANVIEN.tennv) as 'Ten TPhong', 
year(getdate()) - year(PHONGBAN.ng_nhanchuc) as 'Tham nien' from NHANVIEN, PHONGBAN
where NHANVIEN.manv = PHONGBAN.truongphong

--12 So luong DDiem tung phong ban

select DDIEMPB.mapb, count(*) as 'So lg dia diem' from DDIEMPB
group by DDIEMPB.mapb

--13 bao nhieu ten DA la 'SAN PHAM'

select count(*) as 'So luong de an SAN PHAM' from DEAN
group by SUBSTRING(DEAN.TENDA, 1, 8)
having SUBSTRING(DEAN.TENDA, 1, 8) = 'SAN PHAM'

--14 

select PHONGBAN.tenpb, DEAN.tenda, DEAN.ddiem_da as 'Dia diem VP va de an' from PHONGBAN, DEAN, DDIEMPB
where DEAN.mapb = DDIEMPB.mapb and DEAN.ddiem_da = DDIEMPB.diadiem and DDIEMPB.mapb = PHONGBAN.mapb

--15

SELECT HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV]
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE NV.LUONG < (SELECT AVG(NV1.LUONG) FROM NHANVIEN NV1 WHERE NV1.MAPB = NV.MAPB)

--16

--17

--18

select NV.tennv from NHANVIEN NV
where NV.manv not in(
select  NHANVIEN.manv
from NHANVIEN left join THANNHAN on NHANVIEN.manv = THANNHAN.manv
where (THANNHAN.quanhe like '%CON%'))

--19

select DA.tenda, NV.honv+' '+NV.tenlot+' '+NV.tennv as [Ten NV], PC.thoigian
from (PHANCONG PC join NHANVIEN NV on PC.manv = NV.manv) join DEAN DA on PC.mada = DA.mada
where PC.thoigian = (select max(PC1.thoigian) from PHANCONG PC1 where PC1.mada = PC.mada)

--20



--21 ten PB co nv nu

select PB.tenpb 
from PHONGBAN PB join NHANVIEN NV on PB.truongphong = NV.manv
where NV.phai = 'NU'

--22 Voi moi DA -> so luong NV, tong thoi gian DA

select DA.tenda, count(PC.manv) as [so nv tham gia], sum(PC.thoigian) as [tong thoi gian]
from PHANCONG PC join DEAN DA on PC.mada = DA.mada
group by DA.mada, PC.mada, DA.tenda

--23 Voi moi PB -> Ten PB, so nam, so nu

select PB.tenpb, SUM(CASE WHEN NV.phai = 'NAM' THEN 1 END) as [nam], SUM(CASE WHEN NV.phai = 'NU' THEN 1 ELSE 0 END) as [nu]
from PHONGBAN PB join NHANVIEN NV on PB.mapb = NV.mapb
group by PB.tenpb, PB.mapb

--24 Ten pb co nv nu nhieu nhat

select PB.tenpb, sum(case when NV.PHAI='NU' then 1 else 0 end) demnu
from PHONGBAN PB join NHANVIEN NV on PB.mapb = NV.mapb 
group by PB.tenpb, NV.mapb
having sum(case when NV.PHAI='NU' then 1 else 0 end) = (
	select max(dem.nu) from(
	select sum(case when NV.PHAI='NU' then 1 else 0 end) nu
	from PHONGBAN PB join NHANVIEN NV on PB.mapb = NV.mapb 
	group by NV.mapb
	)as dem
)

--25

--26


--31 NV truong phong co ngay nhan chuc moi nhat

select NV.honv+' '+NV.tenlot+' '+NV.tennv as [Ten NV]
from PHONGBAN PB join NHANVIEN NV on PB.truongphong = NV.manv 
where PB.ng_nhanchuc = (select max(ngaymax.ng_nhanchuc) from(select ng_nhanchuc from PHONGBAN) as ngaymax)

--32 Phong ban chi phu trach o HN

select PB.tenpb
from PHONGBAN PB join DEAN DA on PB.mapb = DA.mapb
group by PB.mapb, PB.tenpb
having count(DA.mada) = (select count(DEAN.mada) from DEAN where DEAN.ddiem_da = 'HA NOI' group by DEAN.mapb)

--33 

--PHONGBAN pb join (select * from DEAN where DEAN.ddiem_da='HA NOI')as deanHN on pb.mapb = deanHN.mapb

--35 Ten nv lam de an o phong ban p2

select nv.tennv
from nhanvien nv
where not exists(
select *
from dean da
where mapb='P2' and not exists(
select *
from phancong pc
where pc.mada=da.mada
and pc.manv=nv.manv))

--36 ten DA, ten NV, tong so gio, so gio max

