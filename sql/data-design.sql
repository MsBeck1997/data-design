-- The statement below sets the collation of the database to utf8
ALTER DATABASE sbeck10 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- Drop Tables
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS gameInformation;
DROP TABLE IF EXISTS subscribe;

-- Tables
CREATE TABLE profile (
    profileId BINARY(16) NOT NULL,
    profileActivationToken CHAR(32),
    profileEmail VARCHAR(128) NOT NULL,
    profileHash CHAR(32) NOT NULL,
    profileDisplayName VARCHAR(20) NOT NULL,
    profilePanels VARCHAR(128),
    profileStreamKey BINARY(16) NOT NULL,

    UNIQUE(profileDisplayName),
    UNIQUE(profileStreamKey),
    PRIMARY KEY(profileId)
);

CREATE TABLE gameInformation (
    gameId BINARY(16) NOT NULL,
    gameHost BINARY(16) NOT NULL,
    gameTitle VARCHAR(32),
    gameTags VARCHAR(16),
    gameStatus CHAR(4),

    INDEX(gameId),
    FOREIGN KEY(gameHost) REFERENCES profile(profileId),
    PRIMARY KEY(gameId)
);

CREATE TABLE subscribe (
    subscribeProfileId BINARY(16) NOT NULL,
    subscribeGameId BINARY(16) NOT NULL,
    subscribeLevel TINYINT UNSIGNED NOT NULL,

    INDEX(subscribeProfileId),
    INDEX(subscribeGameId),
    FOREIGN KEY(subscribeProfileId) REFERENCES profile(profileId),
    FOREIGN KEY(subscribeGameId) REFERENCES gameInformation(gameId),
    PRIMARY KEY (subscribeProfileId, subscribeGameId)
);