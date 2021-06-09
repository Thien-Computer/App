
drop table if exists ass2.giaolo;

create table ass2.giaolo( 
    id_gl varchar(6) not null primary key default '0',
    l_at decimal(10,3) not null,
    l_ong decimal (10,3) not null
);

drop trigger  if exists ass2.id_giaolo;

DELIMITER $$
CREATE TRIGGER ass2.id_giaolo
BEFORE INSERT ON ass2.giaolo
FOR EACH ROW
BEGIN
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.giaolo;
  SET NEW.id_gl = CONCAT('GL',CAST(total + 1 AS CHAR));
END$$
DELIMITER ;	