--      OML (Object manipulation language)
-- X Write and execute three insert statements for an autotrophic table in your database
-- X Write and execute write an update statement on one of the rows created in the previous step,
-- X Write and execute a delete statement on another row created from your insert statements.
-- X Write and execute an insert statement on a table with a foreign key from the original table.
-- Write and execute a select statement for a row using its primary key as the selector.
-- Write and execute a select statement that incorporates both a where clause and an inner-join on both tables
    -- used in this assignment.
-- Write a select statement based of off DDC-Twitter that counts the number of likes for a specific tweet.

INSERT INTO profile VALUES (HEX('1'), null, 'ariljohnson@gmail.com', 'abc123', 'ArinJ', null, HEX(123456789)),
                           (HEX('2'), null, 'feliciakeys@gmail.com', 'dogsRcool', 'PuppyFelicia', null, HEX(123456789)),
                           (HEX('3'), null, 'warren14532@yahoo.com', 'bananas!', 'BananaRama', null, HEX(123456789));

UPDATE profile SET profileDTisplayName ('ArinDaBoss') WHERE profileId = HEX(1);

DELETE FROM profile WHERE profileId = HEX(2);

INSERT INTO gameInformation VALUES (HEX('a'), (SELECT profileId FROM profile WHERE profileId = HEX('3')),
                                    'Minecraft', NULL, 'Live');

SELECT

       --
    gameId BINARY(16) NOT NULL,
    gameHost BINARY(16) NOT NULL,
    gameTitle VARCHAR(32),
    gameTags VARCHAR(16),
    gameStatus CHAR(4),

    INDEX(gameId),
    FOREIGN KEY(gameHost) REFERENCES profile(profileId),
    PRIMARY KEY(gameId)


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