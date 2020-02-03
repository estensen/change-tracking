create database BOOKSTORE
alter database BOOKSTORE
set change_tracking = on (
	change_retention = 2 days, auto_cleanup = on
);


create table BOOKSTORE.BOOKS (
	ID int identity(1,1),
	ISBN char(13) not null,
	TITLE varchar(256) not null,
	AUTHOR varchar(256) not null,
);

alter table BOOKSTORE.BOOKS
enable change_tracking
with (track_columns_updated = on)


insert into BOOKSTORE.BOOKS (ISBN, TITLE, AUTHOR) values
	('9781503261969', 'Emma', 'Jayne Austen'),
	('9781505255607', 'The Time Machine', 'H. G. Wells'),
	('9781503379640', 'The Prince', 'Niccolò Machiavelli')
; 

