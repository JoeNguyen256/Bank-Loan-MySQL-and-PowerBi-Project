UPDATE financial_loan
SET issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');

Alter table financial_loan
Modify Column issue_date DATE;


-- Total Loan Applications
select count(id) from financial_loan;

-- Total Funded Amount
Select SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan;

-- Total Amount Recived
select sum(total_payment) as Total_Recived from financial_loan;

-- Average Interest Rate
select round(avg(int_rate),2) as avg_rate from financial_loan;

-- Average Debt-to-Income Ratio (DTI):
select round(avg(dti),2) as avg_dti from financial_loan;

-- Good Loan Percentage:
select (sum(case when loan_status = 'Fully Paid' or loan_status = 'Current' then 1 else 0 end) *100)/count(id) as good_loan_percent
from financial_loan;

-- Good Loan Applications:
select count(id) as good_loan_app
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Funded Amount
select sum(loan_amount) as good_loan_funded
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Amount Recived:
select sum(total_payment) as good_loan_recived
from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Bad Loan Percentage
select (sum(case when loan_status = 'Charged Off' then 1 else 0 end) *100)/count(id) as good_loan_percent
from financial_loan;

-- Bad Loan Applications
select count(id) as good_loan_app
from financial_loan
where loan_status = 'Charged Off';

-- Bad Loan Funded Amount
select sum(loan_amount) as good_loan_funded
from financial_loan
where loan_status = 'Charged Off';

-- Bad Loan Amount Received
select sum(total_payment) as good_loan_recived
from financial_loan
where loan_status = 'Charged Off';

-- Overview Loan Status:
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loan
    GROUP BY
        loan_status;
        
        
 -- BANK LOAN REPORT | OVERVIEW:
 select month(issue_date) as month_num,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1
 order by 1;
 
 -- State Overview:
 select address_state as state,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1;
 
 -- Term Overview:
 select term,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1;
 
 -- Employeement Lenght Overview:
 select emp_length,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1;
 
 -- Purpose Overview:
  select purpose,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1;
 
 -- Hoem ownership Overview:
select home_ownership,
 count(id) as total_loan_app,
 sum(loan_amount) as total_loan_amount,
 sum(total_payment) as total_payment
 from financial_loan
 group by 1;