/*
Question: Which skills are most in demand for Data Analyst and Data Scientist roles?
- Perform an inner join on job postings as done in Query 2
- Extract the top 5 most frequently requested skills for data analysts and scientists
- Consider all available job postings
- Purpose: To highlight the 5 most sought-after skills in the market, 
  offering valuable guidance for job seekers aiming to enhance their skillset.
*/

SELECT 
 skills,
 COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
WHERE
  job_title_short IN ('Data scientist', 'Data Analyst') AND 
  job_work_from_home = True
GROUP BY
  skills
ORDER BY
  demand_count DESC
LIMIT 5;