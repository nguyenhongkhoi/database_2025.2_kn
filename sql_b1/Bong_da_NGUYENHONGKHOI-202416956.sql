create database QLBongDa;
go
use QLBongDa;
go

create table TINH (
    MATINH varchar(5) primary key,
    TENTINH nvarchar(100) not null
);

create table QUOCGIA (
    MAQG varchar(5) primary key,
    TENQG nvarchar(60) not null
);

create table SANVD (
    MASAN varchar(5) primary key,
    TENSAN nvarchar(100) not null,
    DIACHI nvarchar(200)
);

create table CAULACBO (
    MACLB varchar(5) primary key,
    TENCLB nvarchar(100) not null,
    MASAN varchar(5) not null,
    MATINH varchar(5) not null,
    foreign key (MASAN) references SANVD(MASAN),
    foreign key (MATINH) references TINH(MATINH)
);

create table CAUTHU (
    MACT numeric identity(1,1) primary key,
    HOTEN nvarchar(100) not null,
    VITRI nvarchar(20) not null,
    NGAYSINH datetime,
    DIACHI nvarchar(200),
    MACLB varchar(5) not null,
    MAQG varchar(5) not null,
    SO int not null,
    foreign key (MACLB) references CAULACBO(MACLB),
    foreign key (MAQG) references QUOCGIA(MAQG),
    constraint UQ_CAUTHU_SO unique(MACLB, SO)
);

create table HUANLUYENVIEN (
    MAHLV varchar(5) primary key,
    TENHLV nvarchar(100) not null,
    NGAYSINH datetime,
    DIACHI nvarchar(200),
    DIENTHOAI nvarchar(20),
    MAQG varchar(5) not null,
    foreign key (MAQG) references QUOCGIA(MAQG)
);

create table HLV_CLB (
    MAHLV varchar(5),
    MACLB varchar(5),
    VAITRO nvarchar(100) not null,
    primary key (MAHLV, MACLB),
    foreign key (MAHLV) references HUANLUYENVIEN(MAHLV),
    foreign key (MACLB) references CAULACBO(MACLB)
);

create table TRANDAU (
    MATRAN numeric identity(1,1) primary key,
    NAM int not null,
    VONG int not null,
    NGAYTD datetime not null,
    MACLB1 varchar(5) not null,
    MACLB2 varchar(5) not null,
    MASAN varchar(5) not null,
    KETQUA varchar(5) not null,
    foreign key (MACLB1) references CAULACBO(MACLB),
    foreign key (MACLB2) references CAULACBO(MACLB),
    foreign key (MASAN) references SANVD(MASAN)
);

create table BANGXH (
    MACLB varchar(5),
    NAM int,
    VONG int,
    SOTRAN int not null,
    THANG int not null,
    HOA int not null,
    THUA int not null,
    HIEUSO varchar(5) not null,
    DIEM int not null,
    HANG int not null,
    primary key (MACLB, NAM, VONG),
    foreign key (MACLB) references CAULACBO(MACLB)
);