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

DELIMITER //
CREATE FUNCTION generate_id() RETURNS INT
BEGIN
    SET @x = 0;
    SET @x = (SELECT id FROM groups ORDER BY rand() LIMIT 1);
    RETURN @x;
END//
DELIMITER ;


-- 4. Random data insert
INSERT INTO `students` (name, stipend, birthday, sex, group_id)
    SELECT CONCAT(surnames.surname, ' ' ,names.name), rand() * 10000, '2019-09-26 11:29:59', surnames.sex, generate_id()
    FROM names INNER JOIN surnames ON names.sex = surnames.sex;
    
