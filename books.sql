-- Your task is to write a SQL query to find which 
-- books have always been returned every time they have been loaned out.

-- In the result set you need to return the book_id and title of books, 
-- for all books that have been loaned at least once and aren't currently
-- on-loan (meaning that they do not have records with return_date == null).
-- The result should be ordered by book_id in descending order.
-- Two seperate tables books and loans.



select book_id, title
from books join loans using (book_id)
group by book_id
having every(return_date is not null)
order by book_id desc