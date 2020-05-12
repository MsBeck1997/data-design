--      OML (Object manipulation language)


-- Write and execute three insert statements for an autotrophic table in your database
INSERT INTO profile VALUES (UNHEX('1ed673e1153044199b6cf38f920dacf0'), null, 'arinjohnson@gmail.com', 'abc123', 'ArinJ', null, HEX(123456789)),
                           (UNHEX('2ed673e1153044199b6cf38f920dacf0'), null, 'feliciakeys@gmail.com', 'dogsRcool', 'PuppyFelicia', null, HEX(223456789)),
                           (UNHEX('3ed673e1153044199b6cf38f920dacf0'), null, 'warren14532@yahoo.com', 'bananas!', 'BananaRama', null, HEX(323456789));

-- Write and execute write an update statement on one of the rows created in the previous step,
UPDATE profile SET profileDisplayName = 'ArinDaBoss' WHERE profileId = HEX('1ed673e1153044199b6cf38f920dacf0');

-- Write and execute a delete statement on another row created from your insert statements.
DELETE FROM profile WHERE profileId = HEX('2ed673e1153044199b6cf38f920dacf0');

-- Write and execute an insert statement on a table with a foreign key from the original table.
INSERT INTO gameInformation VALUES (UNHEX('aed673e1153044199b6cf38f920dacf0'), (SELECT profileId FROM profile
                                    WHERE (profileId = HEX('1ed673e1153044199b6cf38f920dacf0'))),'Minecraft',
                                    NULL, 'Live');

-- Write and execute a select statement for a row using its primary key as the selector. ERROR
SELECT HEX(profileId),profileDisplayName FROM profile WHERE profileId = UNHEX('1ed673e1153044199b6cf38f920dacf0');

-- Write and execute a select statement that incorporates both a where clause and an inner-join on both tables
--      used in this assignment.
SELECT profileDisplayName FROM profile INNER JOIN gameInformation ON profile.profileId = gameInformation.gameHost;

-- Write a select statement based of off DDC-Twitter that counts the number of likes for a specific tweet.
--      Using information not currently in SQL tables, this is realistic fiction - DO NOT RUN
SELECT likeProfileId FROM like WHERE likeTweetId = UNHEX('exampleId')
