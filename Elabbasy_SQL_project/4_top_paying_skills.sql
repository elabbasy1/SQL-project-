/*
Question: Which skills are most valuable based on salary?
- Analyze the average salary linked to each skill in Data Analyst job postings
- Include only roles with clearly defined salaries, regardless of location
- Purpose: To uncover how specific skills influence earning potential for Data Analysts, 
  guiding professionals toward the most lucrative skills to develop.
*/


SELECT 
 skills,
 ROUND(AVG(salary_year_avg), 0) AS avg_salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
WHERE
  job_title_short IN ('Data scientist', 'Data Analyst') AND 
  salary_year_avg IS NOT NULL
  AND job_work_from_home = True
GROUP BY
  skills
ORDER BY
  avg_salary DESC
LIMIT 25;


/*

1. PySpark Stands Out as the Top-Earning Skill
With an average salary exceeding $208,000, PySpark tops the list. This highlights the premium placed on distributed data processing and big data infrastructure expertise in the current job market.

2. DevOps and Collaboration Tools Are Surprisingly Lucrative
Tools like Bitbucket ($189K), GitLab ($154K), and Jenkins (~$125K) show that data professionals with DevOps or version control experience earn significantly more — even though these aren't traditionally seen as “data” skills.

3. Foundational Data Science Libraries Remain High Value
Libraries such as Pandas, NumPy, Scikit-learn, and Jupyter all average between $140K and $152K. These are essential to day-to-day data science work and are consistently linked to high-paying roles.

4. Specialized AI & ML Platforms Command Top Salaries
Skills in platforms like Watson and DataRobot each average over $155K. This suggests employers are willing to pay a premium for professionals familiar with enterprise-level machine learning systems.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*\