-- AI Opportunity SQL Queries
-- Author: Jeffrey Sherer
-- Description: Identify high-cost, high-risk patients using SQL logic in Snowflake

-- Query 1: High-cost patients with multiple chronic conditions
SELECT DESYNPUF_ID, TOTAL_COST, CHRONIC_COUNT
FROM BENEFICIARY_SUMMARY
WHERE TOTAL_COST > 10000 AND CHRONIC_COUNT >= 3;

-- Query 2: Average total cost by key chronic condition
SELECT 'SP_CHF' AS CONDITION, AVG(MEDREIMB_IP + MEDREIMB_OP + MEDREIMB_CAR) AS AVG_COST
FROM BENEFICIARY_SUMMARY
WHERE SP_CHF = 1

UNION ALL

SELECT 'SP_DIABETES', AVG(MEDREIMB_IP + MEDREIMB_OP + MEDREIMB_CAR)
FROM BENEFICIARY_SUMMARY
WHERE SP_DIABETES = 1;
