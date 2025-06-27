# Google Play Store App Market Exploratory

An SQL exploration of the Google Play Store app marketplace. We clean raw data, answer key business questions, and surface insights that drive actionable recommendations.

---

## 1. Data Cleaning

All cleaning steps live in **androidmarket_cleaning.sql**:

1. **Normalize app size**  
   - Converted mixed “k”/“M” units into a `size_mb` float column.  
2. **Installs → numeric**  
   - Stripped commas and “+” from `installs`, cast to `installs_int`.  
3. **Price → numeric**  
   - Removed “$” sign and cast `price` to `DECIMAL(5,2)`.
