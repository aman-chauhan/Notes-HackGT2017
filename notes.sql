-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2017 at 12:31 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `notes`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`) VALUES
(1, 'IOT Analytics'),
(2, 'DBMS'),
(3, 'Automated Learning and Data Analysis'),
(4, 'ALGORITHMS'),
(5, 'Computer Networks'),
(6, 'Internet Protocols'),
(7, 'Object Oriented Design and Development'),
(8, 'Fundamentals of Data Science');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `StudentID` int(11) NOT NULL,
  `NoteID` int(11) NOT NULL,
  PRIMARY KEY (`StudentID`,`NoteID`),
  KEY `NoteID` (`NoteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`StudentID`, `NoteID`) VALUES
(22, 3),
(23, 1),
(24, 5),
(25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `NoteID` int(11) NOT NULL AUTO_INCREMENT,
  `NoteDate` date DEFAULT NULL,
  `NoteTitle` varchar(255) DEFAULT NULL,
  `NoteContent` varchar(1024) DEFAULT NULL,
  `NoteApproval` int(11) NOT NULL DEFAULT '0',
  `CourseID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  PRIMARY KEY (`NoteID`),
  KEY `CourseID` (`CourseID`),
  KEY `StudentID` (`StudentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`NoteID`, `NoteDate`, `NoteTitle`, `NoteContent`, `NoteApproval`, `CourseID`, `StudentID`) VALUES
(1, '2017-10-08', 'Spooky Action at Distance', 'KEE\nCALM OR I''LL USE MY GUN ON YOU\nKEEP BOTH HANDS VISIBLE DON''T PANIC\nI HAND GRAB THE MONEY ON CRUSH DRAINED\nNO PASS TO ME\nVERY EASY\nDON\nPUSHY MOBILE\non WILL\nHOUSTON\n', 1, 3, 22),
(2, '2017-10-11', 'Memoization', 'You yourself , as much as anybody\nthe\nentire\nuniverse\ndeserve your love and\naffection . By Gautama Buddha\nWhy\nodds are one in a million . be\nthat\n', 1, 4, 22),
(3, '2017-10-13', 'Mentorship', 'You don''t ever\nave\nto take any\nI advice\nbut if you are going to jump out\nan\narypian\nI advice you go\nparachuit\nBy Joseph D. Thompson\n', 1, 1, 23),
(4, '2017-10-14', 'Chores and Chores', 'Your own words are the bricks and mortar of\nthe concerns you want to realize . Your words at\nthe greatest power you have . The words you\nchores and their use establish the bye you\nexperience\nBy Jack Hayes\n', 1, 6, 24),
(5, NULL, NULL, 'Roger Federer is a swiss professional tennis\nto\nwho\ncurrently ranked world No.\nmen''s\nsingles by the Association\nTennis Professionals\nFTP Federer has won 19 grand Slam singles\ntitles , the most in history\nof a\nmale tennis\nplayer and i\nhas held the world No. I spot in the\nATP Tank\nfor a\nrecord trial of 30 weeks\n23\ning\nling a seemed of 237 consecutive\nweeks\n.\n', 0, 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(26, 'A', 'V', 'av@gmail.com', 'hijkl'),
(25, 'A', 'A', 'aa@gmail.com', 'vwxyz'),
(24, 'S', 'B', 'sb@gmail.com', 'pqrst'),
(23, 'P', 'J', 'pj@gmail.com', 'abcde'),
(22, 'A', 'C', 'ac@d.com', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `studentfollowscourse`
--

CREATE TABLE IF NOT EXISTS `studentfollowscourse` (
  `StudentID` int(11) NOT NULL DEFAULT '0',
  `CourseID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentfollowscourse`
--

INSERT INTO `studentfollowscourse` (`StudentID`, `CourseID`) VALUES
(22, 1),
(24, 3),
(25, 3),
(26, 7);

-- --------------------------------------------------------

--
-- Table structure for table `studentfollowsstudent`
--

CREATE TABLE IF NOT EXISTS `studentfollowsstudent` (
  `studentID1` int(11) NOT NULL DEFAULT '0',
  `studentID2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`studentID1`,`studentID2`),
  KEY `studentID2` (`studentID2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentfollowsstudent`
--

INSERT INTO `studentfollowsstudent` (`studentID1`, `studentID2`) VALUES
(22, 23),
(22, 24),
(23, 24);
