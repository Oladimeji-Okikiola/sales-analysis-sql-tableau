  --using rank to get highestrevenue and lowest volume

WITH productmetric AS(
    SELECT 
PRODUCT,
sum(total_amount) as totalrevenue,
sum (quantity)as totalunitsold
from analysis
group by product
)
select
product,
totalrevenue,
totalunitsold,
rank ()over(order by totalrevenue desc) as revenuerank,
rank()over(order by totalunitsold asc)as unitsoldrank
from productmetric