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