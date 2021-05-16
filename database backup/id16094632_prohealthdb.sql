-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2021 at 09:18 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16094632_prohealthdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `DietLogs`
--

CREATE TABLE `DietLogs` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL COMMENT 'The date the user has eaten the food.',
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name of the food.',
  `Description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The description of the food. How it was cooked and prepared, and quantity.',
  `Calories` int(11) NOT NULL COMMENT 'How many calories is in the food.',
  `Meal` int(1) NOT NULL COMMENT '1 is Breakfast, 2 is Lunch, 3 is Dinner, 4 is Snacks'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExercisePlans`
--

CREATE TABLE `ExercisePlans` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT ' The user that this exercise plan was created by.',
  `ExercisePlan_ID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The exercise plan''s unique identifier.',
  `NumberOfDays` int(3) NOT NULL COMMENT 'How many days is in this exercise plan?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains all exercise plans.';

-- --------------------------------------------------------

--
-- Table structure for table `Exercises`
--

CREATE TABLE `Exercises` (
  `ExercisePlan_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The exercise plan''s ID that this exercise is a part of.',
  `ExerciseName` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of exercise.',
  `ExerciseDescription` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of exercise.',
  `DayOfExercise` int(3) NOT NULL COMMENT 'What day in the exercise plan is this for?',
  `Intensity` tinyint(1) NOT NULL COMMENT 'The intended intensity of the exercise. 1 is low, 2 is medium, 3 is high.',
  `Time` time NOT NULL COMMENT 'The ideal amount of time spent on the exercise.',
  `Weight` int(3) DEFAULT NULL COMMENT 'The ideal amount of weight used. (If applicable)',
  `Sets` int(2) DEFAULT NULL COMMENT 'The ideal amount of sets in the exercise (if applicable).',
  `Repititions` int(2) DEFAULT NULL COMMENT 'The ideal amount of repititions in the exercise (if applicable).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains all exercises that belong to exercise plans.';

-- --------------------------------------------------------

--
-- Table structure for table `LoggedExercises`
--

CREATE TABLE `LoggedExercises` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The user who completed this exercise.',
  `ExerciseName` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name of the logged exercise.',
  `Date` date NOT NULL COMMENT 'The date of the completed exercise.',
  `Intensity` tinyint(1) NOT NULL COMMENT 'The intensity of the logged exercise. 1 is low, 2 is medium, 3 is high.',
  `Time` time NOT NULL COMMENT 'The time spent on the exercise.',
  `Weight` int(3) DEFAULT NULL COMMENT 'The weight used in the exercise (if applicable).',
  `Sets` int(2) DEFAULT NULL COMMENT 'The sets performed in the exercise (if applicable).',
  `Reps` int(2) DEFAULT NULL COMMENT 'The repititions performed per set in the exercise (if applicable).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains all logged exercises';

-- --------------------------------------------------------

--
-- Table structure for table `NutritionPlans`
--

CREATE TABLE `NutritionPlans` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The user who is creating the nutrition plan.',
  `NutritionPlan_ID` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The nutrition plan''s unique identifier.',
  `NumberOfDays` int(3) NOT NULL COMMENT 'The number of days in this nutrition plan.',
  `Breakfast` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A JSON containing the list of foods that the user may eat at breakfast.',
  `Lunch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A JSON containing the list of food the user may eat at lunch.',
  `Dinner` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A JSON containing the foods that the user may eat at dinner.',
  `Snacks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'A JSON containing the foods that the user may eat for snacks..',
  `Calories` int(4) NOT NULL COMMENT 'The target amount of calories to intake per day.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains all the nutrition plans.';

-- --------------------------------------------------------

--
-- Table structure for table `SocialMessages`
--

