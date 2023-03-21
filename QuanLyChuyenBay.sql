create database QuanLyChuyenBay
go
use QuanLyChuyenBay

create table KhachHang
(
	maKH varchar(15) not null,
	ten nvarchar(50) not null,
	gioiTinh bit not null,
	ngaySinh date not null,
	diaChi nvarchar(50) not null,
	dienThoai varchar(15),
	primary key(maKH),
)

create table MayBay(
	soHieu varchar(15) not null,
	maLoai varchar(15) not null,
	primary key(soHieu, maLoai),
)

create table LoaiMB(
	hangSX nvarchar(20) not null,
	maLoai varchar(15) not null,
	primary key(maLoai),
)

create table KhaNang(
	maNV varchar(15) not null,
	maLoai varchar(15) not null,
	primary key(maNV, maLoai),
)

create table NhanVien(
	maNV varchar(15) not null,
	ten nvarchar(50) not null,
	gioiTinh bit not null,
	ngaySinh date not null,
	diaChi nvarchar(50) not null,
	dienThoai varchar(15) not null,
	luong int not null,
	loaiNV bit not null,
	primary key(maNV),
)

create table PhanCong(
	maNV varchar(15) not null,
	ngayDi date not null,
	maCB varchar(15) not null,
	primary key(maNV, ngayDi, maCB),
)

create table DatCho(
	maKH varchar(15) not null,
	ngayDi date not null,
	maCB varchar(15) not null,
	primary key(maKH, ngayDi, maCB),
)

create table LichBay(
	ngayDi date not null,
	maCB varchar(15) not null,
	soHieu varchar(15) not null,
	maLoai varchar(15) not null,
	primary key(ngayDi, maCB),
)

create table ChuyenBay(
	maCB varchar(15) not null,
	sanBayDi varchar(15) not null,
	sanBayDen varchar(15) not null,
	gioDi datetime not null,
	gioDen datetime not null,
	giaVePT int not null,
	giaVeTG int not null,
	soLuongPT smallint not null,
	soLuongTG smallint not null,
	primary key(maCB),
)

create table HanhLi(
	maHL varchar(15) not null,
	maKH varchar(15) not null,
	khoiLuong tinyint not null,
	loaiHanhLy nvarchar(20) not null,
	primary key(maHL, maKH),
)

create table HoaDon(
	maHD varchar(15) not null,
	maVe varchar(15) not null,
	maKH varchar(15) not null,
	ngayMua datetime not null,
	primary key(maHD, maVe, maKH)
)

create table Ve(
	maVe varchar(15) not null,
	maCB varchar(15) not null,
	choNgoi varchar(5) not null,
	hangVe bit not null,
	primary key(maVe, maCB),
)

--FK_DatCho_KhachHang
alter table DatCho
add constraint FK_DatCho_KhachHang
foreign key(maKH)
references  KhachHang(maKH)

--FK_DatCho_LichBay
alter table DatCho
add constraint FK_DatCho_LichBay
foreign key(ngayDi, maCB)
references  LichBay(ngayDi, maCB)

--FK_LichBay_ChuyenBay
alter table LichBay
add constraint FK_LichBay_ChuyenBay
foreign key(maCB)
references  ChuyenBay(maCB)

--FK_LichBay_MayBay
alter table LichBay
add constraint FK_LichBay_MayBay
foreign key(soHieu, maLoai)
references MayBay(soHieu, maLoai)

--FK_MayBay_LoaiMB
alter table MayBay
add constraint FK_MayBay_LoaiMB
foreign key(maLoai)
references LoaiMB(maLoai)

--FK_KhaNang_LoaiMB
alter table KhaNang
add constraint FK_KhaNang_LoaiMB
foreign key(maLoai)
references LoaiMB(maLoai)

--FK_KhaNang_NhanVien
alter table KhaNang
add constraint FK_KhaNang_NhanVien
foreign key(maNV)
references NhanVien(maNV)

--FK_PhanCong_NhanVien
alter table PhanCong
add constraint FK_PhanCong_NhanVien
foreign key(maNV)
references NhanVien(maNV)

--FK_PhanCong_LichBay
alter table PhanCong
add constraint FK_PhanCong_LichBay
foreign key(ngayDi, maCB)
references LichBay(ngayDi, maCB)

--FK_LichBay_ChuyenBay
alter table LichBay
add constraint FK_LichBay_ChuyenBay
foreign key(maCB)
references ChuyenBay(maCB)

--FK_HanhLy_KhachHang
alter table HanhLi
add constraint FK_HanhLi_KhachHang
foreign key(maKH)
references KhachHang(maKH)

--FK_HoaDon_KhachHang
alter table HoaDon
add constraint FK_HoaDon_KhachHang
foreign key(maKH)
references KhachHang(maKH)

--FK_HoaDon_Ve
alter table Ve
add constraint FK_Ve_HoaDon
foreign key(maVe)
references HoaDon(maVe)

--FK_Ve_ChuyenBay
alter table Ve
add constraint FK_Ve_ChuyenBay
foreign key(maCB)
references ChuyenBay(maCB)