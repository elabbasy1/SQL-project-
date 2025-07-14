SELECT
  job_title_short AS TITLE,
  job_location AS location,
  job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
  EXTRACT(MONTH FROM job_posted_date ) AS date_month,
  EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM  job_postings_fact
LIMIT 5;


SELECT 
  COUNT(job_id) AS job_Posted_count,
  EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
  job_postings_fact

WHERE
  job_title_short = 'Data Scientist'

GROUP BY
  date_month

ORDER BY
  job_Posted_count


--january
CREATE TABLE january_jobs AS
  SELECT * 
  FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
  SELECT * 
  FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
  SELECT * 
  FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT job_posted_date
FROM march_jobs


