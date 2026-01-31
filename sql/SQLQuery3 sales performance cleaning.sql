select*
from analysis

--date convertion

alter table analysis
add dateconverted date

update analysis
set dateconverted=convert(date,order_date)

--checking duplicate

select order_id,count(*)
from analysis
group by order_id
having count(*)>1

--checking null

select*
from analysis
where quantity <= 0
or unit_price <=0

--validation

select*
from analysis 
where total_amount <> cast(quantity as bigint) *cast( unit_price as bigint)

--state cleaning

select distinct 
upper(Ltrim(Rtrim(state)))as cleanedstate
from analysis

alter table analysis
drop column order_date



