-- Schema:
-- book (isbn13, title, edition, category, price, copyright, pages, pid)
-- encoding (isbn13, format, drm)
-- writer (wid, surname, givenname, city, state, zipcode, phone, email)
-- publisher (pid, name, address, city, state, zipcode, url)
-- authorship (isbn13, aid, percentage)
-- review (rid, isbn13, stars)
--

-- query 01 
--What are the names of the publishers?

select name from mccann.publisher;



-- query 02 
-- What are the full names (given and surnames) 
-- of the writers who live in California (CA)?

select givenname, surname
from mccann.writer
where state= 'CA';

-- query 03 
--What is the Cartesian Product of the writers’ cities and 
--the publishers’ cities? Show only the unique pairings.

select DISTINCT writer.city, publisher.city
from mccann.writer, mccann.publisher;

-- query 04 
-- (You must use JOIN for this query.) 
-- What are the titles of the ebooks encoded in azw3?

select title 
from mccann.book b join mccann.encoding e ON (b.isbn13=e.isbn13) 
where e.format ='azw3';


-- query 05 
-- (You must use nested selects for this query, instead of join.) 
-- What are the titles of the ebooks encoded in azw3?

select title  
from mccann.book 
where isbn13 IN ( 
    select isbn13 
    from mccann.encoding 
    where format = 'azw3');


-- query 06 
-- What are the surnames of the writers who have at least one 
-- of their books available as a PDF? Display each name only once, and in alphabetical order.

select DISTINCT w.surname 
from  mccann.writer w join mccann.authorship a ON (w.wid = a.aid) 
join mccann.encoding e ON (a.isbn13 = e.isbn13)
where e.format = 'PDF' 
ORDER BY w.surname;


-- query 07 
-- What is the title and price per page of the book with the largest price per page? 
-- Your result must consist of a single tuple.

select title, (price/pages) AS ppp
from mccann.book
where (price/pages) = (
    SELECT MAX(price/pages) 
    FROM mccann.book);


-- query 08 
-- What are the full names of the writers who 
-- have written one or more ebooks as a coauthor?


select DISTINCT w.givenname, w.surname
from mccann.writer w join mccann.authorship a ON w.wid = a.aid
where a.isbn13 IN (
    select isbn13 
    from mccann.authorship 
    GROUP BY isbn13 
    HAVING COUNT(aid) > 1);


-- query 10
-- What are the full names, and quantities of books written, 
-- of the writers who have authored (including coauthoring) at least two books?

select w.givenname, w.surname, COUNT(a.isbn13) AS bookcount
from mccann.writer w join mccann.authorship a ON w.wid = a.aid
GROUP BY w.givenname, w.surname
HAVING COUNT(a.isbn13) >= 2;


-- query 11
-- What are the names of the publishers 
-- of the books written by book authors who are also reviewers?

select distinct p.name
from mccann.publisher p
join mccann.book b on (b.pid=p.pid) join mccann.authorship a on (a.isbn13=b.isbn13)
join mccann.review r on (r.rid=a.aid);

-- query 12 
-- List, in ascending order, the IDs of all of the 
-- writers, and, for each, the ISBNs of the books that they have reviewed.


select w.wid AS writerid, r.isbn13 AS reviewedbook
from mccann.writer w LEFT OUTER JOIN mccann.review r on (w.wid = r.rid)
ORDER BY writerid ASC;


-- query 13
-- What are the IDs of the reviewers who have reviewed all of Chousky’s books?


select DISTINCT r.rid
from mccann.review r
where NOT EXISTS (
    -- Find all books written by Chousky
    select b.isbn13
    from mccann.book b join mccann.authorship a ON (b.isbn13 = a.isbn13)
    join mccann.writer w ON (a.aid = w.wid)
    where w.surname = 'Chousky'
    MINUS
    -- Find books reviewed by this reviewer
    select r2.isbn13 
    from mccann.review r2
    where r2.rid = r.rid);



