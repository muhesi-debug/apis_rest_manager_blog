CREATE DATABASE manager_blog;
USE manager_blog;
CREATE TABLE bloger(
    idBloger int PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    postnom VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    adresse TEXT,
    profil TEXT);
CREATE TABLE postes(
    idPostes int PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(250) NOT NULL,
    contenus TEXT NOT NULL,
    bloger INT,
    CONSTRAINT fk_bloger_postes FOREIGN KEY(bloger) REFERENCES bloger(idBloger) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE jointe_postes(
    idJointe INT PRIMARY KEY AUTO_INCREMENT,
    nomJointe TEXT,
    postes INT,
    CONSTRAINT fk_postes_jointe FOREIGN KEY(postes) REFERENCES postes(idPostes) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE responses(
    idResponse INT PRIMARY KEY AUTO_INCREMENT,
    contenus TEXT,
    postes INT,
    bloger INT,
    CONSTRAINT fk_postes_responses FOREIGN KEY(postes) REFERENCES postes(idPostes) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_bloger_responses FOREIGN KEY(bloger) REFERENCES bloger(idBloger) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE message_Chat(
    idChat INT PRIMARY KEY AUTO_INCREMENT,
    contenus TEXT,
    sender INT,
    recever INT,
    CONSTRAINT fk_sender_message_chat FOREIGN KEY(sender) REFERENCES bloger(idBloger) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_recever_message_chat FOREIGN KEY(recever) REFERENCES bloger(idBloger) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE piece_jointe(
    idPiece INT PRIMARY KEY AUTO_INCREMENT,
    nom TEXT,
    chat INT,
    CONSTRAINT fk_jointe_message_caht FOREIGN KEY(chat) REFERENCES message_Chat(idChat) ON UPDATE CASCADE ON DELETE CASCADE);