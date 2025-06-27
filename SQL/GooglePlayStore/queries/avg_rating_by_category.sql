-- File: avg_rating_by_category.sql
-- Q: Which categories have the highest average rating?
-- Why: Helps identify which app markets have the happiest users and inform where 
-- to focus development or marketing.


Select category, round(Avg(rating),2)as average_rating, count(*) as num_apps
from googleplaystore
group by category
order by Avg(rating) desc
limit 10;


-- Follow up: Which categories have the most consistent vs. variable ratings?
-- Why: A low standard deviation (<=0.30) means most apps cluster near the mean;
--      a high one (>=0.70) signals large outliers skewing the average.

Select category, round(Avg(rating),2)as average_rating, count(*) as num_apps,
round(STDDEV_POP(rating), 2) as std_dev
from googleplaystore
where rating is not null
group by category
order by STDDEV_POP(rating) ASC 
limit 10;
