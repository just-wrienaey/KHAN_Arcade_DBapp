-- -----------------------------------------------------
-- Overwrite existing tables
-- -----------------------------------------------------

-- Drop the tables with foreign key constraints first
DROP TABLE IF EXISTS gameplay;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS machine_profit;

-- Drop the tables without foreign key constraints
DROP TABLE IF EXISTS prizes;
DROP TABLE IF EXISTS token_conversion;
DROP TABLE IF EXISTS machines;

-- CORE RECORDS

-- -----------------------------------------------------
-- CREATE tables
-- -----------------------------------------------------

CREATE TABLE machines (
	machineID INT PRIMARY KEY AUTO_INCREMENT,
    machineName VARCHAR(225) UNIQUE,
    tokensRequired INT NOT NULL,
    incentive VARCHAR(50),
    ticketsProduced INT DEFAULT NULL    
    );

CREATE TABLE prizes(
	prizeID INT PRIMARY KEY AUTO_INCREMENT,
    prizeName VARCHAR(225),
    ticketRequired INT,
    claimersQTY INT,
    month VARCHAR(50)
    );

CREATE TABLE gameplay(
	gameplayID INT PRIMARY KEY AUTO_INCREMENT,
    machineID INT,
    playersQTY INT,
    winnersQTY INT,
    date DATE,
    FOREIGN KEY (machineID) REFERENCES machines(machineID)
    );

CREATE TABLE token_conversion( -- add only no update nor delete 
	tokenVersion INT PRIMARY KEY AUTO_INCREMENT,
    price  DECIMAL(10, 2),
    dateImplemented DATE
    );

-- -----------------------------------------------------

-- TRANSACTIONS // add only no update nor delete 

-- -----------------------------------------------------
-- CREATE tables
-- -----------------------------------------------------
CREATE TABLE expenses(
	expensesID INT PRIMARY KEY,
	itemName VARCHAR(225),
    purpose VARCHAR(225),
    itemPrice DECIMAL(10, 2),
    datePurchased date
    );
    
CREATE TABLE machine_profit(
	profitID INT PRIMARY KEY,
    machineID INT,
    tokensGained INT,
    dateAcquired date,
    FOREIGN KEY (machineID) REFERENCES machines(machineID)
    );
