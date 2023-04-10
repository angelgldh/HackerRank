CREATE TABLE temp_table AS(
   WITH
    employees_per_manager AS(
        SELECT m.senior_manager_code
              ,m.manager_code
              ,COUNT(e.employee_code) n_employees_per_manager
        FROM manager m LEFT JOIN employee e
        ON m.manager_code = e.manager_code
        GROUP BY 1,2
    )
    ,
    employees_managers_per_senior AS(
        SELECT sm.lead_manager_code
              ,sm.senior_manager_code
              ,COUNT(epm.manager_code) n_manager_per_senior
              ,SUM(epm.n_employees_per_manager) n_employees_per_senior
        FROM senior_manager sm LEFT JOIN employees_per_manager epm
        ON sm.senior_manager_code=epm.senior_manager_code
        GROUP BY 1,2
    )
    ,
    employees_managers_seniors_per_lead AS(
        SELECT lm.company_code
               ,lm.lead_manager_code
               ,COUNT(emps.senior_manager_code) n_senior_per_lead
               ,SUM(emps.n_manager_per_senior) n_manager_per_lead
               ,SUM(emps.n_employees_per_senior) n_employees_per_senior
        FROM lead_manager lm LEFT JOIN employees_managers_per_senior emps
        ON lm.lead_manager_code=emps.lead_manager_code
        GROUP BY 1,2
    )
    ,
    all_per_company AS(
        SELECT c.company_code
              ,c.founder
              ,COUNT(alle.lead_manager_code) n_lead_manager
              ,SUM(alle.n_senior_per_lead) n_senior
              ,SUM(alle.n_manager_per_lead) n_manager
              ,SUM(alle.n_employees_per_lead) n_employee
        FROM company c LEFT JOIN employees_managers_seniors_per_lead alle
        ON c.company_code=alle.company_code
        GROUP BY 1,2
    )
    
    SELECT * FROM all_per_company
)
SELECT * FROM temp_table
ORDER BY company_code
