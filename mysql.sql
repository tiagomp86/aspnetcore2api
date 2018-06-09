CREATE TABLE `__EFMigrationsHistory` (
    `MigrationId` varchar(95) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
);

CREATE TABLE `Users` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `City` longtext,
    `Country` longtext,
    `Created` datetime(6) NOT NULL,
    `DateOfBirth` datetime(6) NOT NULL,
    `Gender` longtext,
    `Interests` longtext,
    `Introduction` longtext,
    `KnownAs` longtext,
    `LastActive` datetime(6) NOT NULL,
    `LookingFor` longtext,
    `PasswordHash` longblob,
    `PasswordSalt` longblob,
    `Username` longtext,
    CONSTRAINT `PK_Users` PRIMARY KEY (`Id`)
);

CREATE TABLE `Values` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext,
    CONSTRAINT `PK_Values` PRIMARY KEY (`Id`)
);

CREATE TABLE `Likes` (
    `LikerId` int NOT NULL,
    `LikeeId` int NOT NULL,
    CONSTRAINT `PK_Likes` PRIMARY KEY (`LikerId`, `LikeeId`),
    CONSTRAINT `FK_Likes_Users_LikeeId` FOREIGN KEY (`LikeeId`) REFERENCES `Users` (`Id`) ON DELETE NO ACTION,
    CONSTRAINT `FK_Likes_Users_LikerId` FOREIGN KEY (`LikerId`) REFERENCES `Users` (`Id`) ON DELETE NO ACTION
);

CREATE TABLE `Messages` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Content` longtext,
    `DateRead` datetime(6),
    `IsRead` bit NOT NULL,
    `MessageSent` datetime(6) NOT NULL,
    `RecipientDeleted` bit NOT NULL,
    `RecipientId` int NOT NULL,
    `SenderDeleted` bit NOT NULL,
    `SenderId` int NOT NULL,
    CONSTRAINT `PK_Messages` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Messages_Users_RecipientId` FOREIGN KEY (`RecipientId`) REFERENCES `Users` (`Id`) ON DELETE NO ACTION,
    CONSTRAINT `FK_Messages_Users_SenderId` FOREIGN KEY (`SenderId`) REFERENCES `Users` (`Id`) ON DELETE NO ACTION
);

CREATE TABLE `Photos` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `DateAdded` datetime(6) NOT NULL,
    `Description` longtext,
    `IsMain` bit NOT NULL,
    `PublicId` longtext,
    `Url` longtext,
    `UserId` int NOT NULL,
    CONSTRAINT `PK_Photos` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Photos_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
);

CREATE INDEX `IX_Likes_LikeeId` ON `Likes` (`LikeeId`);

CREATE INDEX `IX_Messages_RecipientId` ON `Messages` (`RecipientId`);

CREATE INDEX `IX_Messages_SenderId` ON `Messages` (`SenderId`);

CREATE INDEX `IX_Photos_UserId` ON `Photos` (`UserId`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20180609200451_mysqlinitialcreate', '2.0.1-rtm-125');

