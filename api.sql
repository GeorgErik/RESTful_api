-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Jaan 21, 2019 kell 03:32 PL
-- Serveri versioon: 10.1.36-MariaDB
-- PHP versioon: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `api`
--

DELIMITER $$
--
-- Funktsioonid
--
CREATE DEFINER=`root`@`localhost` FUNCTION `LEVENSHTEIN` (`s1` VARCHAR(255) CHARACTER SET utf8, `s2` VARCHAR(255) CHARACTER SET utf8) RETURNS INT(11) BEGIN
    DECLARE s1_len, s2_len, i, j, c, c_temp, cost INT;
    DECLARE s1_char CHAR CHARACTER SET utf8;
    
    DECLARE cv0, cv1 VARBINARY(256);

    SET s1_len = CHAR_LENGTH(s1),
        s2_len = CHAR_LENGTH(s2),
        cv1 = 0x00,
        j = 1,
        i = 1,
        c = 0;

    IF (s1 = s2) THEN
      RETURN (0);
    ELSEIF (s1_len = 0) THEN
      RETURN (s2_len);
    ELSEIF (s2_len = 0) THEN
      RETURN (s1_len);
    END IF;

    WHILE (j <= s2_len) DO
      SET cv1 = CONCAT(cv1, CHAR(j)),
          j = j + 1;
    END WHILE;

    WHILE (i <= s1_len) DO
      SET s1_char = SUBSTRING(s1, i, 1),
          c = i,
          cv0 = CHAR(i),
          j = 1;

      WHILE (j <= s2_len) DO
        SET c = c + 1,
            cost = IF(s1_char = SUBSTRING(s2, j, 1), 0, 1);

        SET c_temp = ORD(SUBSTRING(cv1, j, 1)) + cost;
        IF (c > c_temp) THEN
          SET c = c_temp;
        END IF;

        SET c_temp = ORD(SUBSTRING(cv1, j+1, 1)) + 1;
        IF (c > c_temp) THEN
          SET c = c_temp;
        END IF;

        SET cv0 = CONCAT(cv0, CHAR(c)),
            j = j + 1;
      END WHILE;

      SET cv1 = cv0,
          i = i + 1;
    END WHILE;

    RETURN (c);
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_01_08_114319_create_words_table', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `words`
--

CREATE TABLE `words` (
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `words`
--

INSERT INTO `words` (`id`, `word`) VALUES
(1, 'late'),
(2, 'ignite'),
(3, 'cupboard'),
(4, 'fare'),
(5, 'stock'),
(6, 'speed'),
(7, 'lonely'),
(8, 'comfort'),
(9, 'departure'),
(10, 'location'),
(11, 'fist'),
(12, 'excess'),
(13, 'respectable'),
(14, 'rumor'),
(15, 'real'),
(16, 'distinct'),
(17, 'feature'),
(18, 'fantasy'),
(19, 'flawed'),
(20, 'established'),
(21, 'craftsman'),
(22, 'rear'),
(23, 'prosecution'),
(24, 'march'),
(25, 'love'),
(26, 'complete'),
(27, 'suntan'),
(28, 'dictionary'),
(29, 'available'),
(30, 'freeze'),
(31, 'hero'),
(32, 'solid'),
(33, 'symptom'),
(34, 'allocation'),
(35, 'allocation'),
(36, 'sword'),
(37, 'future'),
(38, 'sign'),
(39, 'sale'),
(40, 'accountant'),
(41, 'different'),
(42, 'employee'),
(43, 'horseshoe'),
(44, 'decade'),
(45, 'qualify'),
(46, 'threshold'),
(47, 'change'),
(48, 'struggle'),
(49, 'attitude'),
(50, 'middle'),
(51, 'brush'),
(52, 'encourage'),
(53, 'trustee'),
(54, 'attack'),
(55, 'agenda'),
(56, 'need'),
(57, 'coverage'),
(58, 'pray'),
(59, 'knee'),
(60, 'sample'),
(61, 'deputy'),
(62, 'smash'),
(63, 'displace'),
(64, 'screw'),
(65, 'meaning'),
(66, 'shortage'),
(67, 'rational'),
(68, 'tablet'),
(69, 'visible'),
(70, 'grant'),
(71, 'short'),
(72, 'crutch'),
(73, 'floor'),
(74, 'tense'),
(75, 'composer'),
(76, 'differ'),
(77, 'television'),
(78, 'ground'),
(79, 'scratch'),
(80, 'sharp'),
(81, 'gaffe'),
(82, 'revolutionary'),
(83, 'irony'),
(84, 'bean'),
(85, 'gasp'),
(86, 'week'),
(87, 'twin'),
(88, 'machinery'),
(89, 'chance'),
(90, 'rent'),
(91, 'still'),
(92, 'example'),
(93, 'replacement'),
(94, 'major'),
(95, 'language'),
(96, 'humanity'),
(97, 'traction'),
(98, 'proportion'),
(99, 'timetable'),
(100, 'export');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `words`
--
ALTER TABLE `words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
