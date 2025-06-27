# Google Play Store App Market Exploratory

An SQL exploration of the Google Play Store app marketplace. We clean raw data, answer key business questions, and surface insights that drive actionable recommendations.

---

## 1. Data Cleaning

All cleaning steps in **queries/androidmarket_cleaning.sql**:

1. **Normalize app size**  
   - Converted mixed “k”/“M” units into a `size_mb` float column.  
2. **Installs → numeric**  
   - Stripped commas and “+” from `installs`, cast to `installs_int`.  
3. **Price → numeric**  
   - Removed “$” sign and cast `price` to `DECIMAL(5,2)`.
   
---

## 2. Key Questions & Insights
### Q1: Which categories have the highest average rating?  
- **Script:** `avg_rating_by_category.sql`  
- **Why it matters:** Helps product teams focus on segments with the happiest users.  
- **Insight:**  
  - **Education** leads at **4.39 ± 0.25**—a small niche with consistently high satisfaction.  
  - **Games** average **4.29 ± 0.37** but with wider swings, meaning only standout titles rise above the noise.  

### Q2: Do paid apps get better ratings than free ones?  
- **Script:** `free_vs_paid_ratings.sql`  
- **Why it matters:** Informs monetization strategy—does charging upfront correlate with happier users?  
- **Insight:**  
  - Paid apps average **4.27★** (647 titles) vs. **4.19★** (8 719 free apps).  
  - A small 0.08-star gap suggests a slight edge for paid apps, though many “free” apps use in-app purchases.  

### Q3: How do app sizes impact ratings?  
- **Script:** `size_vs_rating.sql`  
- **Why it matters:** Determines if users reward “premium” (larger) apps or prefer lightweight experiences.  
- **Insight:**  
  - **> 50 MB** apps score **4.28 ± 0.39**—likely well-built games or professional tools.  
  - **10–50 MB** apps average **4.18**, but show more variability.  
  - **< 10 MB** lag at **4.13 ± 0.60**, spanning simple utilities to under-maintained experiments.  

### Q4: Is there a link between review count and average rating?  
- **Script:** `review_count_vs_rating.sql`  
- **Why it matters:** Checks whether social proof (more reviews) drives perceived quality.  
- **Insight:**  
  - Pearson correlation ≈ **0.07**: virtually no linear relationship.  
  - Having more reviews doesn’t guarantee a higher (or lower) average rating.  

### Q5: Reviews vs. Downloads  
- **Script:** `reviews_vs_downloads.sql`  
- **Why it matters:** Reveals whether popular apps (by install count) also drive more user feedback.  
- **Insight:**  
  - Correlation ≈ **0.64**: a moderately strong positive link.  
  - Apps with more installs tend to get more reviews.  

### Q6: Which categories have the highest average review sentiment?  
- **Script:** `avg_sentiment_by_category.sql`  
- **Why it matters:** Identifies niches where users leave the most positive feedback.  
- **Insight:**  
  - **Comics** (0.46), **Events** (0.38), **Auto & Vehicles** (0.35) top the list—specialized markets with highly engaged audiences.  

---

*Dataset source: L. Gupta, "Google Play Store Apps," Feb 2019. [Online]. Available: https://www.kaggle.com/lava18/google-play-store-apps
