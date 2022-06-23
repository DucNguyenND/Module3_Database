use ticketfilm;
create table Phim(
phimID int primary key,
Ten_Phim varchar(255),
Loai_Phim varchar(255),
Thoi_Gian int(4)
);
create table Phong(
PhongID int primary key,
Ten_Phong varchar(255),
Trang_Thai int
);

create table Ghe(
GheID int primary key,
PhongID int,
So_Ghe varchar(255),
foreign key (PhongID) references Phong(PhongID)
);

create table Ve(
PhimID int,
GheID int,
Ngay_chieu date,
Status varchar(255),
foreign key (PhimID) references Phim(PhimID),
foreign key (GheID) references Ghe(GheID)
);

insert into Phim values (1,'Em Bé Hà Nội', 'Tâm Lý',90),
(2, 'Nhiệm Vụ Bất Khả Thi','Hành Động',100),
(3, 'Dị Nhân','Viễn Tưởng', 90),
(4,'Cuốn Theo Chiều Gió', 'Tình Cảm',120);

insert into Phong values 
(1,'Phòng chiếu 1',1),
(2, 'Phòng chiếu 2',1),
(3,'Phòng chiếu 3',0);

insert into Ghe values 
(1,1,'A3'),
(2,1,'B5'),
(3,2,'A7'),
(4,2,'D1'),
(5,3,'T2');

insert into Ve values
(1,1,'2008-10-20', 'Đã Bán'),
(1,3,'2008-11-20', 'Đã Bán'),
(1,4,'2008-12-23', 'Đã Bán'),
(2,1,'2009-02-14', 'Đã Bán'),
(3,1,'2009-02-14', 'Đã Bán'),
(2,5,'2009-08-03', 'Chưa bán'),
(2,3,'2009-08-03', 'Chưa bán');


-- Câu 2
select PhimID,Ten_Phim,Thoi_Gian from Phim
order by Thoi_Gian;

-- Câu 3
select Ten_Phim,max(Thoi_Gian) from Phim;

-- câu 4
select Ten_Phim,Thoi_Gian
from Phim
where Thoi_gian = (select min(Thoi_gian) from phim);

-- câu 5:
select so_ghe from ghe where so_ghe like 'A%' ;

-- Câu 6:
alter table Phong 
change column Trang_Thai Trang_Thai varchar(255);

-- câu 7:
update Phong set Trang_Thai= if(Trang_Thai=0,'Đang sửa',if(Trang_Thai = 1,'Đang sử dụng','Unknow')) where Phong.PhongID >0;

-- câu 8:
select * from phim
where length(Ten_phim)>15 and length(Ten_phim)<25;

-- câu 9
select concat(ten_phong,' ',trang_thai) as 'Trạng Thái Phòng Chiếu' from phong;

-- câu 10


-- câu 11
alter table Phim add column Mo_ta varchar(255);

update Phim set Mo_ta = concat('Đây là bộ phim ',Phim.Loai_Phim) where Phimid > 0;

select * from phim;

update Phim set Mo_ta = concat('Film ',Phim.Loai_Phim) where Phimid > 0;

select * from phim;

-- câu 12
alter table ghe
drop foreign key ghe_ibfk_1;

alter table ve
drop foreign key ve_ibfk_1;

alter table ve
drop foreign key ve_ibfk_2;

-- câu 13 
delete from ve where phimID>0;

-- câu 14
select now();