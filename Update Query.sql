SET GLOBAL log_bin_trust_function_creators = 1;
SET SQL_SAFE_UPDATES = 0;
-- Drop the function if it already exists
DROP FUNCTION IF EXISTS InitCap;
DELIMITER $$

-- Create the function InitCap
CREATE FUNCTION `InitCap`(x VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE charLen INT;
    DECLARE counter INT;
    DECLARE returnValue VARCHAR(255);
    DECLARE currentChar CHAR(1);
    DECLARE prevChar CHAR(1);
	DECLARE currentCharASCII INT;
    DECLARE prevCharASCII INT;
    SET charLen = CHAR_LENGTH(x);
    SET counter = 1;
    SET returnValue = x;
    SET prevChar = ' ';
    SET prevCharASCII = ASCII(' ');

    WHILE counter <= charLen DO
        SET currentChar = SUBSTRING(x, counter, 1);
        SET currentCharASCII = ASCII(SUBSTRING(x, counter, 1));
        -- Check if the previous character was a space or punctuation using ASCII values:
        -- Space (32), Hyphen (45), Underscore (95), Slash (47), Ampersand (38), Apostrophe (39), Period (46)
        IF prevCharASCII IN (32, 45, 95, 47, 38, 39, 46) THEN
            SET returnValue = INSERT(returnValue, counter, 1, UPPER(currentChar));
        END IF;
        SET prevChar = currentChar;
        SET prevCharASCII = currentCharASCII;
        SET counter = counter + 1;
    END WHILE;

    RETURN returnValue;
END$$
DELIMITER ;

-- Apply InitCap function to update the spc_latin column in your table
UPDATE NY_Trees_Data
SET spc_latin = InitCap(spc_latin);
