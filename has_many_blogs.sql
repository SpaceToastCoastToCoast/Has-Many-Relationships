--\c test

--CREATE USER has_many_user;

--DROP DATABASE IF EXISTS has_many_blogs;

--CREATE DATABASE has_many_blogs OWNER has_many_user;

--\c has_many_blogs

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE users (
  u_id serial PRIMARY KEY,
  username varchar(90) NOT NULL,
  first_name varchar(90) DEFAULT NULL,
  last_name varchar(90) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  p_id serial PRIMARY KEY,
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  author integer REFERENCES users(u_id)
);

CREATE TABLE comments (
  c_id serial PRIMARY KEY,
  body varchar(510) DEFAULT NULL,
  created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
  author integer REFERENCES users(u_id),
  parent_post integer REFERENCES posts(p_id)
);

--\d+ users

\i scripts/blog_data.sql

\i joins.sql