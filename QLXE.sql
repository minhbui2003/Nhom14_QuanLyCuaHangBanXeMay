﻿Create database QLXE
go
use QLXE
go

--TÀI KHOẢN
Create table taikhoan
(Username varchar(100),
	Password varchar(100),
	HoTen nvarchar(50),
	NgaySinh datetime,
	Email varchar(50),
	Phone varchar(50),
	NgayBatDau datetime, 
	primary key(username))
go 

--LOẠI XE
Create table loaixe
(Maloai varchar(10),
	Tenloai nvarchar(100),
	primary key(MaLoai))
go

--NHÀ CUNG CẤP
Create table nhacungcap
(MaNCC varchar(10), 
	TenNCC nvarchar(100), 
	Diachi nvarchar(200), 
	Email varchar(50), 
	SDT varchar(20), 
	primary key(MaNCC))
go

--KHÁCH HÀNG
Create table khachhang
(SDT varchar(50) NOT NULL,
	TenKH nvarchar(100) NOT NULL,
	DiaChi nvarchar(100) NULL,
	Email varchar(50) NULL,	
	TongTienDaMua bigint NOT NULL,
	Primary key(SDT))
go

--SẢN PHẨM
CREATE TABLE sanpham(
	MaSP varchar (10) NOT NULL,
	TenSP nvarchar (100) NOT NULL,	
	Maloai varchar(10) NOT NULL,
	GiaBan bigint,
	MaNCC varchar(10) NOT NULL,
	NamSanXuat varchar(10) NOT NULL,
	Primary key(MaSP))
go

--KHO
CREATE TABLE kho
	(MaKho char (50) NOT NULL,
	TenKho nvarchar (50) NOT NULL,
	DiaChi nvarchar (200) NULL,
	Phone varchar (30) NULL,
	Primary key(MaKho))
go

--CHI TIẾT KHO
CREATE TABLE ct_kho(
	CTMaKho int IDENTITY(1,1) NOT NULL,
	MaKho char(50) not null,
	MaSP varchar(10) NOT NULL,
	Soluong int,
	Primary key (CTMaKho)
)

--HÓA ĐƠN
CREATE TABLE hoadon(
	MaHoaDon int IDENTITY(1,1) NOT NULL,	
	Ngay  datetime  NOT NULL,
	SDT varchar(50) NOT NULL,
	TongTien bigint,
	Username varchar(100),
	GhiChu NTEXT,
	Primary key(MaHoaDon))
go

--CT HÓA ĐƠN
CREATE TABLE ct_hoadon(
	MaCTHoaDon int IDENTITY(1,1) NOT NULL,
	MaHoaDon int NOT NULL,
	MaSP varchar(10) NOT NULL,
	SoLuong int NOT NULL,
	ThanhTien bigint NOT NULL,
	Primary key(MaCTHoaDon))
go

--PHIẾU NHẬP
CREATE TABLE phieunhap(
	MaPN int IDENTITY(1,1) NOT NULL,
	Username varchar(100) NOT NULL,
	MaNCC varchar(10),
	NgayNhap datetime NOT NULL,
	MaKho char(50) NOT NULL,
    Primary key (MaPN))
go

--CHI TIẾT PHIẾU NHẬP
CREATE TABLE ct_phieunhap(
	MaCTPN int IDENTITY(1,1) NOT NULL,
	MaPN int NOT NULL,
	MaSP varchar(10) NOT NULL,
	SoLuong int NOT NULL,
	DonGiaNhap int NOT NULL,
    Primary key (MaCTPN))
go

--PHIẾU XUẤT
CREATE TABLE phieuxuat(
	MaPX int IDENTITY(1,1) NOT NULL,
	Username varchar(100) NOT NULL,
	NgayXuat datetime NOT NULL,
	Primary key (MaPX))
go

--CHI TIẾT PHIẾU XUẤT
CREATE TABLE ct_phieuxuat(
	MaCTPX int IDENTITY(1,1) NOT NULL,
	MaPX int NOT NULL,
	MaKho char(50) NOT NULL,
	MaSP varchar(10) NOT NULL,
	SoLuong int NOT NULL,
	Primary key (MaCTPX))
go

