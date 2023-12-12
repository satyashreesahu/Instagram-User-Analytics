#Determine the winner of the contest and provide their details to the team.

select users.username, likes.photo_id, count(likes.user_id)
from users
inner join photos
on users.id =  photos.id
inner join likes
on likes.user_id = photos.user_id
group by users.username, likes.photo_id
order by count(likes.user_id)
limit 1;