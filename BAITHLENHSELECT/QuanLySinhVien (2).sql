
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);
/*===================MON HOC========================*/
create table DMMH(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
References DMKhoa (MaKhoa);
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-03-20','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20','Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);


-- B1. 

select sv.MaSv,sv.HoSv,sv.tensv,sv.hocbong
from dmsv sv
order by sv.masv ;

-- B2
select sv.MaSv,sv.HoSv,sv.tensv,sv.ngaysinh ,sv.phai
from dmsv sv
order by sv.phai DESC;



-- B3

select sv.MaSv,sv.HoSv,sv.tensv,sv.ngaysinh ,sv.hocbong
from dmsv sv
order by day(sv.ngaysinh) ,sv.hocbong DESC;

-- B4

select mh.mamh,mh.tenmh,mh.sotiet
from dmmh mh 
where mh.TenMH like 'T%';

-- B5
select sv.MaSv,sv.HoSv,sv.tensv,sv.hocbong
from dmsv sv
where sv.tensv like '%I';

-- B6
select kh.makhoa,kh.tenkhoa
from dmkhoa kh
where kh.tenkhoa like '_N%';

-- B7
select sv.MaSv,sv.HoSv,sv.tensv,sv.ngaysinh 
from dmsv sv
where sv.hosv like '%thi%';

-- B8 

select sv.MaSv,sv.HoSv,sv.tensv,kh.MaKhoa,sv.HocBong
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
where sv.hocbong >100000
order by kh.makhoa DESC ;

-- B9 
select sv.HoSv,sv.tensv,kh.MaKhoa,kh.TenKhoa,sv.noisinh,sv.HocBong
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
where sv.hocbong >150000 and sv.NoiSinh='Ha Noi';

-- B10
select sv.MaSV,kh.MaKhoa,kh.TenKhoa,sv.phai
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
where kh.TenKhoa='Anh Van' or kh.TenKhoa='Vat Ly';

-- B11
select sv.MaSV,sv.ngaysinh,sv.noisinh,sv.hocbong
from dmsv sv
where sv.ngaysinh between '1991-01-01' and '1992-06-05';

-- B12.
select sv.MaSV,sv.NgaySinh,sv.phai,kh.MaKhoa,kh.TenKhoa,sv.HocBong
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
where sv.hocbong >=80000 and sv.HocBong<=150000;

-- B13
select mh.MaMH,mh.tenmh,mh.sotiet
from dmmh mh 
where mh.sotiet>30 and mh.SoTiet<45;

-- B14. 
select sv.masv, sv.hosv,sv.tensv,kh.tenkhoa,sv.phai
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
where (kh.tenkhoa='Anh Van' or kh.tenkhoa='Tin Hoc')and sv.phai='Nam';

-- B15
select sv.MaSV,sv.HoSV,sv.TenSV,sv.NoiSinh,sv.hocbong
from dmsv sv
where sv.phai='Nu' and sv.tensv like '%N%';

-- B16
select sv.HoSV ,sv.TenSV,sv.noisinh,sv.ngaysinh
from dmsv sv
where sv.noisinh ='Ha Noi' and month(sv.ngaysinh)=02;

-- B17.
select sv.HoSV ,sv.TenSV,sv.noisinh,sv.ngaysinh,year(now())-year(sv.ngaysinh) as 'Tuoi'
from dmsv sv
where (year(now())-year(sv.ngaysinh))> 20;

-- B18
select sv.HoSV ,sv.TenSV,year(now())-year(sv.ngaysinh) as 'Tuoi',kh.tenkhoa
from dmsv sv join dmkhoa kh on sv.MaKhoa=kh.MaKhoa
where (year(now())-year(sv.ngaysinh))>= 20 and  (year(now())-year(sv.ngaysinh))<=25 ;

-- B19
select sv.HoSV ,sv.TenSV,sv.phai,sv.ngaysinh
from dmsv sv 
where sv.ngaysinh between '1990-01-01' and '1990-03-31' ;

-- B20. 

select sv.MaSV,sv.phai,kh.makhoa, case sv.hocbong when sv.hocbong>500000 then 'Hoc Bong Cao' else 'Hoc Bong Trung Binh' end as 'Hoc Bong'
from dmsv sv join dmkhoa kh on sv.MaKhoa=kh.MaKhoa;

-- B21

SELECT 
    COUNT(sv.MaSV) AS 'Tongsosv'
FROM
    dmsv sv;

-- B22
SELECT 
    COUNT(sv.MaSV) AS 'Tongsosv',sum(case sv.phai when 'nu' then 1 else 0 end) as 'TSVNU'
