-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 08 mars 2020 à 15:59
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `parcvoitures`
--

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `libelle`) VALUES
(3, 'Yotota'),
(4, 'Jeupo');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200212065106', '2020-02-12 06:51:44'),
('20200213193104', '2020-02-13 19:31:37');

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

CREATE TABLE `modele` (
  `id` int(11) NOT NULL,
  `marque_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_moyen` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`id`, `marque_id`, `libelle`, `prix_moyen`, `image`) VALUES
(6, 3, '001', 15000, 'modele1.jpg'),
(7, 3, '002', 20000, 'modele2.jpg'),
(8, 4, '003', 14000, 'modele3.jpg'),
(9, 4, '004', 1500, 'modele4.jpg'),
(10, 3, '005', 1600, 'modele5.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `password`, `roles`) VALUES
(2, 'Hamza', '$argon2id$v=19$m=65536,t=4,p=1$S093eGNvSE1OZHhKSXhvbQ$l8JgxjCwDs6oP5n2WOuqgTqARBZz9mutRCgICg2Hwjc', 'ROLE_USER'),
(3, 'Zaham', '$argon2id$v=19$m=65536,t=4,p=1$YXhCZThJS1VZNzJOQldyLw$I6b6TsBgdxo7d9RQ0qs90fwPbP5cXTFeUiXPXVsRLFw', 'ROLE_USER'),
(4, 'pac', '$argon2id$v=19$m=65536,t=4,p=1$eDJrdnA2WG1tejh0MlZvZA$ZBCQtsNn2XAx4hYXyzJ0qpfyf+KvsLprTR6C00T/njU', 'ROLE_USER'),
(5, 'tupac', '$argon2id$v=19$m=65536,t=4,p=1$Lk9hUlQ4RFJFYXZQLnY1Rw$s41h5G4V2N+0/9ECqnktuHTjAaTKKSJ9N9b7Is5TzNQ', 'ROLE_USER'),
(6, 'benhamzaah', '$argon2id$v=19$m=65536,t=4,p=1$TFR1d3hEbld4c0E3VzBFWg$pmuAa0I2X7dODPmgAvv1d5MNEHFr4mKGdSW2Mm0KePI', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id` int(11) NOT NULL,
  `modele_id` int(11) DEFAULT NULL,
  `immatriculation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_portes` int(11) NOT NULL,
  `annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `modele_id`, `immatriculation`, `nb_portes`, `annee`) VALUES
(1, 6, 'NT9265ZP', 3, 1990),
(2, 6, 'YN832Jk', 3, 1993),
(3, 6, 'HQ035YT', 5, 2018),
(4, 7, 'JV688FP', 5, 2019),
(5, 7, 'MZ763FX', 5, 2002),
(6, 7, 'TE207KQ', 3, 1994),
(7, 7, 'HW4716VB', 5, 1994),
(8, 8, 'XV331OL', 3, 2017),
(9, 8, 'RW7757JT', 3, 2011),
(10, 8, 'XZ315AH', 5, 2015),
(11, 8, 'WF024WX', 5, 1995),
(12, 9, 'FB3600AB', 3, 2007),
(13, 9, 'BS4119NW', 3, 2008),
(14, 9, 'WZ419BF', 5, 2015),
(15, 10, 'TS833CL', 5, 2008),
(16, 10, 'OO379QD', 5, 2003),
(17, 10, 'TO586PM', 5, 2011),
(18, 10, 'OR581UK', 3, 1990),
(19, 10, 'CR111CS', 3, 1993);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_100285584827B9B2` (`marque_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E9E2810FAC14B70A` (`modele_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `modele`
--
ALTER TABLE `modele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `modele`
--
ALTER TABLE `modele`
  ADD CONSTRAINT `FK_100285584827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `FK_E9E2810FAC14B70A` FOREIGN KEY (`modele_id`) REFERENCES `modele` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
