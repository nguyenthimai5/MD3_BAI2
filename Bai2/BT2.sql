use quanlybanhangbt2;
create table customer(
cid int primary key ,
cName nvarchar(30),
cAge int
);
create table orders(
oid int primary key ,
cid int not null,
foreign key (cid) references customer(cid),
odate datetime,
ototalPrice float
);
create table product (
pid nvarchar(5) primary key,
pName nvarchar(30),
pPrice float

);
create table orderDetail(
oid int not null,
pid nvarchar(5) not null,
odQTY text,
foreign key (oid) references orders(oid),
foreign key (pid) references product(pid),
primary key (oid,pid)
);