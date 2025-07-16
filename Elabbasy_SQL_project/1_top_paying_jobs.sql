/*
Question: Which remote Data Scientist positions offer the highest salaries?
- Retrieve the top 10 highest-paying remote Data Scientist job listings
- Only include job postings with defined (non-null) salary data
- BONUS: Display the company names associated with these top 10 roles
- Purpose: To showcase the most lucrative opportunities for Data Scientists, emphasizing earning potential and remote work flexibility.
*/

SELECT
  job_id,
  job_title,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date,
  name AS company_name

FROM
  job_postings_fact

LEFT JOIN company_dim  ON job_postings_fact.company_id = company_dim.company_id
WHERE
  job_title_short IN  ('Data Scientist', 'Data Analyst') AND 
  job_location = 'Ireland'  AND salary_year_avg IS NOT NULL

ORDER BY
  salary_year_avg DESC

LIMIT 10;


