SELECT * FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates;

### 1. What is the average recycling efficiency for each district in New York City?
SELECT District, AVG(`Recycling Efficiency`) AS avgRE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY District;

### 2. Which month had the highest total capture efficiency, and what was the value?
SELECT `Month Name`, MAX(`Total Capture Efficiency`) AS maxTCE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY `Month Name`;

### 3. How does the recycling efficiency vary across different fiscal years?
SELECT `Fiscal Year`, AVG(`Recycling Efficiency`) AS avgRE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY `Fiscal Year`;

### 4. Which zone has the highest average total capture efficiency?
SELECT Zone, AVG(`Total Capture Efficiency`) AS avgTCE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY Zone ORDER BY avgTCE DESC LIMIT 1;

### 5. Can you identify any correlation between paper capture efficiency and MGP (Metal, Glass, Plastic) capture efficiency?
SELECT((COUNT(*) * SUM(`Paper Capture Efficiency` * `MGP Capture Efficiency`)) - (SUM(`Paper Capture Efficiency`) * SUM(`MGP Capture Efficiency`))) /
(SQRT((COUNT(*) * SUM(`Paper Capture Efficiency` * `Paper Capture Efficiency`)) - (SUM(`Paper Capture Efficiency`) * SUM(`Paper Capture Efficiency`))) *
SQRT((COUNT(*) * SUM(`MGP Capture Efficiency` * `MGP Capture Efficiency`)) - (SUM(`MGP Capture Efficiency`) * SUM(`MGP Capture Efficiency`)))) AS Cor
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates;

### 6. What is the overall recycling performance trend over the years?
SELECT `Fiscal Year`, AVG(`Overall Recycling Performance`) AS avgORP
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY `Fiscal Year` ORDER BY `Fiscal Year`;

### 7. Are there any districts where the total capture efficiency exceeds a certain threshold (e.g., 50%) consistently?
SELECT District
FROM ( SELECT District, AVG(`Total Capture Efficiency`) AS avgTCE FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY District) AS Subquery WHERE avgTCE > 50;

### 8. How does the recycling efficiency change month by month?
SELECT `Month Name`, AVG(`Recycling Efficiency`) AS avgRE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY `Month Name`
ORDER BY AVG(`Recycling Efficiency`);

### 9. Is there a significant difference in recycling efficiency between different zones?
SELECT Zone, AVG(`Recycling Efficiency`) AS avgRE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY Zone;

### 10. Can we identify any seasonal trends in recycling diversion and capture rates?
SELECT `Month Name`, AVG(`Recycling Efficiency`) AS avgRE
FROM Final_Project_Ait_580.cleaned_recycling_diversion_capture_rates
GROUP BY `Month Name` ORDER BY CASE
WHEN `Month Name` = 'January' THEN 1 WHEN `Month Name` = 'February' THEN 2
WHEN `Month Name` = 'March' THEN 3 WHEN `Month Name` = 'April' THEN 4
WHEN `Month Name` = 'May' THEN 5 WHEN `Month Name` = 'June' THEN 6
WHEN `Month Name` = 'July' THEN 7 WHEN `Month Name` = 'August' THEN 8
WHEN `Month Name` = 'September' THEN 9 WHEN `Month Name` = 'October' THEN 10
WHEN `Month Name` = 'November' THEN 11 WHEN `Month Name` = 'December' THEN 12 END;
    