--Ràng buộc SẢN PHẨM
alter table sanpham
add constraint FK_sp_ncc foreign key(MaNCC) references nhacungcap(MaNCC)
alter table sanpham
add constraint FK_sp_loai foreign key(Maloai) references loaixe(Maloai)
go

--Ràng buộc CHI TIẾT KHO
alter table ct_kho
add constraint FK_ctk_sp foreign key(MaSP) references sanpham(MaSP)
alter table ct_kho
add constraint FK_ctk_k foreign key(MaKho) references kho(MaKho)
go

--Ràng buộc HÓA ĐƠN
alter table hoadon
add constraint FK_hd_tk foreign key(Username) references taikhoan(Username)
go
alter table hoadon
add constraint FK_hd_kh foreign key(SDT) references khachhang(SDT)
go

--Ràng buộc CHI TIẾT HÓA ĐƠN
alter table ct_hoadon
add constraint FK_cthd_hd foreign key(MaHoaDon) references hoadon(MaHoaDon)
alter table ct_hoadon
add constraint FK_cthd_sp foreign key(MaSP) references sanpham(MaSP)
go

--Ràng buộc PHIẾU NHẬP
alter table phieunhap
add constraint FK_pn_ncc foreign key(MaNCC) references nhacungcap(MaNCC)
alter table phieunhap
add constraint FK_pn_tk foreign key(Username) references taikhoan(Username)
go

--Ràng buộc CHI TIẾT PHIẾU NHẬP
alter table ct_phieunhap
add constraint FK_ctpn_pn foreign key(MaPN) references phieunhap(MaPN)
alter table ct_phieunhap
add constraint FK_ctpn_sp foreign key(MaSP) references sanpham(MaSP)
go

--Ràng buộc PHIẾU XUẤT
alter table phieuxuat
add constraint FK_px_tk foreign key(Username) references taikhoan(Username)
go

--Ràng buộc CHI TIẾT PHIẾU XUẤT
alter table ct_phieuxuat
add constraint FK_ctpx_px foreign key(MaPX) references phieuxuat(MaPX)
alter table ct_phieuxuat
add constraint FK_ctpx_tk foreign key(MaSP) references sanpham(MaSP)
alter table ct_phieuxuat
add constraint FK_ctpx_k foreign key(MaKho) references kho(MaKho)
go

/*Tài khoản*/
insert into taikhoan values ('minh','123','nhutminh',8/1/2003,'minhbui2003@gmail.com',0904596812,26/4/2023)
insert into taikhoan values ('admin','123','admin',6/6/1999,'admin@gmail.com',090999999,09/09/2009)
go

/*Loại xe*/
insert into loaixe values ('XS',N'Xe số')
insert into loaixe values ('XCT',N'Xe côn tay')
insert into loaixe values ('XTG',N'Xe tay ga')
go

/*Nhà cung cấp*/
insert into nhacungcap values ('HONDA',N'Công ty HONDA Việt Nam',N'Tầng 8, Zen Plaza, 54-56 đường Nguyễn Trãi, quận 1, thành phố Hồ Chính Minh','cr@honda.com.vn','(84) 28-39256949')
insert into nhacungcap values ('YAMAHA',N'Công ty Yamaha Việt Nam',N'Thôn Bình An, Xã Trung Giã, Huyện Sóc Sơn, TP. Hà Nội','cskh@yamaha-motor.com.vn','18001588')
insert into nhacungcap values ('SUZUKI',N'Công ty TNHH Việt Nam Suzuki',N'Đường số 2, KCN Long Bình, P. Long Bình,TP. Biên Hòa, Đồng Nai','null','18006950')
go

/*Khách hàng*/
insert into khachhang values ('0904596810',N'Bùi Tất Nhựt Minh',N'11 đường 19E, P.Bình Trị Đông.B, Q.Bình Tân, TP.HCM','minhbui2003@gmail.com',100000000)
insert into khachhang values ('0902343263',N'Phan Hồng Tuấn',N'475A Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.HCM','phanhongtuan@gmail.com',30000000)
insert into khachhang values ('0000000000',N'Huỳnh Lưu Trọng Vũ',N'475A Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.HCM','huynhluutrongvu@gmail.com',41000000)
insert into khachhang values ('0948803218',N'Trần Văn Kỳ',N'475A Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.HCM','tranvanky@gmail.com',30000000)
go

