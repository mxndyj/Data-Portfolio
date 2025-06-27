-- File: free_vs_paid_ratings.sql
-- Q: Do paid apps get better ratings than free ones?
-- Why: Helps decide if charging upfront correlates with happier users.

Select 
case when price=0 then 'Free' else 'Paid'
end as app_type,round(avg(rating),2) as average_rating, count(*) as num_apps
from googleplaystore
where rating is not null
group by app_type
order by count(*) desc;
