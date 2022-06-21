create database QLSV;
create table Khoa(
MaKhoa int primary key,
TenKhoa varchar(255)
);

create table MonHoc(
MaMH int primary key,
TenMH varchar(255),
SoTiet int
);

create table Lop(
MaLop int primary key,
TenLop varchar(255),
IDKhoa int,
foreign key(IDKhoa) references Khoa(MaKhoa)
);

create table SinhVien(
Masv int primary key,
HoTen varchar(255),
NgaySinh date,
HocBong int(64) default 0,
GioiTInh varchar(255),
IDlop int,
foreign key (IDlop) references Lop(MaLop)
);

create table KetQua(
DiemThi double,
Masv int,
MaMH int,
foreign key (Masv) references Sinhvien(MaSV),
foreign key (MaMH) references MonHoc(MaMH)
);


SELECT * FROM qlsv.khoa;
INSERT INTO `qlsv`.`khoa` (`MaKhoa`, `TenKhoa`) VALUES ('1', 'CNTT');
INSERT INTO `qlsv`.`khoa` (`MaKhoa`, `TenKhoa`) VALUES ('2', 'eeee');


SELECT * FROM qlsv.monhoc;
INSERT INTO `qlsv`.`monhoc` (`MaMH`, `TenMH`, `SoTiet`) VALUES ('1', 'Toan', '5');
INSERT INTO `qlsv`.`monhoc` (`MaMH`, `TenMH`, `SoTiet`) VALUES ('2', 'Van', '6');
INSERT INTO `qlsv`.`monhoc` (`MaMH`, `TenMH`, `SoTiet`) VALUES ('3', 'Anh', '6');

SELECT * FROM qlsv.lop;
INSERT INTO `qlsv`.`lop` (`MaLop`, `TenLop`, `IDKhoa`) VALUES ('1', 'C0322G1', '1');
INSERT INTO `qlsv`.`lop` (`MaLop`, `TenLop`, `IDKhoa`) VALUES ('2', 'C0422H1', '2');

SELECT * FROM qlsv.sinhvien;
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('1', 'Dũng', '2000/5/5',1, 'Nữ', '1');
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('2', 'Đức', '1995/8/5', 2, 'Nam', '1');
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('3', 'Tiến Anh', '1998/8/8', 3, 'Nam', '2');
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('4', 'Tuấn', '2000/9/8', 4, 'Nữ', '1');
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('4', 'Tuấn', '2000/9/8', 4, 'Nữ', '1');
INSERT INTO `qlsv`.`sinhvien` (`Masv`, `HoTen`, `NgaySinh`, `HocBong`, `GioiTInh`, `IDlop`) VALUES ('5', 'Hoàng', '1999/9/8', 4, 'Nữ', '1');

select * from qlsv.SinhVien where HoTen like 'Trần%';

select * from qlsv.SinhVien where GioiTinh='Nữ' and HocBong is not null;

select * from qlsv.sinhvien where HocBong=true;

-- câu 8
select * from qlsv.sinhvien where year( NgaySinh) between 1978 and 1985;

-- câu 9
select * from qlsv.sinhvien 
order by Masv ASC;

-- Câu 10
 select * from qlsv.sinhvien 
order by HocBong desc;

-- câu 12 13
select * from qlsv.SinhVien as sv
inner join qlsv.Lop as l  on sv.IDlop=l.MaLop
inner join qlsv.Khoa as k on k.makhoa=l.IDkhoa
WHERE sv.hocbong >0 AND k.tenkhoa = 'CNTT'
group by sv.masv;
-- câu 14
select l.tenlop,count(tenlop) as 'Số lượng học viên' from qlsv.lop as l
join qlsv.SinhVien as sv on l.MaLop=sv.IDlop
group by l.tenlop;


-- câu 15
select TenKhoa,count(*) from qlsv.Khoa as k
join qlsv.lop as l on  l.IDKhoa=k.makhoa
join qlsv.SinhVien as sv on sv.IDlop=l.MaLop
group by k.tenkhoa;

-- câu 16
select TenKhoa,count(*) from qlsv.Khoa as k
join qlsv.lop as l on  l.IDKhoa=k.makhoa
join qlsv.SinhVien as sv on sv.IDlop=l.MaLop
where sv.gioitinh='Nữ'
group by k.tenkhoa;

-- câu 17
select l.tenlop,sum(sv.HocBong) as 'total'
from qlsv.lop as l
join qlsv.sinhvien as sv on sv.idlop=l.malop
group by l.TenLop;

-- câu 18
select k.tenkhoa,sum(sv.HocBong) as 'total'
from qlsv.lop as l
join qlsv.sinhvien as sv on sv.idlop=l.malop
join qlsv.khoa as k on l.IDKhoa= k.MaKhoa
group by k.tenkhoa;

-- câu 19
select MaKhoa,TenKhoa,count(masv) from qlsv.khoa as k
join qlsv.lop as l on l.idkhoa=k.makhoa
join qlsv.sinhvien as sv on sv.IDlop=l.MaLop
group by MaKhoa
having count(masv)>1;

-- cau 20
select MaKhoa,TenKhoa,count(gioitinh) from qlsv.khoa as k
join qlsv.lop as l on l.idkhoa=k.makhoa
join qlsv.sinhvien as sv on sv.IDlop=l.MaLop
where sv.GioiTInh='Nữ'
group by MaKhoa
having count(gioitinh)>1;

-- cau 22
with  a as(select max(hocbong) as hb from qlsv.sinhvien)
select hoten, hocbong from sinhvien as sv  join a on sv.hocbong = a.hb;
-- hoặc
select hoten, hocbong from qlsv.sinhvien
where hocbong = (select max(hocbong) from qlsv.sinhvien);


-- cau 23
select hoten, max(kq.diemthi) from qlsv.sinhvien as sv
inner join ketqua as kq on sv.masv = kq.Masv
inner join monhoc as mh on mh.mamh = kq.mamh
where mh.TenMH= 'Toán';