/*Sản phẩm*/
insert into sanpham values ('WINX','WINNER X','XCT','41000000','HONDA','2020')
insert into sanpham values ('EX','EXCITER 150','XCT','50000000','YAMAHA','2020')
insert into sanpham values ('RAI','RAIDER 150','XCT','50000000','SUZUKI','2020')
insert into sanpham values ('VS','VISION 110','XTG','30000000','HONDA','2020')
insert into sanpham values ('FG','FREEGO 125','XTG','30000000','YAMAHA','2020')
insert into sanpham values ('GD','GD 110','XCT','22000000','SUZUKI','2020')
go

/*Hóa đơn*/
insert into hoadon values ('2021-02-07','0904596810',50000000,'minh',N'N')
insert into hoadon values ('2021-02-07','0902343263',30000000,'minh',N'H')
insert into hoadon values ('2021-02-07','0000000000',41000000,'minh',N'Q')
insert into hoadon values ('2021-02-07','0948803218',30000000,'duc',N'T')
insert into hoadon values ('2021-02-07','0904596810',50000000,'duc',N'N')
go

/*Kho*/
insert into Kho values ('HONDA',N'Kho HONDA',N'439 Hậu Giang P11, Q6, TP.HCM','0777747747')
insert into Kho values ('YAMAHA',N'Kho YAMAHA',N'439 Hậu Giang P11, Q6, TP.HCM','0777747747')
insert into Kho values ('SUZUKI',N'Kho SUZUKI',N'439 Hậu Giang P11, Q6, TP.HCM','0777747747')
go

/*CT_Kho*/
insert into ct_kho values ('HONDA','WINX',9)
insert into ct_kho values ('HONDA','VS',9)
insert into ct_kho values ('YAMAHA','EX',9)
insert into ct_kho values ('YAMAHA','FG',9)
insert into ct_kho values ('SUZUKI','RAI',9)
insert into ct_kho values ('SUZUKI','GD',10)
go

/*CT_Hóa đơn*/
insert into ct_hoadon values (1,'EX',1,50000000)
insert into ct_hoadon values (2,'FG',1,30000000)
insert into ct_hoadon values (3,'WINX',1,41000000)
insert into ct_hoadon values (4,'VS',1,30000000)
insert into ct_hoadon values (5,'RAI',1,50000000)
go


/*PHIẾU NHẬP*/
insert into phieunhap values ('NAM','HONDA','2020-02-07','HONDA')
insert into phieunhap values ('QUOC','YAMAHA','2020-02-07','YAMAHA')
insert into phieunhap values ('CUONG','SUZUKI','2020-02-07','SUZUKI')
go

/*CT PHIẾU NHẬP*/
insert into ct_phieunhap values (1,'WINX',10,35000000)
insert into ct_phieunhap values (1,'VS',10,20000000)
insert into ct_phieunhap values (2,'EX',10,40000000)
insert into ct_phieunhap values (2,'FG',10,20000000)
insert into ct_phieunhap values (3,'RAI',10,40000000)
insert into ct_phieunhap values (3,'GD',10,15000000)
go

/*PHIẾU XUẤT*/
insert into phieuxuat values ('NGHIA','2021-02-07')
insert into phieuxuat values ('QUAN','2021-02-07')
insert into phieuxuat values ('LINH','2021-02-07')
insert into phieuxuat values ('THANG','2021-02-07')
insert into phieuxuat values ('KHUONG','2021-02-07')
go

/*CT PHIẾU XUẤT*/
insert into ct_phieuxuat values (1,'YAMAHA','EX',1)
insert into ct_phieuxuat values (2,'YAMAHA','FG',1)
insert into ct_phieuxuat values (3,'HONDA','WINX',1)
insert into ct_phieuxuat values (4,'HONDA','VS',1)
insert into ct_phieuxuat values (5,'SUZUKI','RAI',1)
go

select * from taikhoan
select * from loaixe 
select * from nhacungcap 
select * from khachhang
select * from sanpham
select * from kho
select * from ct_kho
select * from hoadon
select * from ct_hoadon
select * from phieunhap
select * from ct_phieuNhap
select * from phieuxuat
select * from ct_phieuxuat
go
