
drop table if exists ass2.conduong;

create table ass2.conduong(
	 
    id_cd varchar(6) not null primary key default '0',
    name char(50) not null
);

drop trigger  if exists ass2.id_conduong;

DELIMITER $$
CREATE TRIGGER ass2.id_conduong
BEFORE INSERT ON ass2.conduong
FOR EACH ROW
BEGIN
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.conduong;
  SET NEW.id_cd = CONCAT('CD',CAST(total + 1 AS CHAR));
END$$
DELIMITER ;	