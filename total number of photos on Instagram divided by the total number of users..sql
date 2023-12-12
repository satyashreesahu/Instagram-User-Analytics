#The total number of photos on Instagram divided by the total number of users.

select
count(*) as total_photos,
count(distinct user_id) as total_users,
count(*) / count(distinct user_id) as average_photo_per_user
from photos;