-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 23 mai 2022 à 16:59
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `numero_de_rue` int(11) NOT NULL,
  `nom_de_rue` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `client_id`, `numero_de_rue`, `nom_de_rue`, `ville`, `code_postal`, `commentaire`) VALUES
(1, 2, 73, 'Ave NE, Medina', 'Washington', 98039, 'États-Unis'),
(2, 2, 47, 'N Elm Dr, Beverly Hills', 'California', 90210, 'États-Unis'),
(5, 2, 73, 'Hollywood Blvd, Los Angeles', 'Los Angeles', 90028, 'États-Unis'),
(6, 2, 98, 'Mulberry St ', 'New York', 10013, 'États-Unis');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utilisateur_id` (`utilisateur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `utilisateur_id`, `prenom`, `nom`, `telephone`) VALUES
(1, 1, 'Jeff', 'Bezos', '0567938401'),
(2, 2, 'Elon', 'Musk', '0674759219'),
(3, 7, 'Edward', 'Snowden', '0567849507');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `date_de_creation` datetime NOT NULL,
  `date_de_modification` datetime NOT NULL,
  `prix` int(11) NOT NULL,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`client_id`) USING BTREE,
  KEY `fk_livreur_id` (`livreur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `client_id`, `livreur_id`, `date_de_creation`, `date_de_modification`, `prix`, `statut`) VALUES
(1, 3, 1, '2022-05-23 12:52:31', '2022-05-23 12:52:31', 24, 'En cours'),
(2, 3, 1, '2022-05-23 12:52:31', '2022-05-23 12:52:31', 32, 'Livrée'),
(3, 1, 2, '2022-05-23 12:52:31', '2022-05-23 12:52:31', 12, 'En cours'),
(4, 2, 2, '2022-05-23 12:52:31', '2022-05-23 12:52:31', 45, 'En cours'),
(5, 3, 1, '2022-05-23 12:52:31', '2022-05-23 12:52:31', 21, 'Livrée');

-- --------------------------------------------------------

--
-- Structure de la table `coordonnee_bancaire`
--

DROP TABLE IF EXISTS `coordonnee_bancaire`;
CREATE TABLE IF NOT EXISTS `coordonnee_bancaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `date_de_validitee` date NOT NULL,
  `pictogramme` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `coordonnee_bancaire`
--

INSERT INTO `coordonnee_bancaire` (`id`, `client_id`, `nom`, `numero`, `date_de_validitee`, `pictogramme`) VALUES
(1, 3, 'Edward 1', '1111 2222 3333 4444', '2023-08-24', 267),
(2, 2, 'Elon 1', '1111 2222 3333 4444', '2024-02-17', 645),
(3, 3, 'Edward 2', '1111 2222 3333 4444', '2025-12-09', 117),
(4, 1, 'Jeff 1', '1111 2222 3333 4444', '2022-11-01', 941);

-- --------------------------------------------------------

--
-- Structure de la table `cuisinier`
--

DROP TABLE IF EXISTS `cuisinier`;
CREATE TABLE IF NOT EXISTS `cuisinier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utilisateur_id` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cuisinier`
--

INSERT INTO `cuisinier` (`id`, `utilisateur_id`, `nom`, `prenom`) VALUES
(1, 6, 'Mark', 'Zuckerberg'),
(2, 5, 'Larry', 'Page');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utilisateur_id` (`utilisateur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `utilisateur_id`, `nom`, `prenom`, `telephone`, `latitude`, `longitude`) VALUES
(1, 4, 'Cook', 'Tim', '0474829560', '34', '-116'),
(2, 3, 'Gates', 'Bill', '0462859501', '48', '-122'),
(3, 8, 'Cook', 'Tim', '0867395639', '46', '-129');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuisinier_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cuisinier_id` (`cuisinier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `cuisinier_id`, `nom`, `prix`, `description`) VALUES
(11, 2, 'Burger Vegan', 16, 'Un hamburger végan aux galettes de pommes de terre, pour les amoureux de la nature'),
(12, 1, 'Bière IPA', 5, 'Une bière blonde à l\'amertume marquée, composée de 3 houblons différents, sans gluten'),
(13, 2, 'Poké bowl au saumon', 14, 'Un plat aussi simple qu\'équilibré qui embellira votre journée'),
(14, 1, 'Curry de quinoa au lait de coco', 12, 'Un plat plein de saveur qui plaît beaucoup, tout en permettant de garder la ligne'),
(15, 2, 'Smoothies aux épinards', 9, 'Ce smoothie aux épinards est l’ultime boisson pour réparer la peau');

-- --------------------------------------------------------

--
-- Structure de la table `plat_commande`
--

DROP TABLE IF EXISTS `plat_commande`;
CREATE TABLE IF NOT EXISTS `plat_commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_id` (`commande_id`),
  KEY `fk_plat_id` (`plat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat_commande`
--

INSERT INTO `plat_commande` (`id`, `commande_id`, `plat_id`, `quantite`) VALUES
(1, 1, 11, 3),
(2, 2, 11, 4),
(3, 3, 13, 1),
(4, 1, 15, 2),
(5, 4, 15, 3),
(6, 1, 14, 2);

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

DROP TABLE IF EXISTS `stock_livreur`;
CREATE TABLE IF NOT EXISTS `stock_livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `livreur_id` (`livreur_id`),
  KEY `plat_id` (`plat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`id`, `plat_id`, `livreur_id`, `quantite`) VALUES
(27, 11, 3, 3),
(28, 14, 3, 1),
(29, 12, 3, 3),
(30, 15, 3, 4),
(31, 12, 1, 2),
(32, 11, 1, 3),
(33, 14, 1, 3),
(34, 15, 1, 1),
(35, 15, 2, 2),
(36, 11, 2, 3),
(37, 12, 2, 1),
(38, 14, 2, 2),
(39, 12, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `mot_de_passe`) VALUES
(1, 'jeffbezos@amazon.com', '123456'),
(2, 'elonmusk@spacex.com', '123456'),
(3, 'billgates@microsoft.com', '123456'),
(4, 'timcook@apple.com', '123456'),
(5, 'larrypage@gmail.com', '123456'),
(6, 'markzuckerberg@facebook.com', '123456'),
(7, 'edwardsnowden@cia.com', '123456'),
(8, 'stevejobs@apple.com', '123456');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `adresse_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `coordonnee_bancaire`
--
ALTER TABLE `coordonnee_bancaire`
  ADD CONSTRAINT `coordonnee_bancaire_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cuisinier`
--
ALTER TABLE `cuisinier`
  ADD CONSTRAINT `cuisinier_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`cuisinier_id`) REFERENCES `cuisinier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat_commande`
--
ALTER TABLE `plat_commande`
  ADD CONSTRAINT `plat_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plat_commande_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `stock_livreur_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_livreur_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
