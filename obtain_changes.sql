declare @synchronization_version bigint;
set @synchronization_version = CHANGE_TRACKING_CURRENT_VERSION();  
select B.ISBN, B.TITLE, B.AUTHOR
from BOOKS

insert into BOOKS (ISBN, TITLE, AUTHOR) values
	('9781449373320', 'Designing Data-Intensive Applications', 'Martin Kleppmann')
;

declare @last_synchronization_version bigint;
select B.ISBN, B.TITLE, B.AUTHOR, CT.SYS_CHANGE_OPERATION, CT.SYS_CHANGE_COLUMNS, CT.SYS_CHANGE_CONTEXT
from BOOKS as B
right outer join CHANGETABLE(CHANGES BOOKS, @last_synchronization_version) as CT
on B.ID = CT.ID


create table MIRROR (
	ID int identity(1,1) primary key,
	ISBN char(13) not null,
	TITLE varchar(256) not null,
	AUTHOR varchar(256) not null,
);
set identity_insert MIRROR on;
insert into MIRROR (ID, ISBN, TITLE, AUTHOR) values
	(7, '9781449373321', 'New book', 'Anon')
;


-- Only get the rows where the title changed
declare @last_synchronization_version bigint;
SELECT
	TITLE_CHANGE =
		change_tracking_is_column_in_mask
		(columnproperty(object_id('BOOKS'), 'title', 'columnid')
		,CT.SYS_CHANGE_COLUMNS),
	CT.SYS_CHANGE_OPERATION,
	CT.ID,
	CT.SYS_CHANGE_COLUMNS,
	B.ISBN,
	B.TITLE,
	B.AUTHOR
FROM
	BOOKS AS B
	RIGHT OUTER JOIN
		CHANGETABLE (CHANGES BOOKS, @last_synchronization_version)
	AS CT
	ON B.ID = CT.ID
;

