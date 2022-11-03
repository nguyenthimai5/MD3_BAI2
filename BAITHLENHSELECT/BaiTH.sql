use quanlybanhang;
Create table khachhang(
	makh nvarchar(4) primary key,
    tenkh nvarchar(30) not null,
    diachi nvarchar(50),
    ngaysinh datetime,
    sodt nvarchar(15)
);
Create table nhanvien(
	manv nvarchar(4) primary key,
    hoten nvarchar(30) not null,
    gioitinh bit not null,
    diachi nvarchar(50) not null,
    ngaysinh datetime not null,
    dienthoai nvarchar(15),
    email text,
    noisinh nvarchar(20) not null,
    ngayvaolam datetime,
    manql nvarchar(4)
);
Create table nhacungcap(
	mancc nvarchar(5) primary key,
    tenncc nvarchar(50) not null,
    diachi nvarchar(50) not null,
    dienthoai nvarchar(15) not null,
    email nvarchar(30) not null,
    website nvarchar(30)    
);
Create table loaisp(
	maloaisp nvarchar(4) primary key,
    tenloaisp nvarchar(30) not null,
    ghichu nvarchar(100) not null
);
create table sanpham(
	masp nvarchar(4) primary key,
    maloaisp nvarchar(4) not null,
    tensp nvarchar(50) not null,
    donvitinh nvarchar(10) not null,
    ghichu nvarchar(100),
    foreign key (maloaisp) references loaisp(maloaisp)
);
create table phieunhap(
	sopn nvarchar(5) primary key,
    manv nvarchar(4) not null,
    mancc nvarchar(5) not null,
    ngaynhap datetime not null default(now()),
    ghichu nvarchar(100),
    foreign key (manv) references nhanvien(manv),
    foreign key (mancc) references nhacungcap(mancc)
);
create table ctphieunhap(
	masp nvarchar(4),
    sopn nvarchar(5),
    soluong smallint not null default(0),
    gianhap real not null check(gianhap>=0),
    foreign key (masp) references sanpham(masp),
    foreign key (sopn) references phieunhap(sopn),
    primary key(masp,sopn)
);
create table phieuxuat(
	sopx nvarchar(5) primary key,
    manv nvarchar(4) not null,
    makh nvarchar(4) not null,
    ngayban datetime not null,
    ghichu text,
    foreign key (manv) references nhanvien(manv),
    foreign key (makh) references khachhang(makh)
);
create table ctphieuxuat(
	sopx nvarchar(5),
    masp nvarchar(4),
    soluong smallint check(soluong>0),
    giaban real check(giaban>0),
    foreign key (sopx) references phieuxuat(sopx),
    foreign key (masp) references sanpham(masp),
    primary key(sopx,masp)
);
insert into nhacungcap(mancc,tenncc,diachi,dienthoai,email)
values('NCC01','DIOR','PHAP','09876544387','dior@gmail.com'),
('NCC02','FENDI','ITALY','07685423632','fendi@gmail.com'),
('NCC03','GUCCI','Ý','086346325432','gucci@gmail.com');
select * from nhacungcap;



insert into nhanvien(manv,hoten,gioitinh,diachi,ngaysinh,noisinh)
values('NV01','Nguyen van a',1,'Ha Noi','2004-12-29','Bac Giang'),
('NV02','Nguyen van b',1,'Thanh Hoa','2002-10-19','Thanh hoa'),
('NV03','Nguyen thi c',0,'Ha Nam','2000-03-09','Ha Nam'),
('NV04','Nguyen thi e',0,'Ha Nam','2000-09-09','Ha Nam'),
('NV05','Nguyen van g',1,'Ha Tinh','2000-02-29','Ha Tinh');

