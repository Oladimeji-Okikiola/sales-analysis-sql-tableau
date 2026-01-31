-- Business Question:
-- Which products generate high revenue but low sales volume
-- compared to the average product performance?

WITH productmetric AS(
    SELECT 
PRODUCT,
sum(total_amount) as totalrevenue,
sum (quantity)as totalunitsold
from analysis
group by product
),
benchmarks as (
select
avg(totalrevenue) as avgrevenue,
avg(totalunitsold)as avgunitsold
from productmetric
)
SELECT
    p.product,
    p.totalrevenue,
    p.totalunitsold
FROM productmetric p
CROSS JOIN benchmarks b
WHERE p.totalrevenue > b.avgrevenue
  AND p.totalunitsold < b.avgunitsold;