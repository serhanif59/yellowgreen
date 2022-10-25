CREATE DATABASE IF NOT EXISTS bonheur_et_paillettes;

USE bonheur_et_paillettes;

CREATE TABLE
    IF NOT EXISTS user (
        id INT NOT NULL AUTO_INCREMENT,
        firstName VARCHAR(45) NOT NULL,
        lastName VARCHAR(45) NOT NULL,
        nickName VARCHAR(45) NOT NULL UNIQUE,
        email VARCHAR(45) NOT NULL UNIQUE,
        avatar VARCHAR(100) DEFAULT 'img_avatar.png',
        description VARCHAR(100),
        score INT DEFAULT 0,
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS unicorn(
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(45) NOT NULL UNIQUE,
        avatar VARCHAR(100),
        score INT DEFAULT 0,
        fights INT DEFAULT 0,
        wonFights INT DEFAULT 0,
        lostFights INT DEFAULT 0,
        koFights INT DEFAULT 0,
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS attack (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(45) NOT NULL UNIQUE,
        avatar VARCHAR(100),
        cost INT DEFAULT 0,
        gain INT DEFAULT 0,
        successRate INT DEFAULT 50,
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS unicorn_attack(
        unicorn_id INT NOT NULL,
        attack_id INT NOT NULL,
        INDEX uni_att (unicorn_id, attack_id),
        FOREIGN KEY (unicorn_Id) REFERENCES unicorn(id) ON DELETE CASCADE,
        FOREIGN KEY (attack_Id) REFERENCES attack(id) ON DELETE CASCADE
    );