select * from nhanvien;
insert into loaisp
values('LSP1','ĐỒ ĂN','Nhiều đồ ngon ,rẻ'),
('LSP2','ĐỒ DÙNG','Đồ dùng tiện ích'),
('LSP3','QUẦN ÁO','Có cả nam và nữ')
;
select * from loaisp;
insert into sanpham(masp,maloaisp,tensp,donvitinh)
values('SP01','LSP1','Trà sữa','cốc'),
('SP02','LSP2','Kẹp tóc','cái'),
('SP03','LSP1','Bánh tráng trộn','hộp'),
('SP04','LSP3','Váy hoa','bộ '),
('SP05','LSP2','Bàn','cái')
;
insert into sanpham(masp,maloaisp,tensp,donvitinh)
values('SP06','LSP2','Nước xả vải Comfort ','chai');
select * from sanpham;
insert into phieunhap(sopn,manv,mancc,ngaynhap)
values('PN001','NV01','NCC01','2022-11-1'),
('PN002','NV01','NCC02','2022-11-1'),
('PN003','NV02','NCC03','2022-11-1'),
('PN004','NV03','NCC01','2022-11-1')
;
select * from phieunhap;
insert into ctphieunhap
values('SP01','PN001',18,2000),
('SP02','PN001',10,4000),
('SP03','PN002',12,5000),
('SP04','PN002',11,7000)
;
insert into ctphieunhap
values('SP06','PN001',30,230000);
select * from ctphieunhap;
insert into khachhang(makh,tenkh)
values('KH01','Trần thị loan'),
('KH02','Hoàng Minh Khang'),
('KH03','Cao Minh Ngọc'),
('KH04','Hoàng Trọng Khôi'),
('KH05','Lê Văn Hoàng'),
('KH06','Lê Ngọc Diệp'),
('KH07','Lữ Thị Minh Anh'),
('KH08','Vũ Thị Oanh'),
('KH09','Nguyễn thị Huệ'),
('KH10','Nguyễn Thị Lan Ánh'),
('KH11','Trần Bích Liên')
;
insert into khachhang(makh,tenkh,ngaysinh)
values('KH12','Trần thị loan Chi','2001-11-14'),
('KH13','Hoàng Văn Lang ','2004-11-23');
select * from khachhang;
insert into phieuxuat(sopx,manv,makh,ngayban)
values('PX001','NV01','KH02','2022-11-04'),
('PX002','NV03','KH05','2022-11-04'),
('PX003','NV01','KH11','2022-11-06'),
('PX004','NV02','KH06','2022-11-07'),
('PX005','NV02','KH02','2022-11-12'),
('PX006','NV01','KH09','2022-11-23'),
('PX007','NV03','KH10','2022-11-14')
;
insert into phieuxuat(sopx,manv,makh,ngayban)
values('PX008','NV01','KH02','2018-04-24'),
('PX009','NV02','KH10','2018-04-15'),
('PX010','NV03','KH05','2022-05-12'),
('PX011','NV01','KH06','2018-07-18'),
('PX012','NV02','KH08','2019-05-23'),
('PX013','NV03','KH04','2020-10-18');

select * from phieuxuat;
insert into ctphieuxuat 
values('PX001','SP01',12,3000),
('PX002','SP04',23,5000),
('PX003','SP06',11,7000),
('PX004','SP03',6,10000),
('PX005','SP02',14,9000),
('PX006','SP05',4,6000);
insert into ctphieuxuat 
values('PX008','SP01',6,9000),
('PX009','SP03',24,8000);
insert into ctphieuxuat 
values('PX008','SP06',61,45000),
('PX009','SP06',23,68000);
insert into ctphieuxuat 
values('PX001','SP06',12,3000);
select * from ctphieuxuat;
update khachhang set sodt='978654323' where KH10;
update nhanvien set diachi='Thanh Hoa' where NV05;

-- B6.1
select nv.manv,nv.hoten,nv.gioitinh,nv.ngaysinh,nv.diachi,nv.dienthoai,nv.ngaysinh,year(now())-year(nv.ngaysinh) as 'Tuoi'
from nhanvien nv
order by now()-nv.ngaysinh;

 insert into phieunhap(sopn,manv,mancc,ngaynhap)
values('PN005','NV01','NCC03','2018-06-3'),
('PN006','NV01','NCC03','2018-06-06'),
('PN007','NV02','NCC01','2018-06-07'),
('PN008','NV03','NCC02','2018-06-10');
select * from phieunhap;
insert into sanpham(masp,maloaisp,tensp,donvitinh)
values('SP06','LSP1','COCA','chai'),
('SP07','LSP1','TH','chai');
select * from sanpham; 

