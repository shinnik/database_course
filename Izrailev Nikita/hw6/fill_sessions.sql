USE rooster_fights;

DELIMITER //
CREATE PROCEDURE fill_session(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Session (owner_id, begin_dttm, end_dttm)
            VALUES (FLOOR(RAND() * 149),
                    FROM_UNIXTIME(UNIX_TIMESTAMP('2019-03-25 15:11:11') + FLOOR(0 + (RAND() * 10800))),
                    FROM_UNIXTIME(UNIX_TIMESTAMP('2019-03-25 18:11:11') + FLOOR(0 + (RAND() * 14400))));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL fill_session(400);
# SELECT FROM_UNIXTIME(1553520288);