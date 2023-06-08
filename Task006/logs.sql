use vk;
-- Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users,
-- communities и messages в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа.

/*
select * from users;
select * from logs;
delete from users where firstname = 'Иван';
delete from communities where name = 'Общество любителей Ёжиков';
del
select * from communities limit 2;
select * from messages limit 2;


describe users;
describe communities;
describe messages;
*/
DROP TABLE IF EXISTS `logs`;

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
	SET @tableXML = (select ExtractValue(userXML, '/root/tableName') as tname);    
    SET @SQLQuery = "";

	CASE @tableXML
    WHEN 'users' THEN 
    SET @SQLQuery = CONCAT("INSERT IGNORE INTO `users` (firstname, lastname, email) VALUES ('",(select ExtractValue(userXML, '/root/user/firstname')),"','",(select ExtractValue(userXML, '/root/user/lastname')),"','",(select ExtractValue(userXML, '/root/user/email')),"')");
    WHEN 'communities' THEN 
    SET @SQLQuery = CONCAT("INSERT IGNORE INTO `communities` (name) VALUES ('",(select ExtractValue(userXML, '/root/community/name')),"')");
    WHEN 'messages' THEN 
    SET @SQLQuery = CONCAT("INSERT IGNORE INTO `messages` (from_user_id,to_user_id,body) VALUES (",(select ExtractValue(userXML, '/root/message/fromUserId')),",",(select ExtractValue(userXML, '/root/message/toUserId')),",'",(select ExtractValue(userXML, '/root/message/body')),"')");
      
    
	END CASE;
    -- select @SQLQuery;
	
    START TRANSACTION;
    
		PREPARE sqlStatement FROM @SQLQuery;
		EXECUTE sqlStatement;
		DEALLOCATE PREPARE sqlStatement;
		
		SET @LAST_INSERT_ID = LAST_INSERT_ID(); 
		SET @SQLQuery = "INSERT IGNORE INTO `logs` (TableName, IdRecords) VALUES (?,?)";
		
		PREPARE sqlStatement FROM @SQLQuery;
		EXECUTE sqlStatement USING @tableXML, @LAST_INSERT_ID;
		DEALLOCATE PREPARE sqlStatement;
    
    COMMIT;
    
END
//

DELIMITER ;

CALL addLogs(@userXml);
CALL addLogs(@communitiesXml);
CALL addLogs(@messagesXml);
select * from logs;
select * from communities order by id desc limit 2;
select * from users order by id desc limit 2;
select * from messages order by id desc limit 2;



/*
select ExtractValue(@userXml, '/root/tableName') as tname,
	ExtractValue(@userXml, '/root/message') as msg ;
    */