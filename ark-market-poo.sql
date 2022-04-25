-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 06 avr. 2022 à 18:09
-- Version du serveur :  5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ark-market-poo`
--

-- --------------------------------------------------------

--
-- Structure de la table `armor`
--

DROP TABLE IF EXISTS `armor`;
CREATE TABLE IF NOT EXISTS `armor` (
  `id_armor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('objet','plan','deux') NOT NULL DEFAULT 'objet',
  `category` enum('tissu','cuir','fourrure','désert','camouflage','chitine','métal','radiation','plongée','émeute','tek') NOT NULL,
  `quality` enum('commun','inhabituel','rare','épique','légendaire','mythique') NOT NULL,
  `armor` smallint(5) UNSIGNED NOT NULL,
  `cold` smallint(5) UNSIGNED NOT NULL,
  `heat` smallint(5) UNSIGNED NOT NULL,
  `durability` smallint(5) UNSIGNED DEFAULT NULL,
  `price1` varchar(30) DEFAULT NULL COMMENT 'Prix objet',
  `price2` varchar(30) DEFAULT NULL COMMENT 'prix plan',
  `money` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_armor`),
  KEY `id_serveur` (`id_server`),
  KEY `id_utilisateur` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `armor`
--

INSERT INTO `armor` (`id_armor`, `name`, `type`, `category`, `quality`, `armor`, `cold`, `heat`, `durability`, `price1`, `price2`, `money`, `description`, `date_creation`, `id_server`, `id_user`) VALUES
(19, 'Veste de camouflage', 'objet', 'camouflage', 'commun', 153, 15, 153, 45, '123', '456', 'argent', '', '2022-03-31 08:55:36', 1, 21),
(24, 'Foulard en tissu', 'objet', 'tissu', 'inhabituel', 45, 846, 46, 46, '', '465', '42', '', '2022-03-31 09:09:02', 1, 21),
(25, 'Veste anti-émeute', 'objet', 'émeute', 'rare', 543, 84, 43, 54, '543', '453', 'Or', '42425542', '2022-03-31 09:09:02', 1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `creature`
--

DROP TABLE IF EXISTS `creature`;
CREATE TABLE IF NOT EXISTS `creature` (
  `id_creature` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` enum('aérien','aquatique','terrestre') NOT NULL DEFAULT 'terrestre',
  `sexe` varchar(30) NOT NULL,
  `level` smallint(5) UNSIGNED NOT NULL,
  `life` varchar(7) DEFAULT NULL,
  `energy` varchar(7) DEFAULT NULL,
  `oxygene` varchar(7) DEFAULT NULL,
  `food` varchar(7) DEFAULT NULL,
  `weight` varchar(7) DEFAULT NULL,
  `attack` varchar(7) DEFAULT NULL,
  `speed` varchar(7) DEFAULT NULL,
  `price1` varchar(30) DEFAULT NULL,
  `money` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_creature`),
  KEY `id_utilisateur` (`id_user`),
  KEY `dino_ibfk_1` (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `creature`
--

INSERT INTO `creature` (`id_creature`, `name`, `category`, `sexe`, `level`, `life`, `energy`, `oxygene`, `food`, `weight`, `attack`, `speed`, `price1`, `money`, `description`, `date_creation`, `id_server`, `id_user`) VALUES
(39, 'Allosaure', 'terrestre', 'Mâle', 45, '123', '453', '135', '45543', '1233', '453', '5115', '452', '1235', NULL, '2022-03-31 09:18:56', 1, 21),
(40, 'Ptéranodon', 'aérien', 'Femelle', 253, '285', '8436', '45', '213', '78', NULL, NULL, '54', NULL, NULL, '2022-03-31 09:18:56', 1, 21),
(41, 'Mégalodon', 'aquatique', 'deux', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15315', NULL, NULL, '2022-03-31 09:20:12', 1, 21),
(42, 'Coelacanthe', 'aquatique', 'deux', 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:31:20', 1, 21),
(43, 'Argentavis', 'aérien', 'Femelle', 320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:31:20', 1, 21),
(44, 'Arthropleura', 'terrestre', 'Mâle', 256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:32:28', 1, 21),
(45, 'Harfang des neiges', 'aérien', 'deux', 156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:32:52', 1, 21),
(46, 'Beelzebufo', 'terrestre', 'Femelle', 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:32:52', 1, 21),
(47, 'Dilophosaure', 'terrestre', 'deux', 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:33:45', 1, 21),
(48, 'Vautour', 'aérien', 'Mâle', 242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:34:14', 1, 21),
(49, 'Plésiosaure', 'aquatique', '', 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 19:34:36', 1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `id_plan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price1` mediumint(8) UNSIGNED NOT NULL,
  `money` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_plan`),
  KEY `id_serveur` (`id_server`),
  KEY `id_utilisateur` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `quest`
