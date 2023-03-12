use QLSV

-- tao bang

create table KHOA(
	MaKhoa varchar(10) not null,
	TenKhoa nvarchar(50) not null,
	SL_CBGD smallint not null,
	primary key(MaKhoa),
);

create table SINHVIEN(
	MSSV varchar(5) not null,
	Ten nvarchar(50) not null,
	GioiTinh varchar(5) not null,
	DiaChi nvarchar(100),
	DienThoai varchar(20) not null, 
	MaKhoa varchar(10) not null,
	primary key(MSSV),
);

create table GIAOVIEN(
	MaGV varchar(5) not null,
	TenGV nvarchar(50) not null,
	MaKhoa varchar(10) not null,
	primary key(MaGV),
);

create table MONHOC(
	MaMH varchar(5) not null,
	TenMH nvarchar(50) not null,
	SoTC smallint not null,
	primary key(MaMH),
);

create table GIANGDAY(
	MaKhoaHoc varchar(5) not null,
	MaGV varchar(5) not null,
	MaMH varchar(5) not null,
	HocKy smallint not null,
	Nam int not null,
	primary key(MaKhoaHoc),
);

create table KETQUA(
	MaSV varchar(5) not null,
	MaKhoaHoc varchar(5) not null,
	Diem decimal(3, 1) not null,
	primary key(MASV, MaKhoaHoc),
);

alter table KETQUA
add constraint FK_KETQUA_GIANGDAY
foreign key(MaKhoaHoc)
references GIANGDAY(MaKhoaHoc);

alter table GIANGDAY
add constraint FK_GIANGDAY_GIAOVIEN
foreign key(MaGV)
references GIAOVIEN(MaGV);

alter table KETQUA
add constraint FK_KETQUA_SINHVIEN
foreign key(MaSV)
references SINHVIEN(MSSV);

alter table SINHVIEN
add constraint FK_SINHVIEN_KHOA
foreign key(MaKhoa)
references KHOA(MaKhoa);

alter table GIAOVIEN
add constraint FK_GIAOVIEN_KHOA
foreign key(MaKhoa)
references KHOA(MaKhoa);

alter table GIANGDAY
add constraint FK_GIANGDAY_MONHOC
foreign key(MaMH)
references MONHOC(MaMH);

--Nhap du lieu

BEGIN
	alter table KHOA nocheck constraint all 
	insert into dbo.KHOA(MaKhoa, TenKhoa, SL_CBGD)
	values
		('CNTT', 'Cong nghe thong tin', 15),
		('TOAN', 'Toan', 20),
		('SINH', 'Sinh hoc', 7);
	alter table KHOA check constraint all 
END

BEGIN
	alter table SINHVIEN nocheck constraint all 
	insert into dbo.SINHVIEN(MSSV, Ten, GioiTinh, DiaChi, DienThoai, MaKhoa)
	values
		('SV001', 'BUI THUY AN', 'Nu', '223 TRAN HUNG DAO .HCM', '8843132202', 'CNTT'),
		('SV002', 'NGUYEN THANH TUNG', 'Nam', '140 CONG QUYNH .HCM', '0581525678', 'CNTT'),
		('SV003', 'NGUYEN THANH LONG', 'NaM', '124/4 CONG QUYNH .HCM', '0918345623', 'TOAN'),
		('SV004', 'HOANG THI HOA', 'Nu', '90 NGUYEN VAN CU .HCM', '0988320123', 'CNTT'),
		('SV005', 'TRAN HONG SON', 'Nam', '50 CAO THANG .HA NOI', '0928345987', 'TOAN');
	alter table SINHVIEN check constraint all 
END

BEGIN
	alter table GIAOVIEN nocheck constraint all 
	insert into dbo.GIAOVIEN(MaGV, TenGV, MaKhoa)
	values
		('GV01', 'PHAM THI THAO', 'CNTT'),
		('GV02', 'LAM HOANG VU', 'TOAN'),
		('GV03', 'TRAN VAN TIEN', 'CNTT'),
		('GV04', 'HOANG VUONG', 'CNTT');
	alter table GIAOVIEN check constraint all 
END

BEGIN
	alter table MONHOC nocheck constraint all 
	insert into dbo.MONHOC(MaMH, TenMH, SoTC)
	values
		('CSDL', 'CO SO DU LIEU', 3),
		('CTDL', 'CAU TRUC DU LIEU', 4),
		('KTLT', 'KY THUAT LAP TRINH', 5),
		('CWIN', 'LAP TRINH C TREN WINDOW', 4);
	alter table MONHOC check constraint all 
END

BEGIN
	alter table GIANGDAY nocheck constraint all 
	insert into dbo.GIANGDAY(MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
	values
		('K1', 'GV01', 'CSDL', 1, 2021),
		('K2', 'GV04', 'KTLT', 2, 2020),
		('K3', 'GV03', 'CTDL', 1, 2020),
		('K4', 'GV04', 'CWIN', 1, 2021),
		('K5', 'GV01', 'CSDL', 1, 2021);
	alter table GIANGDAY check constraint all 
END

BEGIN
	alter table GIANGDAY nocheck constraint all 
	insert into dbo.GIANGDAY(MaKhoaHoc, MaGV, MaMH, HocKy, Nam)
	values
		('K1', 'GV01', 'CSDL', 1, 2021),
		('K2', 'GV04', 'KTLT', 2, 2020),
		('K3', 'GV03', 'CTDL', 1, 2020),
		('K4', 'GV04', 'CWIN', 1, 2021),
		('K5', 'GV01', 'CSDL', 1, 2021);
	alter table GIANGDAY check constraint all 
END

BEGIN
	alter table KETQUA nocheck constraint all 
	insert into dbo.KETQUA(MaSV, MaKhoaHoc, Diem)
	values
		('SV001', 'K1', 8.5),
		('SV002', 'K3', 7.0),
		('SV003', 'K4', 7.5),
		('SV001', 'K2', 9.0),
		('SV004', 'K3', 6.0),
		('SV005', 'K3', 7.0),
		('SV002', 'K1', 7.0),
		('SV003', 'K2', 8.5),
		('SV005', 'K5', 7.0),
		('SV004', 'K4', 2.0);
	alter table KETQUA check constraint all 
END

--Bai tap

select * from SINHVIEN