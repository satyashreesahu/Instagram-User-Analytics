#Users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user.

select id,username
from users
where not exists
(
	select p.id
    from photos p
    where not exists
    (
		select 1
        from likes l
        where l.user_id = users.id and l.photo_id =p.id
	)
);