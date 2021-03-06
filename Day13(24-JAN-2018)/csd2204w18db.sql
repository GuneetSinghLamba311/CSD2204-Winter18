-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2018 at 05:04 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csd2204w18db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_data` ()  select *from jobs$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `JOB_Search` (IN `SALARY` INT, OUT `CNTEMP` INT)  BEGIN SELECT count(*) INTO CNTEMP from JOBS where MAX_SALARY > SALARY;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `my_proced_IN` (IN `SALARY` INT)  BEGIN
SELECT * FROM jobs where MIN_SALARY > salary;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `my_proce_IN` (IN `SALARY` INT)  BEGIN
SELECT MIN_SALARY INTO SALARY from JOBS where MIN_SALARY > SALARY;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `my_proc_IN` (IN `SALARY` INT)  BEGIN
SELECT MIN_SALARY INTO SALARY from JOBS where MIN_SALARY > SALARY;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `my_proc_OUT` (OUT `highest_salary` INT)  BEGIN
SELECT MAX(MAX_SALARY) INTO highest_salary FROM JOBS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proced_WHILE` (IN `n` INT)  BEGIN
SET @sum = 0;
SET @x = 1;
WHILE @x<n
DO
IF mod(@x, 2) <> 0
THEN SET @sum = @sum + @x;
END IF;
SET @x = @x + 1;
END WHILE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proce_REPEAT` (IN `n` INT)  BEGIN
SET @sum = 0;
SET @x = 1;
REPEAT
IF mod(@x, 2) = 0
THEN SET @sum = @sum + @x;
END IF;
SET @x = @x + 1;
UNTIL @x > n
END REPEAT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Case` (INOUT `no_employees` INT, IN `salary` INT)  BEGIN
CASE
WHEN (salary>10000)
THEN (SELECT COUNT(job_id) INTO no_employees FROM
jobs WHERE min_salary>10000);
WHEN (salary<10000)
THEN (SELECT COUNT(job_id) INTO no_employees FROM
jobs WHERE min_salary<10000);
ELSE (SELECT COUNT(job_id) INTO no_employees FROM jobs
WHERE min_salary=10000);
END CASE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Compare_Salary` (IN `desig` CHAR(30))  BEGIN
DECLARE progSal INT;
DECLARE presSal INT;
SELECT MIN_SALARY INTO progSal FROM jobs WHERE JOB_TITLE = desig;
SELECT MIN_SALARY INTO presSal FROM jobs WHERE JOB_TITLE = 'president';
SET presSal = presSal /2;
SELECT presSal;
SELECT progSal;
IF (progSal < presSal)
THEN
SELECT 'You need an increment.';
ELSEIF (progSal = presSal)
THEN
SELECT 'Salary is moderate';
ELSE
SELECT 'You are earning good';
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cursors` (INOUT `return_val` INT)  BEGIN
DECLARE a,b INT;
DECLARE cur_1 CURSOR FOR SELECT max_salary FROM jobs;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
open cur_1;
REPEAT
FETCH cur_1 INTO a;
UNTIL b = 1
END REPEAT;
CLOSE cur_1;
SET return_val = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_IN` (IN `var1` INT)  BEGIN
SELECT * FROM jobs LIMIT var1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_inout` (INOUT `maxsalary` INT, IN `desig` CHAR(30))  BEGIN
select MAX_SALARY INTO maxsalary FROM jobs where JOB_TITLE = desig;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_LOOP` (IN `num` INT)  BEGIN
DECLARE x INT;
SET x = 0;
loop_label: LOOP
INSERT INTO number VALUES(rand());
SET x = x+1;
if x>=num
THEN LEAVE loop_label;
END IF;
END LOOP;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_prime` (IN `n` INT)  BEGIN
set @num = 0;
set @x = 1;
while @x<n
DO
if mod(@x,n) = 0
THEN SET @num = @x;
END IF;
SET @x = @x+1;
END while;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_primeNum` (IN `n` INT)  BEGIN
set @num = 1;
set @x = 1;
while @num <n
DO
if mod(@num,@n) = 0
THEN SET @num = @n;
END IF;
SET @x = @x+1;
END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_REPEAT` (IN `n` INT)  BEGIN
SET @sum = 0;
SET @X = 1;
REPEAT 
IF mod(@x,2) = 0
THEN SET @sum = @sum + @x;
END IF;
SET @x = @x + 1;
UNTIL @x > n
END REPEAT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_User_Variables` ()  BEGIN
SET @x = 15;
SET @y = 10;
SELECT @x, @y, @x-@y;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Variables` ()  BEGIN
DECLARE a INT DEFAULT 10;
DECLARE b, c INT;
SET a = a + 100;
SET b = 2;
SET c = a + b;
BEGIN 
DECLARE c INT;
set c = 5;
select a,b,c;
END;
SELECT a,b,c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_WHILE` (IN `n` INT)  BEGIN
SET @sum = 0;
SET @x = 1;
WHILE @x<n
DO
IF mod(@x, 2) <> 0
THEN SET @sum = @sum + @x;
END IF;
SET @x = @x + 1;
END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `testError` ()  BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'Error
occured';
INSERT INTO test.customer(customer_id,cust_name)
VALUES(3001,"test");
SELECT *FROM test.customer;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` mediumint(9) NOT NULL,
  `name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `name`) VALUES
(1, 'dog'),
(2, 'cat'),
(3, 'penguin'),
(4, 'lax'),
(5, 'whale'),
(6, 'ostrich'),
(7, 'kangaroo'),
(10, 'kangaroo'),
(11, 'Tiger');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');

-- --------------------------------------------------------

--
-- Table structure for table `custom`
--

CREATE TABLE `custom` (
  `id` int(3) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `PurchaseAmount` float DEFAULT NULL,
  `MembershipType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom`
--

INSERT INTO `custom` (`id`, `Name`, `Email`, `PurchaseAmount`, `MembershipType`) VALUES
(1, 'Andy', 'any@rt.com', 1000, 'Bronze'),
(2, 'kate', 'kate@rt.com', 500000, 'Silver'),
(3, 'Nelly', 'nelly@rt.com', 200000, 'Bronze'),
(4, 'Bill', 'Bill@rt.com', 4500000, 'GOLD'),
(5, 'Dexter', 'Dexter@rt.com', 150000, 'BRONZE');

--
-- Triggers `custom`
--
DELIMITER $$
CREATE TRIGGER `change_type` BEFORE UPDATE ON `custom` FOR EACH ROW BEGIN
IF New.PurchaseAmount > 1000000
Then SET NEW.MembershipType = 'GOLD';
ELSEIF NEW.PURCHASEAMOUNT > 500000 AND NEW.PURCHASEAMOUNT < 1000000
THEN SET NEW.MembershipType = 'Silver';
ELSEIF NEW.PURCHASEAMOUNT < 500000
THEN SET NEW.MembershipType = 'Bronze';
ELSE
SET NEW.MembershipType = 'Not Available';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `d10_v1`
-- (See below for the actual view)
--
CREATE TABLE `d10_v1` (
`Code` int(3)
,`Name` varchar(255)
,`Price` decimal(10,0)
,`Manufacturer` int(3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `d10_v2`
-- (See below for the actual view)
--
CREATE TABLE `d10_v2` (
`code` int(3)
,`products` varchar(255)
,`manufacturer` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`) VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', '0', '1700'),
('130', 'Corporate Tax', '0', '1700'),
('140', 'Control And Credit', '0', '1700'),
('150', 'Shareholder Services', '0', '1700'),
('160', 'Benefits', '0', '1700'),
('170', 'Manufacturing', '0', '1700'),
('180', 'Construction', '0', '1700'),
('190', 'Contracting', '0', '1700'),
('200', 'Operations', '0', '1700'),
('210', 'IT Support', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT Helpdesk', '0', '1700'),
('240', 'Government Sales', '0', '1700'),
('250', 'Retail Sales', '0', '1700'),
('260', 'Recruiting', '0', '1700'),
('270', 'Payroll', '0', '1700');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('100', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90'),
('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', '17000.00', '0.00', '100', '90'),
('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', '17000.00', '0.00', '100', '90'),
('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', '9000.00', '0.00', '102', '60'),
('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', '6000.00', '0.00', '103', '60'),
('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', '4200.00', '0.00', '103', '60'),
('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', '12000.00', '0.00', '101', '100'),
('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', '9000.00', '0.00', '108', '100'),
('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', '8200.00', '0.00', '108', '100'),
('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', '7700.00', '0.00', '108', '100'),
('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', '7800.00', '0.00', '108', '100'),
('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', '6900.00', '0.00', '108', '100'),
('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1987-07-01', 'PU_MAN', '11000.00', '0.00', '100', '30'),
('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1987-07-02', 'PU_CLERK', '3100.00', '0.00', '114', '30'),
('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1987-07-03', 'PU_CLERK', '2900.00', '0.00', '114', '30'),
('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1987-07-04', 'PU_CLERK', '2800.00', '0.00', '114', '30'),
('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1987-07-05', 'PU_CLERK', '2600.00', '0.00', '114', '30'),
('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1987-07-06', 'PU_CLERK', '2500.00', '0.00', '114', '30'),
('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1987-07-07', 'ST_MAN', '8000.00', '0.00', '100', '50'),
('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1987-07-08', 'ST_MAN', '8200.00', '0.00', '100', '50'),
('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1987-07-09', 'ST_MAN', '7900.00', '0.00', '100', '50'),
('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1987-07-10', 'ST_MAN', '6500.00', '0.00', '100', '50'),
('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1987-07-11', 'ST_MAN', '5800.00', '0.00', '100', '50'),
('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1987-07-12', 'ST_CLERK', '3200.00', '0.00', '120', '50'),
('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1987-07-13', 'ST_CLERK', '2700.00', '0.00', '120', '50'),
('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1987-07-14', 'ST_CLERK', '2400.00', '0.00', '120', '50'),
('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1987-07-15', 'ST_CLERK', '2200.00', '0.00', '120', '50'),
('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1987-07-16', 'ST_CLERK', '3300.00', '0.00', '121', '50'),
('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1987-07-17', 'ST_CLERK', '2800.00', '0.00', '121', '50'),
('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1987-07-18', 'ST_CLERK', '2500.00', '0.00', '121', '50'),
('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1987-07-19', 'ST_CLERK', '2100.00', '0.00', '121', '50'),
('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1987-07-20', 'ST_CLERK', '3300.00', '0.00', '122', '50'),
('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1987-07-21', 'ST_CLERK', '2900.00', '0.00', '122', '50'),
('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1987-07-22', 'ST_CLERK', '2400.00', '0.00', '122', '50'),
('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1987-07-23', 'ST_CLERK', '2200.00', '0.00', '122', '50'),
('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1987-07-24', 'ST_CLERK', '3600.00', '0.00', '123', '50'),
('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1987-07-25', 'ST_CLERK', '3200.00', '0.00', '123', '50'),
('139', 'John', 'Seo', 'JSEO', '650.121.2019', '1987-07-26', 'ST_CLERK', '2700.00', '0.00', '123', '50'),
('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1987-07-27', 'ST_CLERK', '2500.00', '0.00', '123', '50'),
('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1987-07-28', 'ST_CLERK', '3500.00', '0.00', '124', '50'),
('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1987-07-29', 'ST_CLERK', '3100.00', '0.00', '124', '50'),
('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1987-07-30', 'ST_CLERK', '2600.00', '0.00', '124', '50'),
('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1987-07-31', 'ST_CLERK', '2500.00', '0.00', '124', '50'),
('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1987-08-01', 'SA_MAN', '14000.00', '0.40', '100', '80'),
('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1987-08-02', 'SA_MAN', '13500.00', '0.30', '100', '80'),
('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1987-08-03', 'SA_MAN', '12000.00', '0.30', '100', '80'),
('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1987-08-04', 'SA_MAN', '11000.00', '0.30', '100', '80'),
('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1987-08-05', 'SA_MAN', '10500.00', '0.20', '100', '80'),
('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1987-08-06', 'SA_REP', '10000.00', '0.30', '145', '80'),
('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1987-08-07', 'SA_REP', '9500.00', '0.25', '145', '80'),
('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1987-08-08', 'SA_REP', '9000.00', '0.25', '145', '80'),
('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1987-08-09', 'SA_REP', '8000.00', '0.20', '145', '80'),
('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1987-08-10', 'SA_REP', '7500.00', '0.20', '145', '80'),
('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', '7000.00', '0.15', '145', '80'),
('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1987-08-12', 'SA_REP', '10000.00', '0.35', '146', '80'),
('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1987-08-13', 'SA_REP', '9500.00', '0.35', '146', '80'),
('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1987-08-14', 'SA_REP', '9000.00', '0.35', '146', '80'),
('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1987-08-15', 'SA_REP', '8000.00', '0.30', '146', '80'),
('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1987-08-16', 'SA_REP', '7500.00', '0.30', '146', '80'),
('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1987-08-17', 'SA_REP', '7000.00', '0.25', '146', '80'),
('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1987-08-18', 'SA_REP', '10500.00', '0.25', '147', '80'),
('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1987-08-19', 'SA_REP', '9500.00', '0.15', '147', '80'),
('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1987-08-20', 'SA_REP', '7200.00', '0.10', '147', '80'),
('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1987-08-21', 'SA_REP', '6800.00', '0.10', '147', '80'),
('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1987-08-22', 'SA_REP', '6400.00', '0.10', '147', '80'),
('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1987-08-23', 'SA_REP', '6200.00', '0.10', '147', '80'),
('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1987-08-24', 'SA_REP', '11500.00', '0.25', '148', '80'),
('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1987-08-25', 'SA_REP', '10000.00', '0.20', '148', '80'),
('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1987-08-26', 'SA_REP', '9600.00', '0.20', '148', '80'),
('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1987-08-27', 'SA_REP', '7400.00', '0.15', '148', '80'),
('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1987-08-28', 'SA_REP', '7300.00', '0.15', '148', '80'),
('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1987-08-29', 'SA_REP', '6100.00', '0.10', '148', '80'),
('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1987-08-30', 'SA_REP', '11000.00', '0.30', '149', '80'),
('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1987-08-31', 'SA_REP', '8800.00', '0.25', '149', '80'),
('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1987-09-01', 'SA_REP', '8600.00', '0.20', '149', '80'),
('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1987-09-02', 'SA_REP', '8400.00', '0.20', '149', '80'),
('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1987-09-03', 'SA_REP', '7000.00', '0.15', '149', '0'),
('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1987-09-04', 'SA_REP', '6200.00', '0.10', '149', '80'),
('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1987-09-05', 'SH_CLERK', '3200.00', '0.00', '120', '50'),
('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1987-09-06', 'SH_CLERK', '3100.00', '0.00', '120', '50'),
('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1987-09-07', 'SH_CLERK', '2500.00', '0.00', '120', '50'),
('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1987-09-08', 'SH_CLERK', '2800.00', '0.00', '120', '50'),
('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1987-09-09', 'SH_CLERK', '4200.00', '0.00', '121', '50'),
('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1987-09-10', 'SH_CLERK', '4100.00', '0.00', '121', '50'),
('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1987-09-11', 'SH_CLERK', '3400.00', '0.00', '121', '50'),
('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1987-09-12', 'SH_CLERK', '3000.00', '0.00', '121', '50'),
('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1987-09-13', 'SH_CLERK', '3800.00', '0.00', '122', '50'),
('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1987-09-14', 'SH_CLERK', '3600.00', '0.00', '122', '50'),
('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1987-09-15', 'SH_CLERK', '2900.00', '0.00', '122', '50'),
('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1987-09-16', 'SH_CLERK', '2500.00', '0.00', '122', '50'),
('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1987-09-17', 'SH_CLERK', '4000.00', '0.00', '123', '50'),
('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1987-09-18', 'SH_CLERK', '3900.00', '0.00', '123', '50'),
('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1987-09-19', 'SH_CLERK', '3200.00', '0.00', '123', '50'),
('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1987-09-20', 'SH_CLERK', '2800.00', '0.00', '123', '50'),
('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1987-09-21', 'SH_CLERK', '3100.00', '0.00', '124', '50'),
('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1987-09-22', 'SH_CLERK', '3000.00', '0.00', '124', '50'),
('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1987-09-23', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1987-09-24', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-25', 'AD_ASST', '4400.00', '0.00', '101', '10'),
('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1987-09-26', 'MK_MAN', '13000.00', '0.00', '100', '20'),
('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1987-09-27', 'MK_REP', '6000.00', '0.00', '201', '20'),
('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1987-09-28', 'HR_REP', '6500.00', '0.00', '101', '40'),
('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1987-09-29', 'PR_REP', '10000.00', '0.00', '101', '70'),
('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', '12000.00', '0.00', '101', '110'),
('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', '8300.00', '0.00', '205', '110');

-- --------------------------------------------------------

--
-- Table structure for table `emp_details`
--

CREATE TABLE `emp_details` (
  `EMPLOYEE_ID` int(6) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date DEFAULT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` double(8,2) DEFAULT NULL,
  `COMMISSION_PCT` double(2,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_details`
--

INSERT INTO `emp_details` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`) VALUES
(101, 'NEENA', 'KOCHHAR', 'NEENA.KOCHHAR@GMAIL.COM', '2345678', '2002-10-10', 'AD_VP', 18000.00, 0.50),
(102, 'LEX', 'DE HANN', 'LEX.HANN@GMAIL.COM', '2345678', '1995-10-20', 'AD_VP', 18000.00, 0.50),
(103, 'ALEXANDER', 'HUNOLD', 'ALEXANDER.HUNOLD@GMAIL.CO', '2345678', '2002-11-23', 'IT_PROG', 10000.00, 0.25),
(104, 'BRUCE', 'ERNST', 'BRUCE.ERNST@GMAIL.COM', '2345678', '2003-08-24', 'IT_PROG', 7000.00, 0.25),
(105, 'DAVID', 'AUSTIN', 'DAVID.AUSTIN@GMAIL.COM', '2345678', '2005-04-10', 'IT_PROG', 5800.00, 0.25),
(236, 'RABI', 'CHANDRA', 'RABI', '123.34.45700', '2013-01-12', 'AD_VP', 16000.00, 0.50),
(334, 'Ana', 'King', 'ANA', '212.212.21201', '2013-02-05', 'IT_PROG', 18000.00, 0.50);

--
-- Triggers `emp_details`
--
DELIMITER $$
CREATE TRIGGER `emp_details_ADEL` AFTER DELETE ON `emp_details` FOR EACH ROW BEGIN
INSERT INTO LOG_EMP_DETAILS_UPDATE values(user(),CONCAT('Delete Employee Record', OLD.FIRST_NAME, '->\nDeleted on'),NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `emp_details_AINS` AFTER INSERT ON `emp_details` FOR EACH ROW BEGIN
INSERT INTO log_emp_details VALUES(NEW.employee_id,
NEW.salary, NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `emp_details_AUPD` AFTER UPDATE ON `emp_details` FOR EACH ROW BEGIN
INSERT INTO LOG_EMP_DETAILS_UPDATE VALUES (user(),
CONCAT('Update employee Record ',
OLD.FIRST_NAME,' Old Salary :',OLD.Salary,' New Salary : ',
NEW.Salary),NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `emp_details_BINS` BEFORE INSERT ON `emp_details` FOR EACH ROW BEGIN
SET NEW.FIRST_NAME = TRIM(NEW.FIRST_NAME);
SET NEW.LAST_NAME = TRIM(NEW.LAST_NAME);
SET NEW.JOB_ID = UPPER(NEW.JOB_ID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AD_PRES', 'President', '20000', '40000'),
('AD_VP', 'Administration Vice President', '15000', '30000'),
('AD_ASST', 'Administration Assistant', '3000', '6000'),
('FI_MGR', 'Finance Manager', '8200', '16000'),
('FI_ACCOUNT', 'Accountant', '4200', '9000'),
('AC_MGR', 'Accounting Manager', '8200', '16000'),
('AC_ACCOUNT', 'Public Accountant', '4200', '9000'),
('SA_MAN', 'Sales Manager', '10000', '20000'),
('SA_REP', 'Sales Representative', '6000', '12000'),
('PU_MAN', 'Purchasing Manager', '8000', '15000'),
('PU_CLERK', 'Purchasing Clerk', '2500', '5500'),
('ST_MAN', 'Stock Manager', '5500', '8500'),
('ST_CLERK', 'Stock Clerk', '2000', '5000'),
('SH_CLERK', 'Shipping Clerk', '2500', '5500'),
('IT_PROG', 'Programmer', '4000', '10000'),
('MK_MAN', 'Marketing Manager', '9000', '15000'),
('MK_REP', 'Marketing Representative', '4000', '9000'),
('HR_REP', 'Human Resources Representative', '4000', '9000'),
('PR_REP', 'Public Relations Representative', '4500', '10500');

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
('102', '1993-01-13', '1998-07-24', 'IT_PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-01', '1999-12-31', 'SA_MAN', '80'),
('200', '1994-07-01', '1998-12-31', 'AC_ACCOUNT', '90'),
('0', '0000-00-00', '0000-00-00', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `LOCATION_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`) VALUES
('1000', '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', '', 'SG'),
('2400', '8204 Arthur St', '', 'London', '', 'UK'),
('2500', '\"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox'),
('2600', '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', '\"Distrito Federal', '\"');

-- --------------------------------------------------------

--
-- Table structure for table `log_emp_details`
--

CREATE TABLE `log_emp_details` (
  `EMPLOYEE_ID` int(6) DEFAULT NULL,
  `SALARY` double(8,2) DEFAULT NULL,
  `EDTTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_emp_details`
--

INSERT INTO `log_emp_details` (`EMPLOYEE_ID`, `SALARY`, `EDTTIME`) VALUES
(236, 15000.00, '2018-01-24 08:43:59'),
(334, 17000.00, '2018-01-24 08:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `log_emp_details_update`
--

CREATE TABLE `log_emp_details_update` (
  `USER` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `UDTTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_emp_details_update`
--

INSERT INTO `log_emp_details_update` (`USER`, `DESCRIPTION`, `UDTTIME`) VALUES
('root@localhost', 'Delete Employee RecordSTEVEN->\nDeleted on ', '2018-01-24 09:08:53'),
('root@localhost', 'Update employee Record NEENA Old Salary :17000.00 New Salary : 18000.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record LEX Old Salary :17000.00 New Salary : 18000.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record ALEXANDER Old Salary :9000.00 New Salary : 10000.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record BRUCE Old Salary :6000.00 New Salary : 7000.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record DAVID Old Salary :4800.00 New Salary : 5800.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record RABI Old Salary :15000.00 New Salary : 16000.00', '2018-01-24 09:12:20'),
('root@localhost', 'Update employee Record Ana Old Salary :17000.00 New Salary : 18000.00', '2018-01-24 09:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `manu`
--

CREATE TABLE `manu` (
  `Code` int(3) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manu`
--

INSERT INTO `manu` (`Code`, `Name`) VALUES
(1, 'Sony'),
(2, 'Creative Labs'),
(3, 'Hewlett-Packard'),
(4, 'Iomega'),
(5, 'Fujitsu'),
(6, 'Winchester'),
(7, 'moxDroid Labs Inc'),
(8, 'Dell'),
(9, 'Bell Labs');

-- --------------------------------------------------------

--
-- Table structure for table `number`
--

CREATE TABLE `number` (
  `n1` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `number`
--

INSERT INTO `number` (`n1`) VALUES
(0.09),
(0.08),
(0.12),
(4.00),
(5.00),
(9.00),
(9.99),
(9.99),
(6.00);

--
-- Triggers `number`
--
DELIMITER $$
CREATE TRIGGER `ins_sum` BEFORE INSERT ON `number` FOR EACH ROW SET @sum = NEW.n1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

CREATE TABLE `numbers` (
  `n1` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`name`, `owner`, `species`, `sex`, `birth`, `death`) VALUES
('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', '0000-00-00'),
('Claws', 'Gwen', 'cat', 'm', '1994-03-17', '0000-00-00'),
('Buffy', 'Harold', 'dog', 'f', '1989-05-13', '0000-00-00'),
('Fang', 'Benny', 'dog', 'm', '1990-08-27', '0000-00-00'),
('Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29'),
('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', '0000-00-00'),
('Whistler', 'Gwen', 'bird', '', '1997-12-09', '0000-00-00'),
('Slim', 'Benny', 'snake', 'm', '1996-04-29', '0000-00-00'),
('Boxer123', NULL, NULL, NULL, NULL, NULL),
('123', NULL, NULL, NULL, NULL, NULL),
('JHK123', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_logs`
--

CREATE TABLE `price_logs` (
  `id` int(11) NOT NULL,
  `product_code` int(3) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_logs`
--

INSERT INTO `price_logs` (`id`, `product_code`, `price`) VALUES
(1, 1, '240');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Code` int(3) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Manufacturer` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Code`, `Name`, `Price`, `Manufacturer`) VALUES
(1, 'Hard drive', '100', 5),
(2, 'Memory', '120', 6),
(3, 'ZIP drive', '150', 4),
(4, 'Floppy disk', '5', 6),
(5, 'Monitor', '240', 1),
(6, 'DVD drive', '180', 2),
(7, 'CD drive', '90', 2),
(8, 'Printer', '270', 3),
(9, 'ssd', '66', 3),
(10, 'DVD burner', '180', 2),
(11, 'Printer', '40', 7),
(12, 'Toner cartridge', '54', 7),
(13, 'DVD burner', '78', 7);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `before_products_update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
INSERT INTO price_logs(product_code,price) VALUE(old.code,old.price);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`REGION_ID`, `REGION_NAME`) VALUES
('1', 'Europe\r'),
('2', 'Americas\r'),
('3', 'Asia\r'),
('4', 'Middle East and Africa\r');

-- --------------------------------------------------------

--
-- Table structure for table `stud_marks`
--

CREATE TABLE `stud_marks` (
  `STUDENT_ID` int(3) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `SUB1` double(4,2) DEFAULT NULL,
  `SUB2` double(4,2) DEFAULT NULL,
  `SUB3` double(4,2) DEFAULT NULL,
  `SUB4` double(4,2) DEFAULT NULL,
  `SUB5` double(4,2) DEFAULT NULL,
  `TOTAL` double(5,2) DEFAULT NULL,
  `PERCENTAGE` double(4,2) DEFAULT NULL,
  `GRADE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_marks`
--

INSERT INTO `stud_marks` (`STUDENT_ID`, `NAME`, `SUB1`, `SUB2`, `SUB3`, `SUB4`, `SUB5`, `TOTAL`, `PERCENTAGE`, `GRADE`) VALUES
(1, 'ALEX', 54.00, 69.00, 89.00, 87.00, 59.00, 358.00, 71.60, 'GOOD'),
(2, 'BOB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'CHARLEY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'DONNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `stud_marks`
--
DELIMITER $$
CREATE TRIGGER `stud_marks_BUPD` BEFORE UPDATE ON `stud_marks` FOR EACH ROW BEGIN
SET NEW.TOTAL = NEW.SUB1 + NEW.SUB2 + NEW.SUB3 +
NEW.SUB4 + NEW.SUB5;
SET NEW.PERCENTAGE = NEW.TOTAL/5;
IF NEW.PERCENTAGE >=90
THEN SET NEW.GRADE = 'EXCELLENT';
ELSEIF NEW.PERCENTAGE>=75 AND NEW.PERCENTAGE<90
THEN SET NEW.GRADE = 'VERY GOOD';
ELSEIF NEW.PERCENTAGE>=60 AND NEW.PERCENTAGE<75
THEN SET NEW.GRADE = 'GOOD';
ELSEIF NEW.PERCENTAGE>=40 AND NEW.PERCENTAGE<60
THEN SET NEW.GRADE = 'AVERAGE';
ELSE SET NEW.GRADE = 'NOT PROMOTED';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_change_logs`
--

CREATE TABLE `user_change_logs` (
  `id` int(11) NOT NULL,
  `product_code` int(3) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v1_today`
-- (See below for the actual view)
--
CREATE TABLE `v1_today` (
`today` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_today`
-- (See below for the actual view)
--
CREATE TABLE `v_today` (
`today` date
);

-- --------------------------------------------------------

--
-- Structure for view `d10_v1`
--
DROP TABLE IF EXISTS `d10_v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `d10_v1`  AS  select `products`.`Code` AS `Code`,`products`.`Name` AS `Name`,`products`.`Price` AS `Price`,`products`.`Manufacturer` AS `Manufacturer` from `products` ;

-- --------------------------------------------------------

--
-- Structure for view `d10_v2`
--
DROP TABLE IF EXISTS `d10_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `d10_v2`  AS  select `products`.`Code` AS `code`,`products`.`Name` AS `products`,`manu`.`Name` AS `manufacturer` from (`manu` join `products` on((`products`.`Code` = `manu`.`Code`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v1_today`
--
DROP TABLE IF EXISTS `v1_today`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1_today`  AS  select curtime() AS `today` ;

-- --------------------------------------------------------

--
-- Structure for view `v_today`
--
DROP TABLE IF EXISTS `v_today`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_today`  AS  select curdate() AS `today` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`COUNTRY_ID`),
  ADD KEY `COUNTR_REG_FK` (`REGION_ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  ADD KEY `DEPT_LOCATION_IX` (`LOCATION_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  ADD KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `EMP_JOB_IX` (`JOB_ID`),
  ADD KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  ADD KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`);

--
-- Indexes for table `emp_details`
--
ALTER TABLE `emp_details`
  ADD PRIMARY KEY (`EMPLOYEE_ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  ADD KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  ADD KEY `JHIST_JOB_IX` (`JOB_ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `LOC_CITY_IX` (`CITY`),
  ADD KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  ADD KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`);

--
-- Indexes for table `manu`
--
ALTER TABLE `manu`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `price_logs`
--
ALTER TABLE `price_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `FK_PRODUCTS` (`Manufacturer`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`REGION_ID`),
  ADD UNIQUE KEY `sss` (`REGION_NAME`);

--
-- Indexes for table `stud_marks`
--
ALTER TABLE `stud_marks`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `user_change_logs`
--
ALTER TABLE `user_change_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `manu`
--
ALTER TABLE `manu`
  MODIFY `Code` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `price_logs`
--
ALTER TABLE `price_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Code` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_change_logs`
--
ALTER TABLE `user_change_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_PRODUCTS` FOREIGN KEY (`Manufacturer`) REFERENCES `manu` (`Code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
