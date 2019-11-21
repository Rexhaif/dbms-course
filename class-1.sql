-- 1. Create table names and surnames
DROP TABLE IF EXISTS `names`;
CREATE TABLE `names` (
    `name` text NOT NULL,
    `sex` text NOT NULL
);

DROP TABLE IF EXISTS `surnames`;
CREATE TABLE `surnames` (
    `surname` text NOT NULL,
    `sex` text NOT NULL
);

-- 2.Insert rows into these tables
INSERT INTO `names` (`name`, `sex`) VALUES 
('Even',        'm'),
('Isaak',       'm'),
('Eskild',      'm'),
('Noah',        'm'),
('Joseph',      'm'),
('Katherine',   'f'),
('Elizabeth',   'f'),
('Martha',      'f'),
('Lilo',        'f'),
('Miley',       'f');

INSERT INTO `surnames` (`surname`, `sex`) VALUES 
('Naeshem',     'm'),
('Valtersen',   'm'),
('Moore',       'm'),
('Reingard',    'm'),
('Martin',      'm'),
('Romanov',     'f'),
('Tudor',       'f'),
('Lin',         'f'),
('Stich',       'f'),
('Syrus',       'f');

-- 3. Join these tables
DROP TABLE IF EXISTS `pairs`;
CREATE TABLE `pairs` AS (
    SELECT names.name as name,
           names.sex as sex,
           surnames.surname as surname
    FROM names INNER JOIN surnames ON names.sex = surnames.sex
);

SELECT * FROM pairs;
