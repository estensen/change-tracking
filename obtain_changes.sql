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

