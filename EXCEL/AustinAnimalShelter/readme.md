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
### 3.1 Monthly Intake Trends  
![Monthly Intake Trends](https://github.com/user-attachments/assets/d65ad99f-4e6b-406f-87c5-3479a2498ee0)
- **What it shows:** A pronounced spike in intakes each May–June (2,000+ animals), with a smaller bump in October.  
- **Why it matters:** Shelter can start adjusting staff and volunteers hours in late April to maintain peak support through July, then taper off in August.
- 
### 3.2 Day-of-Week Patterns
![Image](https://github.com/user-attachments/assets/e8200975-c02c-4445-a21c-41fd66b53479)
- **What it shows:** Mondays are busiest (~19,000 intakes across the years), Sundays are the quietest (~15,500).  
- **Why it matters:** Shelter can schedule extra intake and transport teams on busier days.

### 3.3 Species Breakdown  
![Image](https://github.com/user-attachments/assets/d65ad99f-4e6b-406f-87c5-3479a2498ee0)
- **What it shows:** Dogs, Cats, and Other species each account for ~44% adoption rates; Birds slightly higher at 47%; Livestock lag at 38%.  
- **Why it matters:** Livestock face the lowest adoption and highest euthanasia. The Shelter could seek more partnerships with sanctuaries, farms, or 4-H programs to priortize transfers and minimize euthanasia.
  
### 3.4 Adoption Stay Duration Distribution 
-**What it shows:** Adoption outcomes has the longest average stays as shown in Chart A. In Chart B we will look more into adoption
![ChartA](https://github.com/user-attachments/assets/5d9a311d-38ba-49e5-b2fe-9a9f33a54c6d)
![ChartB](https://github.com/user-attachments/assets/50268d9f-97b4-444a-825b-e28eccae068e)
- **What it shows:** Young livestock wait the longest (≈70 days), with baby livestock next (≈53 days). Senior birds average ≈42 days, and senior cats/dogs sit around 35–38 days which is well above the overall adoption mean of 33 days.  
- **Why it matters:** These long-stay cohorts create the biggest capacity bottlenecks, we can focus on solutions to lower the stay average, for example promotions for adopting or making it more convenient to adopt. 
  
### 3.5 Breed-Specific Trends  
![Intake Volume & Average Stay by Breed](https://github.com/user-attachments/assets/65031a38-0939-4e48-b98f-1f97512142e8)
- **What it shows:** Domestic Shorthair and Pit Bull mixes account for nearly 40% of all intakes and average 26–31 days in the shelter whcih is above the overall mean stay of 21 days.  
- **Why it matters:** Focusing foster, adoption incentives, or marketing campaigns on these higher volume and long stay breeds offers the greatest opportunity to reduce overall shelter load and improve placement rates.

  ## 4. Key Findings & Recommendations

1. **Seasonal Surges**  
   - May–June see the highest intake volumes (>2,000/month) and December–February the lowest (<1,500).  
   - **Recommendation:** Adjust staffing and volunteer-recruiting coverage starting in late April, hold through July, then scale down during the end of August.

2. **Weekday Load**  
   - Mondays are the busiest days in term of intakes (~19,000), with lowest intakes on Sundays (~15,500).  
   - **Recommendation:** Focus volunteers recruiting for Mon–Wed and maintain weekend coverage with lighter Sunday shifts.

3. **Species-Level Outcomes**  
   - Adoption rates: Dogs/Cats/Other ~44%; Birds 47%; Livestock 38%. Livestock euthanasia highest at 14%.  
   - **Recommendation:** Formalize transfer partnerships (sanctuaries, farms, 4-H) for livestock to reduce euthanasia.

4. **Length-of-Stay Hotspots**  
   - Young Livestock average 71 days; senior Cats 37 days; senior Dogs 38 days. Overall adoption cases average 33 days.  
   - **Recommendation:** Start targeted foster and adoption campaigns for young livestock and senior pets to shorten their stays.

5. **Breed-Specific Bottlenecks**  
   - Domestic Shorthair and Pit Bull mixes represent ~40% of intakes and average 26–31 days in shelter.  
   - **Recommendation:** Prepare breed-focused marketing and foster programs to reduce volume and length of stay for these groups.

## 4. Interactive Dashboard
- My final dashboard brings together all key metrics on one Excel sheet for easier viewing and decision-making.
![Image](https://github.com/user-attachments/assets/efc07b04-e6bd-454a-aac0-4128f00c49af)







