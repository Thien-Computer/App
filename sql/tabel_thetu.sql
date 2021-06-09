
drop table if exists ass2.thetu;

create table ass2.thetu(
	 id_thetu varchar(8) primary key ,
     buy_at datetime not null,
     id_hanhkhach varchar(8) not null,
     foreign key (id_hanhkhach) references hanhkhach(id_hanhkhach)
     
);

drop trigger  if exists ass2.id_thetu

DELIMITER $$
CREATE TRIGGER ass2.id_thetu
BEFORE INSERT ON ass2.thetu
FOR EACH ROW
BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.thetu; 
  SET NEW.id_thetu = CONCAT('TT', LPAD(CAST(total + 1 AS CHAR),6,'0'));
END$$
DELIMITER ;	