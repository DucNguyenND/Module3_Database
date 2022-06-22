use btvn1;
CREATE TABLE NCC (
    MaNCC INT(4) AUTO_INCREMENT ,
    TenNCC NVARCHAR(50) ,
    DiaChi NVARCHAR(100),
    SoDT VARCHAR(10),
    MaSoThue NVARCHAR(8),
    CONSTRAINT pk1 PRIMARY KEY (MaNCC)
);
    
CREATE TABLE LoaiDV (
    MaLoaiDV INT(4) AUTO_INCREMENT PRIMARY KEY,
    TenLoaiDV NVARCHAR(50) 
);
    
CREATE TABLE DongXe (
    DongXe NVARCHAR(50) PRIMARY KEY,
    HangXe NVARCHAR(50),
    SoChoNgoi INT(4)
);
    
CREATE TABLE MucPhi (
    MaMP INT(4) AUTO_INCREMENT PRIMARY KEY,
    DonGia DOUBLE,
    MoTa TEXT
);
    
CREATE TABLE DangKyCungCap (
    MaDKCC INT(4) AUTO_INCREMENT,
    MaNcc INT(4) ,
    MaLoaiDv INT(4) ,
    DongX NVARCHAR(50) ,
    MaP INT(4) ,
    NgayBatDauCC DATE ,
    NgayKetThucCC DATE ,
    SoLuongXeDangKy INT(5) ,
    CONSTRAINT pk2 PRIMARY KEY (MaDKCC),
    CONSTRAINT fk1 FOREIGN KEY (MaNcc)
        REFERENCES NCC (MaNCC),
    CONSTRAINT fk2 FOREIGN KEY (MaloaiDv)
        REFERENCES LoaiDV (MaLoaiDV),
    CONSTRAINT fk3 FOREIGN KEY (DongX)
        REFERENCES DongXe (DongXe),
    CONSTRAINT fk4 FOREIGN KEY (MaP)
        REFERENCES MucPhi (MaMP)
);
    
    
    
	INSERT INTO NCC VALUEs	(null,'VinFast','Hà Nội','0324586955','TTNCN01'),
							(null,'Mitsubishi','Toàn quốc','0365471258','TTNCN02'),
							(null,'Ford','TP HCM','0975214523','TTNCN03'),
                            (null,'Honda','TP HCM','0985145863','TTNCN04'),
							(null,'Suzuki','Hà Nội','0814444444','TTNCN05'),
							(null,'Toyota','Hà Nội','0985475896','TTNCN05');
                            
	INSERT INTO LoaiDV VALUES	(null,'Thuê xe đi lại trong vòng 50km'),
								(NULL,'Thuê xe đi du lịch');
                                

    INSERT INTO MucPhi VALUES	(NULL,100000,'100k/km'),
								(null,90000,'90000k/km');
    
    INSERT INTO DongXe VALUES	('SUV','Toyota',4),
								('CUV','Honda',5),
                                ('Sedan','Toyota',4),
                                ('PickUp','Ford',4),
                                ('Hiace','Ford',4),
                                ('Cerato','Ford',4),
                                ('Limousine','Huyndai',8);
                                
    INSERT INTO DangKyCungCap VALUES	(null,1,1,'SUV',1,'2022-6-1','2022-6-2',2),
										(null,2,2,'CUV',2,'2020-3-1','2020-3-4',5),
                                        (null,3,2,'Limousine',2,'1945-3-6','1945-3-7',1),
                                        (null,4,1,'Hiace',1,'2020-3-1','2020-3-4',3),
                                        (null,5,2,'Cerato',2,'2020-3-1','2020-3-4',1),
                                        (null,6,2,'Sedan',2,'2020-3-1','2020-3-4',8),
                                        (null,6,1,'PickUp',1,'2020-3-1','2020-3-4',2),
                                        (null,5,1,'Limousine',1,'2020-3-1','2020-3-4',1),
                                        (null,3,1,'Cerato',1,'2020-3-1','2020-3-4',5);
                                        
                                        
                                        
-- 3
SELECT dx.DongXe as 'Hãng xe', dx.SoChoNgoi
FROM DongXe as dx
WHERE dx.SoChoNgoi>5;
-- 4
SELECT * 
FROM NCC AS n JOIN DangKyCungCap as dk JOIN MucPhi as m JOIN DongXe as dx on n.MaNCC=dk.MaNcc and dk.MaP=m.MaMP and dx.DongXe=dk.DongX
WHERE dx.HangXe='Toyota' and m.DonGia='100000'
UNION
SELECT * 
FROM NCC AS n JOIN DangKyCungCap as dk JOIN MucPhi as m JOIN DongXe as dx on n.MaNCC=dk.MaNcc and dk.MaP=m.MaMP and dx.DongXe=dk.DongX
WHERE dx.HangXe='Ford' and m.DonGia='90000';
-- 5
SELECT * 
FROM NCC AS n
ORDER BY n.TenNCC ,n.MaSoThue DESC;
;
-- 6
SELECT n.TenNCC as 'Nha cung cap',COUNT(dk.MaDKCC) as 'So lan dang ky'
FROM NCC as n join DangKyCungCap as dk on n.MaNCC=dk.MaNcc
WHERE dk.NgayBatDauCC>'2015-11-20'
GROUP BY n.TenNCC;
-- 7
SELECT DISTINCT dx.HangXe as 'Hãng xe'
FROM DongXe as dx;
-- 8
SELECT dk.MaDKCC,n.*,ldv.TenLoaiDV,m.DonGia,dx.HangXe,dk.NgayBatDauCC,dk.NgayKetThucCC
FROM NCC AS n 
	LEFT JOIN DangKyCungCap AS dk  ON n.MaNCC=dk.MaNcc 
    LEFT JOIN LoaiDV as ldv ON dk.MaLoaiDv=ldv.MaLoaiDV
    LEFT JOIN MucPhi AS m ON dk.MaP=m.MaMP
    LEFT JOIN DongXe AS dx ON dk.DongX=dx.DongXe;
-- 9
SELECT *
FROM NCC AS n JOIN DangKyCungCap as dk JOIN DongXe AS dx on	 n.MaNCC =dk.MaNcc and dk.DongX =dx.DongXe
WHERE dx.HangXe='Toyota' OR dx.HangXe='Ford';
-- 10
SELECT *
FROM NCC 
WHERE MaNCC not in( SELECT MaNcc FROM DangKyCungCap);                                        