CREATE TABLE `SocialMessages` (
  `Sender_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The sender''s user ID.',
  `Recipient_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The recipient''s user ID.',
  `Content` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'The content of the message.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains all messages that have been sent.';

-- --------------------------------------------------------

--
-- Table structure for table `SocialPosts`
--

CREATE TABLE `SocialPosts` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The posting user''s ID.',
  `Content` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'The content of the post.',
  `ExercisePlan_ID` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The user may link an exercise plan.',
  `NutritionPlan_ID` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The user may link a nutrition plan.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains all posts that have been made.';

-- --------------------------------------------------------

--
-- Table structure for table `UserHealthInfo`
--

CREATE TABLE `UserHealthInfo` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Age` int(3) NOT NULL COMMENT 'The age of the user.',
  `Weight` int(3) NOT NULL COMMENT 'The weight of the user in pounds.',
  `BMI` int(2) NOT NULL COMMENT 'The BMI of the user.',
  `ExerciseScore` int(2) NOT NULL COMMENT 'The exercise score of the user. Calculated from what the user has logged. Ranges from 0 to 99.',
  `NutritionScore` int(2) NOT NULL COMMENT 'The nutrition score of the user. Calculated from what the user has logged. Ranges from 0 to 99.',
  `MentalScore` int(2) NOT NULL COMMENT 'The mental health score of the user. Calculated from what the user has logged. Ranges from 0 to 99.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The health information for all users.';

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The user''s unique identifier.',
  `FirstName` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The user''s username. Only used for login purposes.',
  `Password` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The user''s password. Only used for login purposes.',
  `Phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The user''s phone number. This is optional.',
  `Email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The user''s email address. This is optional.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps track of all users.';

-- --------------------------------------------------------

--
-- Table structure for table `UserSettings`
--

CREATE TABLE `UserSettings` (
  `User_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PrivacySetting` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Defines the user''s privacy setting when it comes to sharing contact information. Enabled by default.',
  `EnableDM` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Checks if the user would like to receive direct messages.',
  `EnablePosts` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Checks if the user would like to see and create posts.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains all of the user''s settings.';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DietLogs`
--
ALTER TABLE `DietLogs`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `ExercisePlans`
--
ALTER TABLE `ExercisePlans`
  ADD PRIMARY KEY (`ExercisePlan_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Exercises`
--
ALTER TABLE `Exercises`
  ADD KEY `ExercisePlan_ID` (`ExercisePlan_ID`);

--
-- Indexes for table `LoggedExercises`
--
ALTER TABLE `LoggedExercises`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `NutritionPlans`
--
ALTER TABLE `NutritionPlans`
  ADD PRIMARY KEY (`NutritionPlan_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `SocialMessages`
--
ALTER TABLE `SocialMessages`
  ADD KEY `Sender_ID` (`Sender_ID`),
  ADD KEY `Recipient_ID` (`Recipient_ID`);

--
-- Indexes for table `SocialPosts`
--
ALTER TABLE `SocialPosts`
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `NutritionPlan_ID` (`NutritionPlan_ID`),
  ADD KEY `ExercisePlan_ID` (`ExercisePlan_ID`);

--
-- Indexes for table `UserHealthInfo`
--
ALTER TABLE `UserHealthInfo`
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `UserSettings`
--
ALTER TABLE `UserSettings`
  ADD KEY `User_ID` (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DietLogs`
--
ALTER TABLE `DietLogs`
  ADD CONSTRAINT `DietLogs_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `ExercisePlans`
--
ALTER TABLE `ExercisePlans`
  ADD CONSTRAINT `ExercisePlans_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `Exercises`
--
ALTER TABLE `Exercises`
  ADD CONSTRAINT `Exercises_ibfk_1` FOREIGN KEY (`ExercisePlan_ID`) REFERENCES `ExercisePlans` (`ExercisePlan_ID`);

--
-- Constraints for table `LoggedExercises`
--
ALTER TABLE `LoggedExercises`
  ADD CONSTRAINT `LoggedExercises_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `NutritionPlans`
--
ALTER TABLE `NutritionPlans`
  ADD CONSTRAINT `NutritionPlans_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `SocialMessages`
--
ALTER TABLE `SocialMessages`
  ADD CONSTRAINT `SocialMessages_ibfk_1` FOREIGN KEY (`Sender_ID`) REFERENCES `Users` (`User_ID`),
  ADD CONSTRAINT `SocialMessages_ibfk_2` FOREIGN KEY (`Recipient_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `SocialPosts`
--
ALTER TABLE `SocialPosts`
  ADD CONSTRAINT `SocialPosts_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`),
  ADD CONSTRAINT `SocialPosts_ibfk_2` FOREIGN KEY (`NutritionPlan_ID`) REFERENCES `NutritionPlans` (`NutritionPlan_ID`),
  ADD CONSTRAINT `SocialPosts_ibfk_3` FOREIGN KEY (`ExercisePlan_ID`) REFERENCES `ExercisePlans` (`ExercisePlan_ID`);

--
-- Constraints for table `UserHealthInfo`
--
ALTER TABLE `UserHealthInfo`
  ADD CONSTRAINT `UserHealthInfo_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `UserSettings`
--
ALTER TABLE `UserSettings`
  ADD CONSTRAINT `UserSettings_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
