
drop table if exists ass2.nhanvien;
create table 	ass2.nhanvien (
	id_nhanvien varchar(6) primary key ,
    type_job varchar(30),
    birth date ,
    email varchar(30),
    sex varchar(10),
    phone_public varchar(11),
    phone_private varchar(11) 
);


drop trigger  if exists ass2.id_nhanvien

DELIMITER $$
CREATE TRIGGER ass2.id_nhanvien
BEFORE INSERT ON ass2.nhanvien
FOR EACH ROW
BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.nhanvien;
   
  SET NEW.id_nhanvien = CONCAT('NV', LPAD(CAST(total + 1 AS CHAR),4,'0'));
END$$
DELIMITER ;	
