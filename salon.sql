drop database if exists salon;
create database if not exists salon;
use salon;
create table if not exists salons (
id int primary key auto_increment,
title varchar(100) not null,
address varchar(100) not null,
schedule varchar(50) not null
);

create table if not exists masters (
id int primary key auto_increment,
name varchar(50) not null,
lastname varchar(50) not null,
phone_number varchar(20) not null,
email varchar(100), salon_id int not null
);

create table if not exists clients (
id int primary key auto_increment,
name varchar(50) not null,
lastname varchar(50) not null,
phone_number varchar(20) not null,
email varchar(100), salon_id int,
registration_date datetime not null default now(),
foreign key (salon_id) references salons(id)
);

create table if not exists enrolls (
id int primary key auto_increment,
enroll_time datetime not null, price int,
client_id int,
foreign key (client_id) references clients(id)
);

create table if not exists enrolls_masters
(enroll_id int, master_id int,
primary key (enroll_id, master_id),
foreign key (enroll_id) references enrolls(id),
foreign key (master_id) references masters(id)
);

create table if not exists services (
id int primary key,
title varchar(50) not null,
description tinytext,
price int not null
);

create table if not exists enrolls_services (
enroll_id int, service_id int,
primary key (enroll_id, service_id),
foreign key (enroll_id) references enrolls(id),
foreign key (service_id) references services(id)
);

alter table masters add
foreign key (salon_id) references salons(id);

