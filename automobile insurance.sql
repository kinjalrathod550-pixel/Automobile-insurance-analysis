use project_automobile_insurance;
show tables;
select * from auto_table;
-- Analyse How Often Different Types of Complaints Occur
SELECT
	SUM(Upheld_Complaints) as Total_Upheld,
    SUM(Not_Upheld_Complaints) as Total_Not_Upheld,
    SUM(Question_of_Fact_Complaints) as Total_Question_of_Fact,
    SUM(Total_Complaints) as Grand_Total_Complaints
from auto_table;


-- Complaint Distribution by Company
SELECT
	Company_Name,
    SUM(Upheld_Complaints) AS Upheld,
    SUM(Not_Upheld_Complaints) AS Not_Upheld,
    SUM(Question_of_Fact_Complaints) AS Question_of_Fact,
    SUM(Total_Complaints) AS Total_Complaints
from auto_table
Group by Company_Name
order by Total_Complaints desc;


-- Trends of Complaints Over the Years
SELECT 
    Filing_Year,
    SUM(Upheld_Complaints) AS Upheld,
    SUM(Not_Upheld_Complaints) AS Not_Upheld,
    SUM(Question_of_Fact_Complaints) AS Question_of_Fact,
    SUM(Total_Complaints) AS Total_Complaints
FROM auto_table
GROUP BY Filing_Year
ORDER BY Filing_Year;

-- Complaint Ratio Analysis
-- This helps compare complaints against premiums written
SELECT 
    Company_Name,
    SUM(Total_Complaints) AS Total_Complaints,
    SUM(Premiums_Written) AS Premiums,
    
    ROUND(
        (SUM(Total_Complaints) / SUM(Premiums_Written)) * 100,
        4
    ) AS Complaint_Ratio
FROM auto_table
GROUP BY Company_Name
ORDER BY Complaint_Ratio DESC;

-- Premium Amounts Year-by-Year
SELECT
	Filing_Year,
    round(sum(Premiums_Written),2) As Total_Premiums
from auto_table
group by Filing_Year
order by Filing_Year;

-- Company-Wise Premium Growth
Select
Company_Name,
Filing_Year,
round(Sum(Premiums_Written),2) As Premiums
from auto_table
group by Filing_Year, Company_Name
order by Filing_Year, Premiums desc;


-- Compare Premiums vs Complaints
select
Filing_Year,
sum(Premiums_Written) As Total_Preimums,
sum(Total_Complaints) as Total_Complaints
from auto_table
group by Filing_Year
order by Filing_Year;
    
