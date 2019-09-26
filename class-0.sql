-- Create database
CREATE DATABASE `students`;
-- Switching to database
USE `students`;
-- Create table majors
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `faculty` text NOT NULL
);
-- Create table groups
DROP TABLE IF EXISTS `groups`
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `major_id` int(11) NOT NULL
);
-- Create table students
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` text NOT NULL,
  `stipend` int unsigned NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` char NOT NULL,
  `group_id` int(11) NOT NULL
);
