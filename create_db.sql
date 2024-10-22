create database BOOKSTORE
alter database BOOKSTORE
set change_tracking = on (
	change_retention = 2 days, auto_cleanup = on
);


create table BOOKS (
	ID int identity(1,1) primary key,
	ISBN char(13) not null,
	TITLE varchar(256) not null,
	AUTHOR varchar(256) not null,
);

alter table BOOKS
enable change_tracking
with (track_columns_updated = on)

-- Make sure change tracking is consistent
alter database BOOKSTORE set allow_snapshot_isolation on;


insert into BOOKS (ISBN, TITLE, AUTHOR) values
	('9781503261969', 'Emma', 'Jayne Austen'),
	('9781505255607', 'The Time Machine', 'H. G. Wells'),
	('9781503379640', 'The Prince', 'Niccolò Machiavelli')
; 

