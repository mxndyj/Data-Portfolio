##  Database Schema

Tables live in the `mccann` schema. Here’s a quick overview:

- **book** `(isbn13, title, edition, category, price, copyright, pages, pid)`
- **encoding** `(isbn13, format, drm)`
- **writer** `(wid, surname, givenname, city, state, zipcode, phone, email)`
- **publisher** `(pid, name, address, city, state, zipcode, url)`
- **authorship** `(isbn13, aid, percentage)`
- **review** `(rid, isbn13, stars)`

Each query in `combined.sql` includes the prefix `mccann.` to make clear which schema you’re working in—and to avoid naming conflicts if you connect as a different user.

---

##  About the Scripts

- **`combined.sql`**  
  - Starts with a header comment listing the schema.  
  - Then all 13 queries appended in order, each preceded by its original filename.  

- **`queryXX.src`**  
  - These are the source files for each individual query, kept here for reference.
