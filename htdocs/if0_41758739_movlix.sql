-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql100.byetcluster.com
-- Generation Time: Apr 26, 2026 at 06:57 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41758739_movlix`
--

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `ID_Genre` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`ID_Genre`, `Name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Sci-Fi'),
(7, 'Adventure'),
(8, 'Animation'),
(10, 'Crime'),
(11, 'Documentary'),
(13, 'Fantasy'),
(15, 'Mystery'),
(16, 'Romance'),
(18, 'Thriller'),
(19, 'Musical');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `ID_Movies` int(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Genre_id` int(11) NOT NULL,
  `Release_year` int(11) NOT NULL,
  `Poster_url` text NOT NULL,
  `Description` text NOT NULL,
  `Trailer_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`ID_Movies`, `Title`, `Genre_id`, `Release_year`, `Poster_url`, `Description`, `Trailer_url`) VALUES
(21, 'Colorful Stage! The Movie: A Miku Who Cant Sing', 19, 2025, '/public/uploads/posters/684982597f575.JPG', 'Teen musician Ichika encounters virtual singer Hatsune Miku in Shibuya. They collaborate to help Miku create emotional music and form deeper connections.', 'https://www.youtube.com/watch?v=3bD1dfiRMu4'),
(25, 'Twilight of the Gods', 1, 2024, '/public/uploads/posters/6848d9cb38b55.jpg', 'Twilight of the Gods is an adult animated action-fantasy series created by Zack Snyder. It reimagines Norse mythology in a dark and epic style, following mortals who rise up against powerful gods. The story is packed with revenge, war, and mythical power struggles.', 'https://www.youtube.com/watch?v=xyFKgPpdYdc'),
(30, 'From the World of John Wick: Ballerina', 18, 2025, '/public/uploads/posters/684983055850b.JPG', 'Eve (Ana de Armas) an assassin trained in the traditions of the Ruska Roma organization sets out to seek revenge after the death of her father.', 'https://www.youtube.com/watch?v=yNN2PoilSp4'),
(57, 'Apex', 1, 2026, '/public/uploads/posters/ba3c29ff9d66669049ef4fd0d920083d.jpg', 'A mountain climber haunted by a fatal decision in Norway retreats to the Australian wilderness for isolation. Her journey turns into a desperate hunt when a deceptive local targets her as his next ritualistic prey in the bush.', 'https://www.youtube.com/watch?v=kgv8jf_8dm0'),
(58, 'The Wrecking Crew', 2, 2026, '/public/uploads/posters/f60bc74f82880aacfcf8661506cd3a8d.jpeg', 'Estranged half-brothers Jonny and James reunite after their father&#039;s mysterious death. As they search for the truth, buried secrets reveal a conspiracy threatening to tear their family apart.', 'https://www.youtube.com/watch?v=D7oUW5837Tc'),
(59, 'War Machine', 5, 2026, '/public/uploads/posters/6c25a501c0d3d93e9a888a4f751b5196.jpg', 'War Machine is a 2026 military science fiction action film directed, co-produced, and co-written by Patrick Hughes. It stars Alan Ritchson, Dennis Quaid, Stephan James, Jai Courtney, Esai Morales, Keiynan Lonsdale, and Daniel Webber.', 'https://www.youtube.com/watch?v=AFuE1LRxm80'),
(60, 'Mercy', 18, 2026, '/public/uploads/posters/eb44193642b9741a3c8f324681ecccab.jpg', 'In the near future, an advanced AI judge tells a captive detective that he&#039;s on trial for the murder of his wife. If he fails to prove his innocence within 90 minutes, he&#039;ll be executed on the spot.', 'https://www.youtube.com/watch?v=dSS4yqd0x6o'),
(61, 'A Letter to My Youth', 3, 2026, '/public/uploads/posters/131fc294664e5df85abba63bb1ed1a9b.jpg', 'A rebellious teen and a reserved caretaker form an unlikely bond in an orphanage as they come to terms with their painful pasts.', 'https://www.youtube.com/watch?v=tmfnaXhkEoI'),
(62, 'The Bluff', 7, 2026, '/public/uploads/posters/5daed88d3eeb89320d05f4b3f26bb492.jpg', 'A Caribbean woman gets her secret past revealed when her island is invaded by vicious buccaneers.', 'https://www.youtube.com/watch?v=uUYMqRjNxhM'),
(63, 'The Rip', 10, 2026, '/public/uploads/posters/c39d7d9b208de0253a1d16c821729daa.jpg', 'Finding a secret stash of millions wages internal conflict for a group of Miami officers, pushing trust, loyalty and self-preservation into sharp and dangerous focus.', 'https://www.youtube.com/watch?v=yeR5bcbRPak'),
(64, 'Kang Solah from Kang Mak x Nenek Gayung Film', 4, 2026, '/public/uploads/posters/00a61f79447053619add2ede1101e3fc.jpg', 'Kang Solah from Kang Mak x Nenek Gayung adalah film horor komedi Indonesia tahun 2025 yang disutradarai oleh Herwin Novianto dan ditulis oleh Alim Sudio. Film ini merupakan sempalan dari Kang Mak from Pee Mak, dibintangi oleh Rigen Rakelna, Indra Jegel, dan Indro Warkop.', 'https://www.youtube.com/watch?v=_whx17yPW0E'),
(65, 'Skyscraper Live', 11, 2026, '/public/uploads/posters/dcca52d71316e22e09430cb9dae857b1.jpg', 'Free solo climber Alex Honnold attempts to ascend one of the planet&#039;s tallest skyscrapers in an event from Taipei, Taiwan.', 'https://www.youtube.com/watch?v=ZXiEp_GGSpg'),
(66, 'Cosmic Princess Kaguya!', 8, 2026, '/public/uploads/posters/e25709dce4e3443393a566a85d850433.jpg', 'Iroha&#039;s life gets knocked off its orbit when Kaguya, a carefree runaway from the Moon, moves in and convinces her to perform in a virtual world together.', 'https://www.youtube.com/watch?v=KAXwdY3ei7c');

