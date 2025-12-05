
-- weekdays -Sat and Sun
-- weekdays -Mon to Fri
Sun = 1
Mon = 2
.
.
Sat = 7
select 
Case When dayofweek(transaction_date) in (1,7) then
'Weekends'
Else 
'Weekdays'
End as Day_type,
Concat(Round(Sum(unit_price* Transaction_qty)/1000,1)
,'K') as total_sales
from coffee_shop_sales
Where Month (transaction_date) = 2 -- May Month
Group by 
Case When dayofweek(transaction_date) in (1,7) then
'Weekends'
Else 'Weekdays'
End 

select * from coffee_shop_sales
select 
store_location
sum(unit_price*transaction_qty) As Total_Sales
From coffee_shop_sales
where Month(