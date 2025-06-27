# Austin Animal Shelter Data Analysis in Excel

**Objective**  
Combine intake and outcome records from the Austin Animal Center to uncover seasonal patterns, compare species outcomes, and deliver an interactive dashboard for decision support.

**Tools**  
Excel Tables · Power Query · PivotTables · Charts · Slicers

## 1. Data Import  
I pulled the “Intakes” and “Outcomes” CSVs from the City of Austin open data portal (https://data.austintexas.gov) and loaded them into Excel tables for a clean starting point.

![Import](https://github.com/user-attachments/assets/4bd9a5ff-d1a5-4193-b8bb-7b7072c150cf)

1. **Remove invalid dates**  
   - Filtered out any records with Intake or Outcome timestamps in the future to avoid skewing.  
2. **Standardize categories**  
   - Replaced truly blank or space-only entries in Species, Intake Type, and Outcome Type with “Unknown.”  
   - Trimmed extra spaces and unified text case to prevent duplicate buckets in PivotTables.  
3. **Enforce required dates**  
   - Dropped rows missing an Intake DateTime; without that key field, we can’t calculate stay durations.  
4. **Match intakes to next outcomes**
   - The Intakes table uses a composite primary key (Animal ID , Intake DateTime), while Outcomes only has Animal ID as a foreign key, so each intake can match multiple outcomes. Power Query’s merge can’t cleanly determine which outcome belongs to which intake when there’s a 1-to-many FK relationship.
To work around this, I used MINIFS to return the very next outcome date for each intake. Then, XLOOKUP was used to pull the matching outcome type and date.

![Clean](https://github.com/user-attachments/assets/d69107e0-24d4-4b1c-b6b3-a2d1e4937efc)

## 3. Exploratory Analysis
In this section, we will look into the raw trends and visualizations. 




