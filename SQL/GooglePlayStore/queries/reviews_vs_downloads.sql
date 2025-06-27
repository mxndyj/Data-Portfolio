-- File: reviews_vs_downloads.sql
-- Q: Is there a relationship between an app’s number of reviews and its download count?
-- Why: Shows whether more‐downloaded apps tend to receive more user reviews, indicating engagement levels.


select round(corr(reviews, installs_int)::numeric,2) as correlation
from googleplaystore
where reviews is not null;