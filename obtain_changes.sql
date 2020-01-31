set @synchronization_version = CHANGE_TRACKING_CURRENT_VERSION();  
select B.ISBN, B.TITLE, B.AUTHOR
from BOOKSTORE.BOOKS

insert into BOOKSTORE.BOOKS (ISBN, TITLE, AUTHOR) values
	('9781449373320', 'Designing Data-Intensive Applications', 'Martin Kleppmann')
;

--- Maybe create id instead of using isbn
select CT.ISBN, B.TITLE, B.AUTHOR, CT.SYS_CHANGE_OPERATION, CT.SYS_CHANGE_COLUMNS, CT.SYS_CHANGE_CONTEXT
from BOOKSTORE.BOOKS as B
right outer join CHANGETABLE(CHANGES BOOKSTORE.BOOKS, @last_synchronization_version) as CTA
on B.ISBN = CT.ISBN

