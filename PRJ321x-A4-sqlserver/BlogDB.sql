create database BlogDB;

use BlogDB;

create table [User]
(
	username varchar(15) primary key not null,
	[password] varchar(15) not null
);

create table Post
(
	id int identity(1, 1) primary key,
	title varchar(256) not null,
	[description] varchar(256) not null,
	contents varchar(max) not null,
	[date] datetime not null,
	published bit,
	username varchar(15) not null
);

insert into [User]
values
	('hiccup', 'hiccup'),
	('toothless', 'toothless');