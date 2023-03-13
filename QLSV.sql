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

-- Bai tap

-- 1. Cho biết tên, địa chỉ, điện thoại của sinh viên.
select SV.Ten, SV.DiaChi, SV.DienThoai from SINHVIEN SV	

-- 2. Cho biết tên các môn học và số tín chỉ của từng môn học.
select MH.TenMH, MH.SoTC from MONHOC MH

-- 3. Cho biết kết quả học tập của SV có mã số SV3
select MH.TenMH, KQ.diem from KETQUA KQ, GIANGDAY GD, MONHOC MH
where GD.MaKhoaHoc = KQ.MaKhoaHoc and GD.MaMH = MH.MaMH and KQ.MaSV = 'SV003'

-- 4. Cho biết tên các môn học và soos tín chỉ của những môn học có trấu trúc của mã môn học như sau:
-- ký tự thứ 1 là "C", ký tự thứ 3 là "D".
select MH.TenMH, MH.SoTC from MONHOC MH
where substring(MH.MaMH, 1, 1) = 'C' and substring(MH.MaMH, 3, 1) = 'D'

-- 5. Cho biết tên giáo viên có ký tự thứ 3 là "A".
select GV.TenGV from GIAOVIEN GV
where substring(GV.TenGV, 3, 1) = 'A'

--6. Cho biết tên những môn học chứa chữ "DU".
select MH.TenMH from MONHOC MH
where MH.TenMH like '%DU%'

--7. Cho biết tên các giáo viên có ký tự đầu tiên của họ và tên là 'P' và 'L'.
select GV.TenGV from GIAOVIEN GV
where substring(GV.TenGV, 1, 1) = 'P' or substring(GV.TenGV, 1, 1) = 'L'

--8. Cho biết tên, địa chỉ của từng sinh viên có địa chỉ trên đường "Cống Quỳnh".
select SV.Ten, SV.DiaChi from SINHVIEN SV
where SV.DiaChi like '%CONG QUYNH%'

--9. Cho biết danh sách các môn học được dạy trong năm 2021.
select MH.MaMH, MH.TenMH from MONHOC MH, GIANGDAY GD
where MH.MaMH = GD.MaMH and GD.nam = 2021

--10. Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp xếp
--theo thứ tự từ A-Z của tên sinh viên
select SV.MSSV, SV.Ten, SV.DiaChi from SINHVIEN SV
order by SV.Ten

--11. Cho biết điểm của các sinh  viên theo từng môn học

--12. Cho biết các SV học CSDL có kết quả từ 8 đến 10
select SV.MSSV, SV.Ten, KQ.Diem from SINHVIEN SV, KETQUA KQ, GIANGDAY GD
where SV.MSSV = KQ.MaSV and KQ.MaKhoaHoc = GD.MaKhoaHoc and GD.MaMH = 'CSDL' and KQ.Diem >= 8 and KQ.Diem <= 10

--13. Cho biết bảng điểm của SV tên 'TUNG'
select SV.Ten, MH.TenMH, KQ.Diem from SINHVIEN SV, KETQUA KQ, GIANGDAY GD, MONHOC MH
where SV.MSSV = KQ.MaSV and KQ.MaKhoaHoc = GD.MaKhoaHoc and GD.MaMH = MH.MaMH and SV.ten like '%TUNG%'

--14. Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học
select KHOA.TenKhoa, MH.TenMH from SINHVIEN SV, KETQUA KQ, GIANGDAY GD, MONHOC MH, KHOA
where SV.MSSV = KQ.MaSV and GD.MaKhoaHoc = KQ.MaKhoaHoc and MH.MaMH = GD.MaMH and KHOA.MaKhoa = SV.MaKhoa
group by KHOA.TenKhoa, MH.TenMH


--15. Cho biết tên khoa, mã khóa học mà giáo viên của khoa có tham gia giảng dạy
select KHOA.TenKhoa, GD.MaKhoaHoc from KHOA, GIAOVIEN GV, GIANGDAY GD
where KHOA.MaKhoa = GV.MaKhoa and GD.MaGV = GV.MaGV

--16. Cho biết các sinh viên đã học môn 'CSDL' hoặc 'CTDL'
select SV.Ten from SINHVIEN SV, KETQUA KQ, GIANGDAY GD
where SV.MSSV = KQ.MaSV and GD.MaKhoaHoc = KQ.MaKhoaHoc and (GD.MaMH = 'CSDL' or GD.MaMH = 'CTDL')
group by SV.Ten

--17. Cho biết tên các giáo viên tham gia giảng dạy môn "Ky thuat lap trinh"
select GV.TenGV from GIANGDAY GD, GIAOVIEN GV
where GD.MaMH = 'KTLT' and GV.MaGV = GD.MaGV
group by GV.MaGV, GV.TenGV

--18. Cho biết tên môn học mà GV tên "Tran Van Tien" tham gia giảng dạy trong HK1, 2020
select MH.TenMH from GIAOVIEN GV, GIANGDAY GD, MONHOC MH
where GV.MaGV = GD.MaGV and GV.TenGV = 'TRAN VAN TIEN' and MH.MaMH = GD.MaMH and GD.HocKy = 1 and GD.Nam = 2020

--19. Cho biết mã, tên các sinh viên có kết quả 1 môn học nào đó > 8
select SV.MSSV, SV.Ten from SINHVIEN SV, KETQUA KQ
where SV.MSSV = KQ.MaSV and KQ.Diem > 8
group by SV.MSSV, SV.Ten

--20. Cho biết sinh viên có tất cả các môn trên 8
select SV.MSSV, SV.Ten from SINHVIEN SV
where SV.MSSV not in(
	select SV.MSSV from SINHVIEN SV, KETQUA KQ
	where SV.MSSV = KQ.MaSV and KQ.Diem < 8
)

--21. Có bao nhiêu sinh viên
select count(*) from SINHVIEN

--22. Có bao nhiêu giáo viên
select count(*) from GIAOVIEN

--23. Có bao nhiêu sinh viên có phái nữ và thuộc khoa CNTT
select count(*)  from SINHVIEN SV
where SV.GioiTinh='Nu' and SV.MaKhoa='CNTT'

--24. Có bao nhiêu giáo viên khoa CNTT
select count(*) from GIAOVIEN GV
where GV.MaKhoa='CNTT'

--25. Có bao nhiêu sinh viên học môn CSDL
select count(*) from SINHVIEN SV, KETQUA KQ, GIANGDAY GD
where SV.MSSV = KQ.MaSV and KQ.MaKhoaHoc = GD.MaKhoaHoc and GD.MaMH = 'CSDL'

--26. Có bao nhiêu môn học được dạy trong HK1 2021.
select count(MH.MaMH) from  MONHOC MH
left join GIANGDAY GD on MH.MaMH = GD.MaMH 
where GD.HocKy = 1 and GD.Nam = 2021
group by MH.MaMH

select * from GIAOVIEN