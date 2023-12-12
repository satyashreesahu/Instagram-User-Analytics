#Identify and suggest the top five most commonly used hashtags on the platform.

select tags.tag_name, count(photo_tags.tag_id) as tag_count
from tags
inner join photo_tags
on tags.id=photo_tags.tag_id
group by tags.tag_name
order by tag_count desc
limit 5;

