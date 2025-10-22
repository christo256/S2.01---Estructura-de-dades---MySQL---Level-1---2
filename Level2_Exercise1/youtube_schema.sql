DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

CREATE TABLE IF NOT EXISTS users (
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(250) NOT NULL,
username VARCHAR (50) NOT NULL UNIQUE,
birthdate DATE,
gender ENUM('male', 'female','other'),
country VARCHAR (50),
postal_code VARCHAR (10)
);

CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    size BIGINT,  
    filename VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public', 'hidden', 'private'),
    user_id INT,
    upload_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE video_tags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE channels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    creation_date DATETIME,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE subscriptions (
    user_id INT,
    channel_id INT,
    subscription_date DATETIME,
    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (channel_id) REFERENCES channels(id)
);

CREATE TABLE video_likes_dislikes (
    video_id INT,
    user_id INT,
    like_dislike ENUM('like', 'dislike'),
    timestamp DATETIME,
    PRIMARY KEY (video_id, user_id),
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    creation_date DATETIME,
    status ENUM('public', 'private'),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlist_videos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    timestamp DATETIME NOT NULL,
    video_id INT,
    user_id INT,
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
    );
    
    CREATE TABLE comment_likes_dislikes (
    comment_id INT,
    user_id INT,
    like_dislike ENUM('like', 'dislike'),
    timestamp DATETIME,
    PRIMARY KEY (comment_id, user_id),
    FOREIGN KEY (comment_id) REFERENCES comments(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);