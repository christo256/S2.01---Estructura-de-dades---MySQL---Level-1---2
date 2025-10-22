-- Usuarios
INSERT INTO users (email, password, username, birthdate, gender, country, postal_code) VALUES
('alice@example.com', 'hashedpassword1', 'alice123', '1990-05-15', 'female', 'Spain', '08001'),
('bob@example.com', 'hashedpassword2', 'bob_the_builder', '1985-10-20', 'male', 'Spain', '08002'),
('carla@example.com', 'hashedpassword3', 'carla_music', '2000-01-05', 'female', 'Argentina', '1000');

-- Canales creados por los usuarios
INSERT INTO channels (name, description, creation_date, user_id) VALUES
('Alice Channel', 'Vlogs y estilo de vida', NOW(), 1),
('BobTech', 'Tutoriales de tecnología y gadgets', NOW(), 2),
('Carla Beats', 'Música electrónica y remixes', NOW(), 3);

-- Videos subidos por los usuarios
INSERT INTO videos (title, description, size, filename, duration, thumbnail, views, likes, dislikes, status, user_id, upload_date) VALUES
('Mi primer vlog', 'Un día conmigo', 10500000, 'vlog1.mp4', 300, 'thumb1.jpg', 1200, 100, 5, 'public', 1, NOW()),
('Cómo arreglar un PC', 'Guía paso a paso', 15000000, 'pc_fix.mp4', 600, 'thumb2.jpg', 900, 80, 2, 'public', 2, NOW()),
('Remix 2023', 'Nuevo remix para bailar', 18000000, 'remix2023.mp4', 240, 'thumb3.jpg', 2000, 300, 10, 'public', 3, NOW());

-- Etiquetas
INSERT INTO tags (name) VALUES
('vlog'), ('tecnologia'), ('musica'), ('remix'), ('tutorial');

-- Relacionar vídeos con etiquetas
INSERT INTO video_tags (video_id, tag_id) VALUES
(1, 1),  
(2, 2), (2, 5),  
(3, 3), (3, 4);  

-- Bob se suscribe al canal de Alice
-- Carla se suscribe al canal de Bob
INSERT INTO subscriptions (user_id, channel_id, subscription_date) VALUES
(2, 1, NOW()),
(3, 2, NOW());

-- Likes y dislikes de usuarios a videos
INSERT INTO video_likes_dislikes (video_id, user_id, like_dislike, timestamp) VALUES
(1, 2, 'like', NOW()),   
(2, 1, 'like', NOW()),   
(3, 2, 'dislike', NOW()); 

-- Playlists creadas por usuarios
INSERT INTO playlists (name, creation_date, status, user_id) VALUES
('Favoritos de Alice', NOW(), 'public', 1),
('Tutoriales útiles', NOW(), 'private', 2);

-- Añadir vídeos a las playlists
INSERT INTO playlist_videos (playlist_id, video_id) VALUES
(1, 3), 
(2, 2);  

-- Comentarios en vídeos
INSERT INTO comments (text, timestamp, video_id, user_id) VALUES
('¡Me encantó este vlog!', NOW(), 1, 2),
('Muy útil, gracias por compartir', NOW(), 2, 1),
('¡Este remix está brutal!', NOW(), 3, 1);

-- Likes y dislikes a comentarios
INSERT INTO comment_likes_dislikes (comment_id, user_id, like_dislike, timestamp) VALUES
(1, 1, 'like', NOW()),  
(2, 2, 'like', NOW());  
