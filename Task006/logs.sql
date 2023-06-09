use vk;
-- Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users,
-- communities и messages в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа.

-- DROP TABLE IF EXISTS `logs`;

CREATE TABLE IF NOT EXISTS `logs`
(
	    TableName VARCHAR(255) NOT NULL
      , IdRecords BIGINT UNSIGNED NOT NULL
      , DateTimeOfRerods DATETIME DEFAULT NOW()
      , CONSTRAINT PK_log_tname_idRec PRIMARY KEY (TableName, IdRecords)
)  ENGINE=innodb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

set @userXml = '
<root>
<tableName>users</tableName>
<user>
	<firstname>Иван</firstname>
    <lastname>Иванов</lastname>
    <email>ivanov@mail.ru</email>
</user>
</root>
';

set @communitiesXml = '
<root>
<tableName>communities</tableName>
<community>
	<name>Общество любителей Ёжиков</name>
</community>
</root>
';

set @messagesXml = '
<root>
<tableName>messages</tableName>
<message>
	<fromUserId>1</fromUserId>
	<toUserId>2</toUserId>
    <body>Привет всем из Бобруйска!!!</body>
</message>
</root>
';

DROP PROCEDURE IF EXISTS addLogs;
DELIMITER //

CREATE PROCEDURE addLogs(userXML TEXT)
BEGIN
	DECLARE _rollback BIT DEFAULT 0;
    DECLARE code_error VARCHAR(45);
    DECLARE error_text VARCHAR(255);
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET _rollback = 1;
        GET STACKED DIAGNOSTICS CONDITION 1
		code_error = RETURNED_SQLSTATE, error_text = MESSAGE_TEXT;
	END;

	SET @tableXML = (select ExtractValue(userXML, '/root/tableName') as tname);    
    SET @SQLQuery = "";

    START TRANSACTION;
	
		CASE @tableXML
		WHEN 'users' THEN 
			SET @firstname = (SELECT ExtractValue(userXML, '/root/user/firstname'));
			SET @lastname = (SELECT ExtractValue(userXML, '/root/user/lastname'));
			SET @email = (SELECT ExtractValue(userXML, '/root/user/email'));
			SET @SQLQuery = CONCAT("INSERT INTO `users` (firstname, lastname, email) VALUES (?,?,?)");        
			PREPARE sqlStatement FROM @SQLQuery;
			EXECUTE sqlStatement USING @firstname, @lastname, @email;
			DEALLOCATE PREPARE sqlStatement;    
		WHEN 'communities' THEN 
			SET @nameCommunity = (SELECT ExtractValue(userXML, '/root/community/name'));
			SET @SQLQuery = CONCAT("INSERT INTO `communities` (name) VALUES (?)");
			PREPARE sqlStatement FROM @SQLQuery;
			EXECUTE sqlStatement USING @nameCommunity;
			DEALLOCATE PREPARE sqlStatement;  
		WHEN 'messages' THEN
			SET @fromUserId = (SELECT ExtractValue(userXML, '/root/message/fromUserId'));
			SET @toUserId = (SELECT ExtractValue(userXML, '/root/message/toUserId'));
			SET @body = (SELECT ExtractValue(userXML, '/root/message/body'));
			SET @SQLQuery = CONCAT("INSERT INTO `messages` (from_user_id,to_user_id,body) VALUES (?,?,?)");
			PREPARE sqlStatement FROM @SQLQuery;
			EXECUTE sqlStatement USING @fromUserId, @toUserId, @body;
			DEALLOCATE PREPARE sqlStatement;      
		END CASE;

		SET @LAST_INSERT_ID = LAST_INSERT_ID(); 
		SET @SQLQuery = "INSERT INTO `logs` (TableName, IdRecords) VALUES (?,?)";
		
		PREPARE sqlStatement FROM @SQLQuery;
		EXECUTE sqlStatement USING @tableXML, @LAST_INSERT_ID;
		DEALLOCATE PREPARE sqlStatement;
    
	IF _rollback = 1 THEN
		SELECT CONCAT("Code of error: ", code_error, ", Message of error: ", error_text) AS `error`;
        ROLLBACK;
	ELSE
        COMMIT;
	END IF;
    
END
//

DELIMITER ;

CALL addLogs(@userXml);
CALL addLogs(@communitiesXml);
CALL addLogs(@messagesXml);
select * from logs;
select * from users order by id desc limit 2;
select * from communities order by id desc limit 2;
select * from messages order by id desc limit 2;