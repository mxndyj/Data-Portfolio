-- File: size_vs_rating.sql
-- Q: How do app sizes impact app ratings?
-- Why: Shows whether larger or smaller apps tend to get higher user scores.

select case 
when size_mb <10 then '<10MB'
when size_mb between 10 and 50 then '10MB-50MB'
else '>50MB'
end as app_sizes,round(avg(rating),2) as average_rating, round (stddev_pop(rating),2) as std_dev,
count(*) as num_apps
from googleplaystore
where rating is not null and size_mb is not null
group by app_sizes
order by average_rating desc;



