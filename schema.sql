CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  name TEXT
);

ALTER TABLE dishes ADD COLUMN image_url TEXT;

DELETE FROM dishes;

INSERT INTO dishes (name, image_url) 
VALUES ('cake', 'https://img-cdn.tid.al/o/03a5358e55e274f97bd79cba40fa066340aa564a.jpg');

INSERT INTO dishes (name, image_url) 
VALUES ('pudding', 'https://img-cdn.tid.al/o/03a5358e55e274f97bd79cba40fa066340aa564a.jpg');

INSERT INTO dishes (name, image_url) 
VALUES ('ribs', 'https://img-cdn.tid.al/o/03a5358e55e274f97bd79cba40fa066340aa564a.jpg');

INSERT INTO dishes (name, image_url) 
VALUES ('ribs', 'https://img-cdn.tid.al/o/03a5358e55e274f97bd79cba40fa066340aa564a.jpg');


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT
);

ALTER TABLE dishes ADD COLUMN user_id INTEGER;

ALTER TABLE users ADD COLUMN password_digest TEXT;


-- email             ppassword   dish_ids
-- hailey@gmai.com pudding         [5,6,7]
-- kat@gmai.com pudding
-- sam@gmai.com pudding
-- ben@gmai.com pudding
-- tim@gmai.com pudding
-- tom@gmai.com pudding



--          mvp - minimum viable product 
     
--       users table
--          email
--          password


--          "data modelling"

-- [user]------has many------>[dish]  
--       <-----belongs to----- 

-- sql database / relational database

-- one to many relationship



digest dinasour



                                    
