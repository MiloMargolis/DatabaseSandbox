DROP DATABASE IF EXISTS HuskyGram;
CREATE DATABASE IF NOT EXISTS HuskyGram;

USE HuskyGram;

CREATE TABLE IF NOT EXISTS users
(
    username   varchar(225) unique not null,
    created_at datetime,
    id         integer,
    PRIMARY KEY (id)
);

INSERT INTO users (username, created_at, id)
VALUES ('Milo', '2023-10-14 22:40:30', 20),
       ('Dylan', '2023-10-14 22:40:30', 30);


CREATE TABLE IF NOT EXISTS follows
(
    created_at  datetime,
    follower_id integer,
    followee_id integer,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followee_id) REFERENCES users (id)
);

INSERT INTO follows (created_at, follower_id, followee_id)
VALUES ('2023-10-14 22:40:30', 20, 30),
       ('2023-10-14 22:40:30', 30, 20);

CREATE TABLE IF NOT EXISTS photos
(
    image_url  varchar(255) not null,
    user_id    integer      not null,
    created_at datetime,
    id         integer,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO photos (image_url, user_id, created_at, id)
VALUES ('url', 20, '2023-10-14 22:40:30', 200),
       ('url', 30, '2023-10-14 22:40:30', 2001);

CREATE TABLE IF NOT EXISTS tags
(
    tag_name varchar(255) unique,
    created_at datetime,
    id integer,
    PRIMARY KEY (id)
);

INSERT INTO tags (tag_name, created_at, id)
VALUES ('thing1', '2023-10-14 22:40:30',  40),
       ('thing2', '2023-10-14 22:40:30',  41);

CREATE TABLE IF NOT EXISTS photo_tags
(
    photo_id integer unique not null ,
    tag_id integer unique not null,
    PRIMARY KEY (photo_id, tag_id),
    FOREIGN KEY (photo_id) REFERENCES photos (id),
    FOREIGN KEY (tag_id) REFERENCES tags (id)
);

INSERT INTO photo_tags (photo_id, tag_id)
VALUES (200, 40),
       (2001, 41);

DROP TABLE IF EXISTS likes;
CREATE TABLE IF NOT EXISTS likes
(
    created_at datetime,
    user_id integer unique not null,
    photo_id integer unique not null,
    PRIMARY KEY (user_id, photo_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id)
);

INSERT INTO likes (created_at, user_id, photo_id)
VALUES ('2023-10-14 22:40:30', 20, 200),
       ('2023-10-14 22:40:30', 30, 2001);

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments
(
    comment_text varchar(255) not null,
    user_id integer not null,
    photo_id integer not null,
    created_at datetime,
    id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id)
);

INSERT INTO comments (comment_text, user_id, photo_id, created_at, id)
VALUES ('text#1', 20, 200, '2023-10-14 22:40:30', 45004),
       ('text#2', 30, 2001, '2023-10-14 22:40:30', 45005);

SELECT * FROM comments;






