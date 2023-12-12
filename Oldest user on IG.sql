#Identify the five oldest users on Instagram

select * from users
order by created_at asc
limit 5;