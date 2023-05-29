-- Check to see if the users table exists in Fines database
IF (Exists (Select * From Fines.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users'))
Begin
	PRINT N'This table already exists'
END;
ELSE
Begin
	Create table Users (
		UserID int IDENTITY(1,1) not null Primary Key,
		UserPassword varchar(70) not null,
		UserEmail varchar(50) not null,
		DateJoined DateTime Default GETDate(),
		UserRole varchar(50) CHECK (UserRole IN('TECH', 'ADMIN', 'SCHOOLADMIN'))
	)
END;

-- create table fine types
IF (EXISTS (Select * From Fines.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'FineTypes'))
Begin
	PRINT N'This table already exists'
END
ELSE 
Begin
	CREATE TABLE FineTypes
	(
		FineTypeID int IDENTITY(1,1) not null Primary Key,
		FineName varchar(75) not null,
		FineFee int not null
	)
END

-- check to see if the fines table exists
IF (Exists (Select * From Fines.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Fines'))
Begin
	PRINT N'This table already exists'
END;
ELSE
Begin
	Create table Fines 
	(
		FineID int IDENTITY(1,1) not null Primary Key,
		FineMade DateTime DEFAULT GetDate(),
		FineAmount int not null,
		StudentID int not null,
		StudentFirstName varchar(50) not null,
		StudentLastName varchar(50) not null,
		StudentSchool varchar(50) not null,
		DamagedComputerFileLocation varchar(150),
		Notes varchar(255),
		FineTypeID int Foreign Key references FineTypes(FineTypeID) Not Null,
		FineCompleted bit not null
	)
END;


IF (Not Exists (Select * From Fines.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'FinePayments'))
Begin
	Create Table FinePayments
	(
		FinePaymentID int IDENTITY(1,1) not null Primary Key,
		FineID int Foreign Key references Fines(FineID) Not Null,
		FinePaymentDate DateTime not null Default GetDate(),
		FinePaymentAmount int not null
	);
END



-- INSERT Test DATA into TABLES
Insert into Users
(UserEmail, UserPassword, UserRole) 
VALUES ('test@email.com', 'Password123', 'TECH'); 

Insert into Users
(UserEmail, UserPassword, UserRole) 
VALUES ('testadmin@email.com', 'Admin123', 'ADMIN'); 

INSERT into FineTypes
(FineName, FineFee)
VALUES ('Damaged - Hinge, broken screen, cracks, drops, spills', 100);	

INSERT into FineTypes
(FineName, FineFee)
VALUES ('Damaged - Keyboard, keys missing, ports damaged', 50);

INSERT into FineTypes
(FineName, FineFee)
VALUES ('Lost - Computer', 300);

INSERT into FineTypes
(FineName, FineFee)
VALUES ('Lost - Charger', 50);

INSERT Into FineTypes
(FineName, FineFee)
VALUES ('Damaged - Charger', 50);







DROP TABLE IF Exists Users;
DROP TABLE IF Exists Fines;
DROP TABLE IF Exists FineTypes;
Drop Table if exists FinePayments;
