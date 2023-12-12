# Identify the five oldest users on Instagram

select * from users
order by created_at asc
limit 5;


#Identify users who have never posted a single photo on Instagram.

SELECT users.id, users.username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

#Determine the winner of the contest and provide their details to the team.
SELECT users.username , likes.photo_id , count(likes.user_id)
FROM users
INNER JOIN photos
ON users.id= photos.id
INNER JOIN likes
ON photos.user_id = likes.user_id
GROUP BY users.id , users.username , photos.image_url,likes.photo_id
ORDER BY count(likes.user_id) DESC
limit 1;

#4.Identify and suggest the top five most commonly used hashtags on the platform.
SELECT tags.tag_name, COUNT(photo_tags.tag_id) AS tag_count
FROM tags
INNER JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.tag_name
ORDER BY tag_count DESC
LIMIT 5;

#5 Determine the day of the week when most users register on Instagram. 
#Provide insights on when to schedule an ad campaign.

SELECT
    DAYOFWEEK(created_at) AS registration_day,
    COUNT(*) AS registration_count
FROM users
GROUP BY registration_day
ORDER BY registration_count DESC
LIMIT 1;

#Calculate the average number of posts per user on Instagram. Also, 
#provide the total number of photos on Instagram divided by the total number of users.

-- Calculate the average number of posts per user
SELECT
    AVG(posts_per_user) AS average_posts_per_user
FROM (
    SELECT user_id,COUNT(*) AS posts_per_user
    FROM photos
    GROUP BY user_id
) AS user_post_counts;

-- Provide the total number of photos on Instagram divided by the total number of users
SELECT
    COUNT(*) AS total_photos,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(*) / COUNT(DISTINCT user_id) AS average_photos_per_user
FROM  photos;

#Identify users (potential bots) who have liked every single photo on the site, 
#as this is not typically possible for a normal user.
SELECT id ,username
FROM users
WHERE NOT EXISTS 
(
        SELECT p.id
        FROM photos p
        WHERE NOT EXISTS 
        (
            SELECT 1
            FROM likes l
            WHERE l.user_id = users.id AND l.photo_id = p.id
        )
    );

