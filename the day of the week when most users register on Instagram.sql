#Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign

select 
	dayofweek(created_at) as registartion_day,
    count(*) as registration_count
from users
group by registartion_day
order by registration_count desc
limit 1;
