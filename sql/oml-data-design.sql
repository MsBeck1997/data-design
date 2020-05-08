--      OML (Object manipulation language)


-- X Write and execute three insert statements for an autotrophic table in your database
INSERT INTO profile VALUES (HEX('1'), null, 'ariljohnson@gmail.com', 'abc123', 'ArinJ', null, HEX(123456789)),
                           (HEX('2'), null, 'feliciakeys@gmail.com', 'dogsRcool', 'PuppyFelicia', null, HEX(123456789)),
                           (HEX('3'), null, 'warren14532@yahoo.com', 'bananas!', 'BananaRama', null, HEX(123456789));

-- X Write and execute write an update statement on one of the rows created in the previous step,
UPDATE profile SET profileDisplayName = 'ArinDaBoss' WHERE profileId = HEX(1);

-- X Write and execute a delete statement on another row created from your insert statements.
DELETE FROM profile WHERE profileId = HEX(2);

-- X Write and execute an insert statement on a table with a foreign key from the original table.
INSERT INTO gameInformation VALUES (HEX('a'), (SELECT profileId FROM profile WHERE profileId = HEX('3')),
                                    'Minecraft', NULL, 'Live');

-- X Write and execute a select statement for a row using its primary key as the selector.
SELECT * FROM profile WHERE profileId = HEX('1');

-- X Write and execute a select statement that incorporates both a where clause and an inner-join on both tables
--      used in this assignment.
SELECT * FROM profile WHERE profileId = HEX('1') INNER JOIN profile.profileId = gameInformation.gameHost;

-- Write a select statement based of off DDC-Twitter that counts the number of likes for a specific tweet.
--      Using information not currently in SQL tables, this is realistic fiction - DO NOT RUN
SELECT likeProfileId FROM like WHERE likeTweetId = UNHEX('exampleId')