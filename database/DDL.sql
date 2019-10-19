CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    role INT DEFAULT 1
);
INSERT INTO users VALUES (0, 'system', '', 'System', 10);

CREATE TABLE stars (
    star_id SERIAL PRIMARY KEY,
    user_id int REFERENCES users(user_id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL DEFAULT 'My Star',
    radius float NOT NULL,
    mass float NOT NULL,
    temp float NOT NULL,
    chz float NOT NULL -- зона обитаемости
);

CREATE TABLE planets (
    planet_id SERIAL PRIMARY KEY,
    star_id  int REFERENCES stars(star_id) ON DELETE CASCADE,
    radius float NOT NULL,
    mass float NOT NULL,
    orbit float NOT NULL,
    ms float NOT NULL, -- movment speed по орбите
    rs float NOT NULL, -- rotation speed самой планты
    angle float NOT NULL, -- наклон оси вращения
    ad float NOT NULL -- atmospheric density
);