FROM
    dmsv sv;



-- B23
select kh.MaKhoa,kh.tenkhoa ,count(sv.masv) as 'TONGSSV'
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
group by kh.tenkhoa
;
-- B24
select mh.tenmh , count(sv.masv) as 'SLSV'
from ketqua kq join dmsv sv on kq.masv=sv.masv join dmmh mh  on kq.mamh = mh.mamh
group by mh.tenmh
;
-- B25Cho biết số lượng môn học mà sinh viên đã học
select sv.tensv, count(distinct kq.MaMH) as 'SLSVH'
from ketqua kq join dmsv sv on kq.masv=sv.masv join dmmh mh  on kq.mamh = mh.mamh
group by sv.tensv
;


-- B26. Cho biết tổng số học bổng của mỗi khoa.
select  kh.TenKhoa,sum(sv.hocbong) as ' Tong so HB'
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
group by kh.tenkhoa;

-- B27 
select  kh.TenKhoa,max(sv.hocbong) as ' HBCN'
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
group by kh.tenkhoa;

-- B28;
select kh.tenkhoa ,sv.phai,count(sv.MaSV) as 'Tongsv'
from dmsv sv join dmkhoa kh on sv.makhoa=kh.makhoa
group by kh.tenkhoa ,sv.phai;

-- B29. Cho biết số lượng sinh viên theo từng độ tuổi
select year(sv.ngaysinh) as 'Năm' ,count(sv.NgaySinh) as 'SLSV'
from dmsv sv 
group by year(sv.ngaysinh);

-- B30 Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select year(sv.ngaysinh) as 'Năm' 
from dmsv sv 
group by year(sv.ngaysinh)
having count(year(sv.ngaysinh))=2;

-- B31Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select sv.NoiSinh 
from dmsv sv 
group by sv.noisinh
having count(sv.noisinh)=2;

-- B32. Cho biết những sinh viên thi lại trên 2 lần
select sv.tensv,mh.mamh,count(kq.lanthi) as 'SLTL'
from ketqua kq join dmsv sv on kq.masv=sv.masv join dmmh mh on kq.mamh = mh.mamh
group by sv.tensv,mh.mamh
having count(kq.lanthi)>=2;
-- B33 Cho biết những môn nào có trên 3 sinh viên dự thi.
select mh.MaMH,count(distinct sv.masv) as 'SLSVTG'
from ketqua kq join dmmh mh on kq.mamh=mh.mamh join dmsv sv on kq.masv = sv.masv
group by kq.mamh
having count(sv.masv)>3;

-- B34. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
select  sv.masv, sv.hosv,sv.tensv,sv.phai,kq.MaMH,kq.Diem
from dmsv sv join ketqua kq on sv.masv=kq.masv
where kq.lanthi=1 and kq.diem>7.00 and sv.phai='Nam';

-- B35 Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1
select sv.tensv,mh.MaMH
from ketqua kq join dmmh mh on kq.mamh=mh.mamh join dmsv sv on kq.masv = sv.masv
where kq.LanThi=1 and kq.Diem<5
group by sv.TenSV
having count(sv.masv)>=2;

-- B36Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select sv.tensv,kh.tenkhoa,count(sv.masv) as 'SLSVN'
from dmsv sv join dmkhoa kh on sv.MaKhoa=kh.MaKhoa
where sv.phai like 'NAM'
group by sv.TenSV
having count(sv.masv)>2;

-- B37Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000
select  kh.TenKhoa
from dmsv sv join dmkhoa kh on sv.MaKhoa=kh.MaKhoa
where sv.HocBong>=200000 and sv.HocBong<=300000
group by kh.tenkhoa
having count(sv.MaSV)>=2;
;

-- B38 . Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
-- trong lần thi 1
select sv.tensv,mh.MaMH,count(sv.masv)
from ketqua kq join dmmh mh on kq.mamh=mh.mamh join dmsv sv on kq.masv = sv.masv
group by kq.LanThi,kq.diem
having (kq.LanThi=1 and kq.Diem<5) or(kq.LanThi=1 and kq.Diem>=5);



--  B39
select  sv.masv,sv.hosv,sv.tensv,sv.hocbong as ' HBCN'
from dmsv sv 
where max(sv.hocbong);

-- B41
select kh.TenKhoa,max(year(now())-year(sv.ngaysinh)) as 'SVTLN'
from dmsv sv join dmkhoa kh on sv.makhoa =kh.makhoa
where kh.tenkhoa= 'Anh Van';


-- B50
