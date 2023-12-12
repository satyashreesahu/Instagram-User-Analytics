#The average number of posts per user on Instagram. 

select 
	avg(post_per_user) as average_post_per_user
from 
	(
	select user_id, count(*) as post_per_user
    from photos
    group by user_id
    ) as user_post_count;