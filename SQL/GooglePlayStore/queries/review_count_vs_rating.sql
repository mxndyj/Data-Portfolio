-- File: review_count_vs_rating.sql
-- Q: Is there a link between an app’s number of reviews and its average rating?
-- Why: Helps determine whether more-reviewed apps tend to be rated higher (more social proof) or lower (more critiques).

select round( corr(reviews::DOUBLE PRECISION, rating)::numeric, 3 )
as correlation
from googleplaystore
where reviews is not null and rating is not null;