-- B6.3
select sp.masp,sp.maloaisp,sp.tensp,sp.donvitinh
from sanpham sp
where sp.donvitinh='chai';

-- B6.2
select pn.sopn,nv.hoten,ncc.tenncc,pn.ngaynhap,pn.ghichu
from phieunhap pn join nhanvien nv on pn.manv=nv.manv join nhacungcap ncc on pn.mancc=ncc.mancc
where pn.ngaynhap between '2018-06-01' and '2018-06-30'; 



-- B6.4
select ctpn.sopn,ctpn.masp,sp.tensp,lsp.tenloaisp,ctpn.soluong,ctpn.gianhap,ctpn.gianhap*ctpn.soluong as 'Thanh Tien'
from ctphieunhap ctpn join sanpham sp on ctpn.masp=sp.masp join loaisp lsp on sp.maloaisp=lsp.maloaisp;

-- B6.5
select ncc.mancc,ncc.tenncc,ncc.diachi,ncc.diachi,ncc.dienthoai,email,pn.sopn,pn.ngaynhap
from phieunhap pn join nhacungcap ncc on pn.mancc=ncc.mancc
where month(pn.ngaynhap)='11'
order by date(now())-date(pn.ngaynhap);


-- B6.6
select px.sopx,nv.hoten,px.ngayban,sp.masp,sp.tensp,sp.donvitinh,ctpx.soluong,ctpx.giaban,ctpx.giaban*ctpx.soluong as 'Doanh Thu'
from ctphieuxuat ctpx join sanpham sp on ctpx.masp=sp.masp join phieuxuat px on ctpx.sopx=px.sopx join nhanvien nv on px.manv=nv.manv 
; 
-- B6.7
select kh.makh,kh.tenkh,kh.ngaysinh
from khachhang kh 
where month(kh.ngaysinh)=11;

-- B6.8
select px.sopx,nv.hoten,px.ngayban,sp.masp,sp.tensp,sp.donvitinh,ctpx.soluong,ctpx.giaban,ctpx.giaban*ctpx.soluong as 'Doanh Thu'
from ctphieuxuat ctpx join sanpham sp on ctpx.masp=sp.masp join phieuxuat px on ctpx.sopx=px.sopx join nhanvien nv on px.manv=nv.manv
 where px.ngayban between '2018-04-15' and '2018-05-15';
 
 
-- B6.9
select ctpx.sopx,px.ngayban,kh.makh,kh.tenkh,ctpx.soluong*ctpx.giaban as 'Trị Giá'
from ctphieuxuat ctpx join phieuxuat px on ctpx.sopx=px.sopx join khachhang kh on px.makh=kh.makh ;
 
-- B6.10
select sum(ctpx.soluong) as'Tong', ctpx.masp
from ctphieuxuat ctpx join phieuxuat px on ctpx.sopx=px.sopx
where px.ngayban between '2018-01-01' and '2018-05-31' and ctpx.masp='SP06'
group by ctpx.masp;


-- B6.11

 select  month(px.ngayban) as 'Thang',kh.makh,kh.tenkh,kh.diachi,sum(ctpx.soluong*ctpx.giaban) as 'Tổng tiền'
 from phieuxuat px join khachhang kh on px.makh=kh.makh  join ctphieuxuat ctpx on px.sopx=ctpx.sopx
 group by month(px.ngayban);
 
 -- B6.12

select year(px.ngayban) as 'Nam',month(px.ngayban) as 'Thang', sp.masp,sp.tensp,sp.donvitinh,sum(ctpx.soluong) as 'Tong'
from phieuxuat px join ctphieuxuat ctpx on px.sopx=ctpx.sopx join sanpham sp on ctpx.masp=sp.masp 
group by year(px.ngayban),month(px.ngayban);


-- B6.13
-- .Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin
-- hiển thị gồm: tháng, doanh thu
select sum(ctpx.soluong*ctpx.giaban) as'Doanh thu', month(px.ngayban) as 'Thang'
from ctphieuxuat ctpx join phieuxuat px on ctpx.sopx=px.sopx
where px.ngayban between '2018-01-01' and '2018-05-31'
group by month(px.ngayban);

-- B6.14