--

DROP TABLE IF EXISTS `quest`;
CREATE TABLE IF NOT EXISTS `quest` (
  `id_quest` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price1` mediumint(8) UNSIGNED NOT NULL,
  `money` varchar(30) NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_quest`),
  KEY `id_serveur` (`id_server`),
  KEY `id_utilisateur` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `saddle`
--

DROP TABLE IF EXISTS `saddle`;
CREATE TABLE IF NOT EXISTS `saddle` (
  `id_saddle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('objet','plan','deux') NOT NULL DEFAULT 'objet',
  `category` enum('aérien','aquatique','terrestre') NOT NULL,
  `quality` enum('commun','inhabituel','rare','épique','légendaire','mythique') NOT NULL,
  `size` enum('selle','plateforme') NOT NULL,
  `armor` smallint(5) UNSIGNED NOT NULL,
  `price1` varchar(30) DEFAULT NULL COMMENT 'Prix objet',
  `price2` varchar(30) DEFAULT NULL COMMENT 'Prix plan',
  `money` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_saddle`),
  KEY `id_utilisateur` (`id_user`),
  KEY `selle_ibfk_1` (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `saddle`
--

INSERT INTO `saddle` (`id_saddle`, `name`, `type`, `category`, `quality`, `size`, `armor`, `price1`, `price2`, `money`, `description`, `date_creation`, `id_server`, `id_user`) VALUES
(1, 'Allosaure', 'objet', 'terrestre', 'commun', 'selle', 456, NULL, NULL, '', '', '2022-04-05 16:09:37', 1, 21),
(2, 'Mégalodon', 'plan', 'aquatique', 'inhabituel', 'plateforme', 85, NULL, NULL, '', '', '2022-04-05 16:10:53', 1, 21),
(3, 'Ptéranodon', 'deux', 'aérien', 'rare', 'selle', 96, NULL, NULL, '', '', '2022-04-05 16:11:38', 1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `server`
--

DROP TABLE IF EXISTS `server`;
CREATE TABLE IF NOT EXISTS `server` (
  `id_server` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `page_web` varchar(100) DEFAULT NULL,
  `page_ts` varchar(100) DEFAULT NULL COMMENT 'page top-serveurs',
  `page_discord` varchar(100) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `money` varchar(20) DEFAULT NULL COMMENT 'Uniquement si il y a un système de monnaie',
  `date_creation` date NOT NULL,
  PRIMARY KEY (`id_server`),
  UNIQUE KEY `nom_serveur` (`name`),
  UNIQUE KEY `image` (`image`),
  UNIQUE KEY `page_ts` (`page_ts`),
  UNIQUE KEY `page_web` (`page_web`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `server`
--

INSERT INTO `server` (`id_server`, `name`, `page_web`, `page_ts`, `page_discord`, `slogan`, `image`, `money`, `date_creation`) VALUES
(1, 'Les Royaumes Sacrés d\'Alcaya', 'https://top-serveurs.net/ark/fr-rpmap-hope-les-royaumes-sacres-dalcaya', 'https://top-serveurs.net/ark/fr-rpmap-hope-les-royaumes-sacres-dalcaya', 'https://discord.gg/ZSzxSQQ', NULL, NULL, 'Points', '2021-10-21'),
(2, 'Serveur deux', 'page_web@serveur2.com', 'page_ts@serveur2.com', NULL, NULL, NULL, NULL, '2021-10-21'),
(3, 'Serveur trois', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-25'),
(4, 'Serveur quatre', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-25');

-- --------------------------------------------------------

--
-- Structure de la table `server_account`
--

DROP TABLE IF EXISTS `server_account`;
CREATE TABLE IF NOT EXISTS `server_account` (
  `id_server_account` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_perso` varchar(40) NOT NULL,
  `name_tribe` varchar(50) DEFAULT NULL,
  `name_discord` varchar(40) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_server` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_server_account`),
  KEY `id_serveur` (`id_server`),
  KEY `info_perso_serveur_ibfk_2` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COMMENT='informations personnelles des joueurs par serveur';

--
-- Déchargement des données de la table `server_account`
--

INSERT INTO `server_account` (`id_server_account`, `name_perso`, `name_tribe`, `name_discord`, `date_creation`, `id_user`, `id_server`) VALUES
(41, 'Guix', 'tribu de Guix', 'guixDiscord', '2022-03-31 09:04:35', 21, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mail` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '2' COMMENT '1 = administrateur 2 = utilisateur',
  `date_creation` date NOT NULL,
  `id_server` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Serveur par défaut lors de la connexion au site',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `mail` (`mail`),
  KEY `utilisateur_ibfk_1` (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='Information concernant les utilisateur';

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `mail`, `password`, `status`, `date_creation`, `id_server`) VALUES
(21, 'admin@gmail.com', '$2y$10$nlwpb79nEQiglhYMKOcd/e5BGDxHkiIOEJoMwoFLb35a5oN8Jn.JK', '2', '2022-03-29', 1);

-- --------------------------------------------------------

--
-- Structure de la table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
CREATE TABLE IF NOT EXISTS `weapon` (
  `id_arme` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('objet','plan','deux') NOT NULL DEFAULT 'objet',
  `category` enum('outil','mêlée','bouclier','jet','feu','accessoire','explosif','piège','tourelle','tek') NOT NULL,
  `quality` enum('commun','inhabituel','rare','épique','légendaire','mythique') NOT NULL,
  `dammage` smallint(5) UNSIGNED NOT NULL,
  `price1` varchar(30) DEFAULT NULL COMMENT 'Prix objet',
  `price2` varchar(30) DEFAULT NULL COMMENT 'Prix plan',
  `money` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_server` smallint(5) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_arme`,`name`),
  KEY `id_serveur` (`id_server`),
  KEY `id_utilisateur` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `weapon`
--

INSERT INTO `weapon` (`id_arme`, `name`, `type`, `category`, `quality`, `dammage`, `price1`, `price2`, `money`, `description`, `date_creation`, `id_server`, `id_user`) VALUES
(3, 'Pioche en métal', 'objet', 'outil', 'commun', 5424, NULL, NULL, '', '', '2022-04-05 21:31:05', 1, 21),
(4, 'lance en métal', 'plan', 'mêlée', 'inhabituel', 452, NULL, NULL, '', '', '2022-04-05 21:31:05', 1, 21),
(5, 'arc', 'deux', 'jet', 'rare', 242, NULL, NULL, '', '', '2022-04-05 21:32:08', 1, 21);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `armor`
--
ALTER TABLE `armor`
  ADD CONSTRAINT `armor_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `armor_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `creature`
--
ALTER TABLE `creature`
  ADD CONSTRAINT `creature_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creature_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `plan_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `quest`
--
ALTER TABLE `quest`
  ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quest_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `saddle`
--
ALTER TABLE `saddle`
  ADD CONSTRAINT `saddle_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saddle_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `server_account`
--
ALTER TABLE `server_account`
  ADD CONSTRAINT `server_account_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `server_account_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `weapon`
--
ALTER TABLE `weapon`
  ADD CONSTRAINT `weapon_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `weapon_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
