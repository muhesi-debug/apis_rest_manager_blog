-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 02 fév. 2024 à 17:00
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `manager_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `bloger`
--

CREATE TABLE `bloger` (
  `idBloger` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `postnom` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `adresse` text,
  `profil` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `jointe_postes`
--

CREATE TABLE `jointe_postes` (
  `idJointe` int(11) NOT NULL,
  `nomJointe` text,
  `postes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message_chat`
--

CREATE TABLE `message_chat` (
  `idChat` int(11) NOT NULL,
  `contenus` text,
  `sender` int(11) DEFAULT NULL,
  `recever` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `piece_jointe`
--

CREATE TABLE `piece_jointe` (
  `idPiece` int(11) NOT NULL,
  `nom` text,
  `chat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

CREATE TABLE `postes` (
  `idPostes` int(11) NOT NULL,
  `titre` varchar(250) NOT NULL,
  `contenus` text NOT NULL,
  `bloger` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responses`
--

CREATE TABLE `responses` (
  `idResponse` int(11) NOT NULL,
  `contenus` text,
  `postes` int(11) DEFAULT NULL,
  `bloger` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bloger`
--
ALTER TABLE `bloger`
  ADD PRIMARY KEY (`idBloger`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Index pour la table `jointe_postes`
--
ALTER TABLE `jointe_postes`
  ADD PRIMARY KEY (`idJointe`),
  ADD KEY `fk_postes_jointe` (`postes`);

--
-- Index pour la table `message_chat`
--
ALTER TABLE `message_chat`
  ADD PRIMARY KEY (`idChat`),
  ADD KEY `fk_sender_message_chat` (`sender`),
  ADD KEY `fk_recever_message_chat` (`recever`);

--
-- Index pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  ADD PRIMARY KEY (`idPiece`),
  ADD KEY `fk_jointe_message_caht` (`chat`);

--
-- Index pour la table `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`idPostes`),
  ADD KEY `fk_bloger_postes` (`bloger`);

--
-- Index pour la table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`idResponse`),
  ADD KEY `fk_postes_responses` (`postes`),
  ADD KEY `fk_bloger_responses` (`bloger`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bloger`
--
ALTER TABLE `bloger`
  MODIFY `idBloger` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jointe_postes`
--
ALTER TABLE `jointe_postes`
  MODIFY `idJointe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message_chat`
--
ALTER TABLE `message_chat`
  MODIFY `idChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  MODIFY `idPiece` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `postes`
--
ALTER TABLE `postes`
  MODIFY `idPostes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responses`
--
ALTER TABLE `responses`
  MODIFY `idResponse` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `jointe_postes`
--
ALTER TABLE `jointe_postes`
  ADD CONSTRAINT `fk_postes_jointe` FOREIGN KEY (`postes`) REFERENCES `postes` (`idPostes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message_chat`
--
ALTER TABLE `message_chat`
  ADD CONSTRAINT `fk_recever_message_chat` FOREIGN KEY (`recever`) REFERENCES `bloger` (`idBloger`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sender_message_chat` FOREIGN KEY (`sender`) REFERENCES `bloger` (`idBloger`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  ADD CONSTRAINT `fk_jointe_message_caht` FOREIGN KEY (`chat`) REFERENCES `message_chat` (`idChat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `postes`
--
ALTER TABLE `postes`
  ADD CONSTRAINT `fk_bloger_postes` FOREIGN KEY (`bloger`) REFERENCES `bloger` (`idBloger`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `fk_bloger_responses` FOREIGN KEY (`bloger`) REFERENCES `bloger` (`idBloger`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_postes_responses` FOREIGN KEY (`postes`) REFERENCES `postes` (`idPostes`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
