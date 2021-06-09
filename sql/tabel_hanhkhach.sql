

drop table if exists ass2.hanhkhach;

create table ass2.hanhkhach(
	id_hanhkhach varchar(8) primary key ,
    cmnd_cccd varchar(12)  unique,
    job varchar(50) ,
	phone_number varchar(10) unique,
    sex varchar(10) ,
    email varchar(30) ,
    birth date 
);
drop trigger  if exists ass2.id_hanhkhach;

DELIMITER $$
CREATE TRIGGER ass2.id_hanhkhac
BEFORE INSERT ON ass2.hanhkhach
FOR EACH ROW
BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.hanhkhach;
   
  SET NEW.id_hanhkhach = CONCAT('KH', LPAD(CAST(total + 1 AS CHAR),6,'0'));
END$$
DELIMITER ;	