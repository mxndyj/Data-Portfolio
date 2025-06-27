-- Cleaning Data

-- 1.Convert size values to MB

Alter table googleplaystore
add column size_mb FLOAT;

Update googleplaystore
set size_mb = case
when size like '%M' then replace(size,'M','')::FLOAT
when size like '%k' then replace (size,'k','')::FLOAT/ 1024
else null
end;

Alter table googleplaystore
drop column size;


-- 2. Change the number of downloads to numeric and drop the "+"
Alter table googleplaystore
add column installs_int BIGINT;

Update googleplaystore
set installs_int= replace(replace(installs, ',',''),'+','')::BIGINT;

Alter table googleplaystore
drop column installs;

--3. Change the prices to decimals
Alter table googleplaystore
alter column price type DECIMAL(5,2)
using replace(price,'$','')::DECIMAL(5,2);
