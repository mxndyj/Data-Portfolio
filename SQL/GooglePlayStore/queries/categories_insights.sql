-- File: categories_insights.sql
-- Q1: Which 20 categories have the most total installs and what are their average ratings?
-- Q2: For the top 5 categories by number of apps, how many reviews did they receive and what was their average review sentiment?
-- Why: Identifies the biggest download markets and gauges their 
-- overall app quality; then it zooms in on the largest segments to measure both user engagement (review volume) and satisfaction (sentiment).


-- Part 1: Top 20 categories by installs + their average rating

create temp table top20_categories as
select category, SUM(installs_int)as total_installs,ROUND(AVG(rating), 2) as avg_rating,
COUNT(*) as num_apps
from googleplaystore
where installs_int is not NULL and rating is not NULL
group by category
order by total_installs DESC
limit 20;

select * from top20_categories;


-- Part 2: Review counts & avg sentiment for the top 5 categories by app count

with top5 as (
  select category
  from top20_categories
  order by num_apps DESC
  limit 5
)
select p.category, round(avg(sentiment_polarity),2) as average_sentiment, count (r.review) as total_reviews
from googleplaystore_user_reviews r
join googleplaystore p on r.app = p.app
join top5 on top5.category=p.category
where r.sentiment_polarity is not null
group by p.category
order by total_reviews desc;