-- --------------------------------------------------------

--
-- Table structure for table `profile_pictures`
--

CREATE TABLE `profile_pictures` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ID_Review` int(10) NOT NULL,
  `ID_User` int(10) NOT NULL,
  `ID_Movie` int(10) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Comment` text NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ID_Review`, `ID_User`, `ID_Movie`, `Rating`, `Comment`, `Created_at`) VALUES
(3, 12, 21, 5, 'film sangat menarik', '2025-06-05 02:59:17'),
(18, 16, 21, 5, 'film nya baguss', '2025-06-11 07:46:23'),
(30, 12, 30, 5, 'keren ey', '2025-06-17 13:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID_User` int(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` enum('Admin','User') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_pictures` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID_User`, `Username`, `Email`, `Password`, `Role`, `Created_at`, `profile_pictures`) VALUES
(10, 'eji', 'ejieji@gmail.com', '$2y$10$3qbckVisN2E4HkpNcR6dvOkx2Q4fafmc2LXHGdKslMQgyTgQPoI.y', 'Admin', '2025-05-21 06:49:35', ''),
(11, 'Fahry', 'adryansyah.fahry@gmail.com', '$2y$10$oD62qjgpN3zOxkPVBpDuV.pbUtY3oF0PSC5UXq7grmj8ilCiKG/Mu', 'User', '2025-05-21 07:28:27', ''),
(12, 'ezi', '1234567@gmail.com', '$2y$10$CIEcz2/7AXRT0YDojrvGeeua8X2QPbIB5IIurd99EHs677MxJTSKq', 'User', '2025-06-04 17:40:55', ''),
(13, 'udin bos', 'karismatikbob@gmail.com', '$2y$10$hUK2YIK8//0sZ7RLfy4Hjegd9jOw63KhmeARNjiHDLRt6B6NENJva', 'User', '2025-06-05 09:14:49', ''),
(14, 'ahmad', 'ahmad@gmail.com', '$2y$10$I900oQ999Hv.DTkuabE3x.PWujxxJo2p0qE43zDyak/3VMndWl21i', 'User', '2025-06-05 10:35:32', ''),
(15, 'bagas', 'bagas@gmail.com', '$2y$10$QNoiu7lw19SkAOULtumnwem3JOBWMZbvwPx/eFppFFy47ixfVSWG.', 'User', '2025-06-09 08:58:48', ''),
(16, 'hamdan', 'hamdan123@gmail.com', '$2y$10$U5SjSUOUMKaxVY5uBgpOa.WEmb1HBqLEe1cj7nOcZwjT4BM3I8s7i', 'User', '2025-06-11 07:45:52', ''),
(17, 'asep', 'asep@gmail.com', '$2y$10$ESpVGtmlCQvU6r5UtOEg1uY/hiJJ0sdWVtxyHIBO1bN/wO4HLls3y', 'User', '2025-06-14 13:21:36', ''),
(18, 'Admin', 'admin@gmail.com', '$2y$10$Cx3SwHOyFmiUjGm9kDVhP./pK.tZnE9qLugIGSsZ/zUsX60stwAVu', 'Admin', '2025-06-17 05:48:54', ''),
(19, 'naja', 'naja@gmail.com', '$2y$10$H/KWyMkEpdT6HpT/d6gAA.KDdWwaRbFEiU.3FVgtt5lCLr2rHl6em', 'User', '2025-06-17 14:07:23', ''),
(20, 'naja eji fahry', '123@gmail.com', '$2y$10$P0eDyJowCdi1xE9R/GJpM.Avx8xbm0cVX0QrD93xRKAf9YZNyKhnC', 'User', '2025-06-18 07:37:29', ''),
(21, 'yunisa', 'yunisanafida2@gmail.com', '$2y$10$JgfPX7faIoMYl/kkPoUkbO9e9fVmQLVW6zPleBgOxgJbvSoNRX0g2', 'User', '2025-06-18 07:48:10', ''),
(22, 'dea_destiani', 'deadestiani19@gmail.com', '$2y$10$JbGktXsBxsSysf6T6ajXAehvhgU0ZPskOqQSd1PszHqz0XMO0q8z6', 'User', '2025-06-18 07:48:11', ''),
(23, 'nsrnaazhra_', 'nisrinaazahra96@gmail.com', '$2y$10$9ATmPTf7R3Yla5af5RQg.eWl24XOzMo1da2fUpoqO6qcTEU1IZti.', 'User', '2025-06-18 07:48:14', ''),
(24, 'mamang', 'rfflsy@mail.com', '$2y$10$1k2ocR1hTM4MnJUl7azeK.7bEOMk9F/c.aZMEKiLgbcOxbs4CEF9a', 'User', '2025-06-19 16:50:29', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`ID_Movies`),
  ADD KEY `idx_movie_title` (`Title`),
  ADD KEY `fk_movies_genres` (`Genre_id`);

--
-- Indexes for table `profile_pictures`
--
ALTER TABLE `profile_pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ID_Review`),
  ADD KEY `idx_review_movie` (`ID_Movie`),
  ADD KEY `idx_review_user` (`ID_User`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_User`),
  ADD KEY `idx_user_email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `ID_Genre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `ID_Movies` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `profile_pictures`
--
ALTER TABLE `profile_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ID_Review` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID_User` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_genre` FOREIGN KEY (`Genre_id`) REFERENCES `genres` (`ID_Genre`),
  ADD CONSTRAINT `fk_movies_genres` FOREIGN KEY (`Genre_id`) REFERENCES `genres` (`ID_Genre`);

--
-- Constraints for table `profile_pictures`
--
ALTER TABLE `profile_pictures`
  ADD CONSTRAINT `profile_pictures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID_User`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_movie` FOREIGN KEY (`ID_Movie`) REFERENCES `movies` (`ID_Movies`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID_User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
