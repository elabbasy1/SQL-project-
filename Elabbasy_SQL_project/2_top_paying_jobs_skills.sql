/*
Question: What skills are needed for the highest-paying Data Scientist roles?
- Use the top 10 highest-paying remote Data Scientist jobs from the previous query
- Include the specific skills required for each of these roles
- Purpose: To give insight into which in-demand skills are associated with top-paying positions, helping job seekers prioritize skill development aligned with high salary opportunities
*/

WITH top_paying_job AS(
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

    LIMIT 10
)

SELECT top_paying_job.*,
skills
FROM top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
ORDER BY
  salary_year_avg DESC;


/*SQL and Python dominate: These two skills appear most frequently in high-paying roles, underscoring their critical importance in the data field. Employers are clearly looking for professionals who can manipulate data (SQL) and build analytics or machine learning solutions (Python).

Specialized languages show up less but still matter:

Scala and R appear in a smaller number of postings, yet their presence signals value in big data processing and statistical modeling, respectively.

Oracle also appears, hinting that some companies still rely on enterprise-level database systems.

[
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-03 00:47:57",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-03 00:47:57",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-03 00:47:57",
    "company_name": "Stripe",
    "skills": "scala"
  },
  {
    "job_id": 631334,
    "job_title": "Data Analyst - Operations",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-03 00:47:57",
    "company_name": "Stripe",
    "skills": "r"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-08-19 14:30:29",
    "company_name": "Zynga",
    "skills": "sql"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-08-19 14:30:29",
    "company_name": "Zynga",
    "skills": "python"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-08-19 14:30:29",
    "company_name": "Zynga",
    "skills": "oracle"
  },
  {
    "job_id": 738589,
    "job_title": "Data Analytics Specialist",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89100.0",
    "job_posted_date": "2023-08-19 14:30:29",
    "company_name": "Zynga",
    "skills": "tableau"
  },
  {
    "job_id": 687790,
    "job_title": "Global Compliance Data Analyst",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "43200.0",
    "job_posted_date": "2023-12-21 08:42:15",
    "company_name": "CRH",
    "skills": "gdpr"
  },
  {
    "job_id": 687790,
    "job_title": "Global Compliance Data Analyst",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "43200.0",
    "job_posted_date": "2023-12-21 08:42:15",
    "company_name": "CRH",
    "skills": "excel"
  },
  {
    "job_id": 687790,
    "job_title": "Global Compliance Data Analyst",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "43200.0",
    "job_posted_date": "2023-12-21 08:42:15",
    "company_name": "CRH",
    "skills": "power bi"
  },
  {
    "job_id": 687790,
    "job_title": "Global Compliance Data Analyst",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "43200.0",
    "job_posted_date": "2023-12-21 08:42:15",
    "company_name": "CRH",
    "skills": "sharepoint"
  },
  {
    "job_id": 687790,
    "job_title": "Global Compliance Data Analyst",
    "job_location": "Ireland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "43200.0",
    "job_posted_date": "2023-12-21 08:42:15",
    "company_name": "CRH",
    "skills": "powerpoint"
  }
]
*\
