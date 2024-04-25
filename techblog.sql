CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT 'Hey user',
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
);

CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
);

CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `catId` (`catId`),
  KEY `userId` (`userId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`),
  UNIQUE KEY `unique_like` (`pid`, `uid`), -- Unique constraint to prevent multiple likes per post by user
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `remail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message` longtext NOT NULL,
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);