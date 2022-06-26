create database btvn2606;
use btvn2606;

create table KhachHang(
MaKH int primary key,
HoTenKH varchar(255),
DChi varchar(255),
SoDt varchar(10),
NgaySinh date,
DoanhSo int,
NGDK date
);

create table NhanVien(
MaNV int primary key,
HoTenNV varchar(255),
NVL date,
SDT varchar(10)
);

create table SanPham(
MaSP int primary key,
TenSp varchar(255),
amount int,
country varchar(255),
price double
);


create table HoaDon(
SoHD int primary key ,
NgayMua date,
MaKH int,
MaNV int,
total double,
foreign key (MaKH) references KhachHang(MaKH),
foreign key (MaNV) references NhanVien(MaNV)
);

create table HDCT(
SoHD int,
MaSP int,
SoLuong int,
foreign key (Masp) references SanPham(MaSp),
foreign key (SoHD) references HoaDon(SoHD)
);

INSERT INTO `btvn2606`.`khachhang` (`MaKH`, `HoTenKH`, `DChi`, `SoDt`, `NgaySinh`, `DoanhSo`, `NGDK`) VALUES ('1', 'Duc', 'qqqq', '036aaaa', '1995-05-08', '2', '2005-06-08');
INSERT INTO `btvn2606`.`khachhang` (`MaKH`, `HoTenKH`, `DChi`, `SoDt`, `NgaySinh`, `DoanhSo`, `NGDK`) VALUES ('2', 'The', 'yyyy', '0358ll', '2002-05-03', '1', '2005-08-06');


INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('1', 'Bim Bim', '5', 'VN', '25');
INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('2', 'Sting', '6', 'VN', '30');
INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('3', 'Bò Húc', '6', 'Thái Lan', '35');
INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('4', 'qq', '5', 'Thái Lan', '38');
INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('5', 'eeee', '6', 'Thái Lan', '42');
INSERT INTO `btvn2606`.`sanpham` (`MaSP`, `TenSp`, `amount`, `country`, `price`) VALUES ('6', 'rrr', '5', 'Thái Lan', '43');


INSERT INTO `btvn2606`.`nhanvien` (`MaNV`, `HoTenNV`, `NVL`, `SDT`) VALUES ('1', 'Hau', '2002-02-06', '036aaaa');
INSERT INTO `btvn2606`.`nhanvien` (`MaNV`, `HoTenNV`, `NVL`, `SDT`) VALUES ('2', 'Tuan', '2001/06/07', '098aaa');

INSERT INTO `btvn2606`.`hoadon` (`SoHD`, `NgayMua`, `MaKH`, `MaNV`, `total`) VALUES ('1', '2006-05-08', '1', '1', '50');
INSERT INTO `btvn2606`.`hoadon` (`SoHD`, `NgayMua`, `MaKH`, `MaNV`, `total`) VALUES ('2', '2003-06-08', '2', '2', '30');


INSERT INTO `btvn2606`.`hdct` (`SoHD`, `MaSP`, `SoLuong`) VALUES ('1', '1', '2');
INSERT INTO `btvn2606`.`hdct` (`SoHD`, `MaSP`, `SoLuong`) VALUES ('2', '2', '1');


-- câu 1:
select * from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(HoaDon.NgayMua)='2006';

-- câu 2:
select max(total) from HoaDon;
select min(total) from HoaDon;

-- Câu 3:
select avg(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(HoaDon.NgayMua)='2006';

-- câu 4: 
select sum(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(HoaDon.NgayMua)='2006';

-- câu 5:
select max(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(HoaDon.NgayMua)='2006';

-- câu 6:
select KhachHang.MaKH,KhachHang.HoTenKH,max(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
join KhachHang on KhachHang.MaKH=HoaDon.MaKH
where total=(select max(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(HoaDon.NgayMua)='2006');

-- câu 7
select KhachHang.MaKH,KhachHang.HoTenKh from  SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
join KhachHang on KhachHang.MaKH=HoaDon.MaKH
order by Total
limit 3 ;

-- câu 8
select maSp,TenSP from SanPham 
order by price
limit 3;

-- Câu 9
select maSp,TenSP from SanPham 
where price<=(select max(price) from SanPham) and price > (select price from SanPham limit 2,1) and country='Thái Lan';

-- Câu 10
select maSp,TenSP from SanPham 
where price<=(select max(price) from SanPham) and price > (select price from SanPham limit 2,1) and country='Trung Quốc';

-- câu 11
select KhachHang.MaKH,KhachHang.HoTenKh from  SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
join KhachHang on KhachHang.MaKH=HoaDon.MaKH
order by Total
limit 3 ;

-- Câu 12
select count(Country) from Sanpham
where country='Trung Quốc';

-- câu 13
select country,count(Country) from Sanpham
where country='Thái Lan';
select country,count(Country) from Sanpham
where country='Trung Quốc';
select country,count(Country) from Sanpham
where country='Việt Nam';

-- câu 14
select country, max(price) as 'Giá cao nhất',min(price) as 'Giá thấp nhất',avg(price) as 'Giá Trung Bình'
from SanPham
where country='Thái Lan';
-- câu 15
select NgayMua,sum(total) from HoaDon 
group by ngaymua;

-- Câu 16
select tensp,sum(soluong) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where year(NgayMua)='2006' and month(NgayMua)='10'
group by tensp;

-- câu 17
select month(NgayMua) as 'Tháng Mua',sum(total) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
group by month(Ngaymua);

-- câu 18:
select Hoadon.soHD,count(masp) from HDCT
join HoaDon on HoaDon.SoHD=HDCT.SoHD
group by HoaDOn.Sohd
having count(Masp)>4;

-- câu 19
select Hoadon.soHD,count(HDCT.masp) from SanPham 
join HDCT on SanPham.Masp=HDCT.Masp
join HoaDon on HoaDon.SoHD=HDCT.SoHD
where sanpham.country='VN'
group by HoaDOn.Sohd
having count(HDCT.Masp)>0;

-- câu 20:
with CountKH as
(select KhachHang.HoTenKH,KhachHang.maKH,count(HoaDon.MaKH) as 'slm'
from KhachHang join
HoaDon on HoaDon.MaKH=KhachHang.MaKH
group by MaKH) 
select HoTenKH,MaKH,max(slm) from countKH
group by HotenKH;

-- câu 21
select month(Ngaymua),max(total) from HoaDon;

-- câu 22
with minsolanmua as ( select sanpham.MaSP,Sanpham.tensp,count(HDCT.Masp) as 'dem' from sanpham
join HDCT where HDCT.masp=sanpham.MaSP
group by sanpham.MaSP) select Masp,Tensp,min(dem) as 'Số lần mua ít nhất' from minsolanmua group by Masp;

-- câu 23
select Masp,Tensp, max(price) as 'Giá cao nhất' from SanPham
where country='VN';

-- cau25
create view count_KH as select KhachHang.HoTenKH,KhachHang.maKH,count(HoaDon.MaKH) as 'slm'
from KhachHang join
HoaDon on HoaDon.MaKH=KhachHang.MaKH
group by MaKH;
with KHmuanhieunhat as(select makh, sum(total) as total from hoadon group by makh limit 10)
 ,KHmuanhieu as (select kh.hotenkh, khm.total, count(sohd) from KHmuanhieunhat as khm
 inner join hoadon as hd on khm.makh = hd.makh
 inner join khachhang as kh on hd.makh = kh.makh
 group by hotenkh, khm.total)
 
select *, max(total) from KHmuanhieu