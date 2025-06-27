-- File: avg_sentiment_by_category.sql
-- Q: Which categories have the highest average review sentiment?
-- Why: Identifies the app markets whose users leave the most positive feedback.

Select category, round(avg(sentiment_polarity),2) as average_sentiment
from googleplaystore gps 
join googleplaystore_user_reviews gps_ur 
on gps.app=gps_ur.app
where sentiment_polarity is not null
group by category
order by average_sentiment desc;