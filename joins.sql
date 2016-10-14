-- SELECT * FROM users;

-- SELECT * FROM posts
-- WHERE author = 100;

-- SELECT posts.*, users.first_name, users.last_name FROM posts
-- INNER JOIN users ON users.u_id = posts.author
-- WHERE author = 200;

-- SELECT posts.*, users.username FROM posts
-- INNER JOIN users ON users.u_id = posts.author
-- WHERE users.first_name LIKE '%Norene%' AND users.last_name LIKE '%Schmitt%';

-- SELECT users.username FROM users
-- INNER JOIN posts ON posts.author = users.u_id
-- WHERE posts.created_at >= '2015-01-01 00:00';

-- SELECT users.username, posts.title, posts.content FROM users
-- INNER JOIN posts ON posts.author = users.u_id
-- WHERE users.created_at < '2015-01-01 00:00';

-- SELECT comments.*, posts.title AS post_title FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id;

-- SELECT comments.*, comments.body AS comment_body,
-- posts.title AS post_title, posts.url AS post_url FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id
-- WHERE posts.created_at < '2015-01-01 00:00';

-- SELECT comments.*, comments.body AS comment_body,
-- posts.title AS post_title, posts.url AS post_url FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id
-- WHERE posts.created_at >= '2015-01-01 00:00';

-- SELECT comments.*, comments.body AS comment_body,
-- posts.title AS post_title, posts.url AS post_url FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id
-- WHERE comments.body LIKE '%USB%';

-- SELECT posts.title AS post_title, users.first_name, users.last_name,
-- comments.body AS comment_body FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id
-- INNER JOIN users ON posts.author = users.u_id
-- WHERE comments.body LIKE '%matrix%';

-- SELECT users.first_name, users.last_name,
-- comments.body AS comment_body FROM comments
-- INNER JOIN posts ON comments.parent_post = posts.p_id
-- INNER JOIN users ON posts.author = users.u_id
-- WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT author.first_name AS post_author_first_name,
author.last_name AS post_author_last_name, author.title AS post_title,
comm.username AS comment_author_username,
comm.body AS comment_body
FROM (
  SELECT body, username, parent_post FROM comments
  INNER JOIN posts ON comments.parent_post = posts.p_id
  INNER JOIN users ON comments.author = users.u_id
) comm
INNER JOIN
(
  SELECT users.first_name, users.last_name, posts.title,
  posts.p_id, posts.content FROM posts
  INNER JOIN users ON posts.author = users.u_id
) author
ON comm.parent_post = author.p_id
WHERE (comm.body LIKE '%SSL%' AND author.content LIKE '%nemo%')
OR (comm.body LIKE '%firewall%' AND author.content LIKE '%nemo%');