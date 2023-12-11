-- arcade insert values

use arcade_db;

INSERT INTO machines (machineID, machineName, tokensRequired, incentive, ticketsProduced)
VALUES 
	(1001, 'Whack-a-Mole', 1, 'ticket', 10),
    (1002, 'Basketball', 3, 'ticket', 50),
    (1003, 'Coin Pusher', 2, 'coin', NULL),
    (1004, 'StreetFighter', 2, 'coin', NULL),
    (1005, 'Air Hockey', 10, 'ticket', 25),
    (1006, 'Claw Machine', 2, 'toy', NULL);

    
INSERT INTO prizes (prizeID, prizeName, ticketRequired, claimersQTY, month)
VALUES 
    (2001, 'Lollipop', 5, 10, 'January'),
    (2002, 'Small Bag of Potato Chips', 20, 25, 'February'),
    (2003, 'Earphones', 500, 2, 'February'),
    (2004, 'Popsocket', 200, 15, 'February'),
    (2005, 'Food Themed Erasers', 35, 3, 'February'),
    (2006, 'Colored Pens', 50, 8, 'March'),
    (2007, 'Small Cute Notebook', 125, 5, 'March'),
    (2008, 'Key Chain', 150, 10, 'April'),
    (2009, 'Mini toy car', 50, 30, 'April'),
    (2010, '18in Plush Toy', 1500, 1, 'April');


INSERT INTO gameplay (gameplayID, machineID, playersQTY, winnersQTY, date)
VALUES 
    (3001, 1004, 20, 10, '2023-01-05'),
    (3002, 1004, 55, 45, '2023-01-05'),
    (3003, 1002, 100, 99, '2023-02-07'),
    (3004, 1003, 43, 23, '2023-02-09'),
    (3005, 1006, 10, 3, '2023-02-14'),
    (3006, 1004, 35, 30, '2023-03-18'),
    (3007, 1005, 34, 17, '2023-03-24'),
    (3008, 1001, 7, 7, '2023-04-15');
    
INSERT INTO token_conversion (tokenVersion, price, dateImplemented)
VALUES 
    (1, 1.00, '2023-01-15'),
    (2, 3.00, '2023-02-20'),
    (3, 5.00, '2023-03-25');

INSERT INTO expenses (expensesID, itemName, purpose, itemPrice, datePurchased)
VALUES 
    (1, 'Maintenance Fee', 'Maintainance of Machines', 1500, '2023-01-15'),
    (2, 'Stuff Toys', 'Prize',400, '2023-02-14'),
    (3, 'String Lights', 'Decoration',250, '2023-03-25');

    
INSERT INTO machine_profit(profitID, machineID, tokensGained, dateAcquired)
VALUES
    (1, 1004, 80, '2023-01-05'),
    (2, 1004, 100, '2023-01-05'),
    (3, 1002, 200, '2023-02-07'),
    (4, 1003, 129, '2023-02-09'),
    (5, 1006, 30, '2023-02-14'),
    (6, 1001, 140, '2023-03-18'),
    (7, 1005, 68, '2023-03-24'),
    (8, 1001, 7, '2023-04-15');
    
