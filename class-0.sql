-- 1. Create database
CREATE DATABASE `students`;

-- 2. Switching to database
USE `students`;

-- 3. Create table majors
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `faculty` text NOT NULL
);

-- 4. Create table groups
DROP TABLE IF EXISTS `groups`
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `major_id` int(11) NOT NULL,
  FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`)
);

-- 5. Create table students
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `stipend` int unsigned NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` char NOT NULL,
  `group_id` int(11) NOT NULL,
  FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
);

-- 6. Add two items into majors table
INSERT INTO `majors` (`id`, `name`, `faculty`) VALUES
(1,	'theoretical_computer_science',	'computer_science_departament'),
(2,	'machine_learning',	'computer_science_department');

-- 7. Add five items into groups table
INSERT INTO `groups` (`id`, `name`, `major_id`) VALUES
(1,	'class-2018',	1),
(2,	'class-2019',	1),
(3,	'class-2020',	1),
(4,	'class-2021',	2),
(5,	'class-2022',	2);

-- 8. Insert 20 items into students
INSERT INTO `students` (`id`, `name`, `stipend`, `birthday`, `sex`, `group_id`) VALUES
(1,	'John Doe',	33000,	'2019-09-26 11:29:59',	'M',	1),
(2,	'Jane Doe',	55000,	'2000-09-26 00:01:00',	'F',	2),
(3,	'Kendall Doe',	11000,	'1998-09-26 00:01:00',	'F',	3),
(4,	'Alex Benjamin',	10000,	'2001-04-01 00:01:00',	'M',	4),
(5,	'Gwendoline-Francis Patricia',	36000,	'2001-06-30 00:01:00',	'N',	4),
(6,	'Stalin Joseph',	0,	'1936-09-26 00:01:00',	'N',	5),
(7,	'Mike Steiner Jr.',	0,	'2000-01-26 00:01:00',	'M',	2),
(8,	'Kelly Jade II.',	100000,	'2001-08-01 00:01:00',	'M',	3),
(9,	'Gelly Kent',	300,	'2000-03-01 11:29:59',	'M',	1),
(10,	'Alex Francis Jr.',	50000,	'2000-11-01 00:01:00',	'M',	2),
(11,	'Martin Stancis',	10000,	'1990-09-08 00:01:00',	'M',	3),
(12,	'Baltazar Matriarch',	100400,	'1900-04-01 00:01:00',	'N',	4),
(13,	'Hunter Biden',	36000,	'1980-06-30 00:01:00',	'M',	1),
(14,	'Zelenskiy Josephine',	0,	'1999-01-09 00:01:00',	'F',	5),
(15,	'Mark Arlington',	0,	'1999-03-20 00:01:00',	'M',	2),
(16,	'Justin Kinto',	100000,	'2001-04-01 00:01:00',	'M',	3),
(17,	'Martin Luther',	1000,	'2001-02-22 00:01:00',	'M',	5),
(18,	'Tim Loon',	32000,	'1997-12-08 00:01:00',	'M',	5),
(19,	'Henrik Holm',	44000,	'2001-04-01 00:01:00',	'F',	1),
(20,	'Isaak Valtersen',	30000,	'1996-08-26 00:01:00',	'N',	2);

-- 9. Select data from join over three tables
SELECT 
    A.name AS student_name,
    B.name as group_name,
    C.name as major,
    C.faculty as faculty
FROM 
   `students` as A
      INNER JOIN
        `groups` AS B
        on A.group_id = B.id
          INNER JOIN
            `majors` AS C
             on B.major_id = C.id
