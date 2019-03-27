USE rooster_fights;

DELIMITER //
CREATE PROCEDURE fill_rooster(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Rooster (owner_id, name, breed)
            VALUES (FLOOR(RAND() * 150),
                    CONCAT('name', i),
                    CONCAT('breed', CONVERT(FLOOR(RAND() * 10), CHAR)));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL fill_rooster(200);