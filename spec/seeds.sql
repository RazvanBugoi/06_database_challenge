TRUNCATE TABLE users, posts RESTART IDENTITY;
-- TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, username) VALUES ('asd@gmail.com', 'razvanbugoi');
INSERT INTO users (email, username) VALUES ('raz@gmail.com', 'razvan');

INSERT INTO posts (title, content, views, user_id) VALUES ('My first post', 'something', 4, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('Another post', 'something else', 5, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('Third post', 'nothing here', 3, 2);