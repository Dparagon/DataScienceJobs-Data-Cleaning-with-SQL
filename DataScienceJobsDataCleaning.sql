

                --- Data Science Jobs Data Cleaning ---

-- DATA OVERVIEW
SELECT * FROM DS_jobs_uncleaned

-- Creating new data copy
SELECT * INTO data_science_jobs 
FROM
   (SELECT * FROM DS_jobs_uncleaned) ds_jobs

SELECT * FROM data_science_jobs

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'data_science_jobs'

-- CLEANING PROCESS

-- (Job_title)
SELECT DISTINCT Job_Title FROM data_science_jobs

UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'(Sr.) Data Scientist','Senior Data Scientist')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Health Plan Data Analyst, Sr','Health Plan Data Analyst Senior')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Jr. Business Data Analyst (position added 6/12/2020)','Junior Business Data Analyst')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Jr. Data Engineer','Junior Data Engineer')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Machine Learning Engineer, Sr.','Machine Learning Engineer Senior')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr Data Analyst','Senior Data Analyst')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr Data Engineer (Sr BI Developer)','Senior Data Engineer (Senior BI Developer)')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr Data Scientist','Senior Data Scientist')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr Scientist - Extractables & Leachables','Senior Scientist - Extractables & Leachables')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr Data Analyst','Senior Data Analyst')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Senior Data Scientist II','Senior Data Scientist II')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr. ML/Data Scientist - AI/NLP/Chatbot','Senior ML/Data Scientist - AI/NLP/Chatbot')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'Sr. Research Associate/ Scientist, NGS prep & Molecular Genomics','Senior Research Associate/ Scientist, NGS prep & Molecular Genomics')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'ELISA RESEARCH SCIENTIST (CV-15)','Elisa Research Assistant')
UPDATE data_science_jobs SET Job_title = REPLACE(Job_title,'ENGINEER - COMPUTER SCIENTIST - RESEARCH COMPUTER SCIENTIST - SIGNAL PROCESSING - SAN ANTONIO OR','Engineer - Computer Scientist')

-- (Salary_Estimate)
SELECT DISTINCT Salary_estimate FROM data_science_jobs

UPDATE data_science_jobs SET Salary_estimate = SUBSTRING(Salary_estimate,1,11)

-- (Rating)
SELECT DISTINCT Rating FROM data_science_jobs

UPDATE data_science_jobs SET Rating = ROUND(Rating,1)

-- (Company Name)
SELECT DISTINCT Company_Name FROM data_science_jobs

UPDATE data_science_jobs SET Company_Name = SUBSTRING(Company_Name,1, LEN(Company_Name) -3) 

-- (Size)
SELECT DISTINCT Size FROM data_science_jobs

UPDATE data_science_jobs SET Size = CASE WHEN Size = '-1'THEN 'Unknown' 
                                         ELSE REPLACE(Size, 'to', '-')
			                 END

-- (Type of ownership)
SELECT DISTINCT Type_of_ownership FROM data_science_jobs

UPDATE data_science_jobs SET Type_of_ownership = CASE WHEN Type_of_ownership = '-1' THEN 'Unknown'
                                                      WHEN Type_of_ownership = 'Company - Private' THEN 'Private Company'
					              WHEN Type_of_ownership = 'Company - Public' THEN 'Public Company'
						      ELSE Type_of_ownership
						      END

-- (Revenue)
SELECT DISTINCT Revenue FROM data_science_jobs

UPDATE data_science_jobs SET Revenue = CASE WHEN Revenue = '-1'THEN 'Unknown'
                                            WHEN Revenue LIKE '%Non%' THEN 'Unknown' 
					    ELSE REPLACE(Revenue, 'to', '-') 
					    END

-- (Competitiors)
SELECT DISTINCT Competitors FROM data_science_jobs

UPDATE data_science_jobs SET Competitors = CASE WHEN Competitors = '-1' THEN 'Unknown'
                                           ELSE Competitors
					   END

--- DATA REVIEW
SELECT * FROM data_science_jobs