DELIMITER $$
 
DROP PROCEDURE IF EXISTS  ass2.chuyenxe $$
 
CREATE PROCEDURE  ass2.chuyenxe( 
)
BEGIN
	select id_tuyen,max(stt) as `sum` from chuyenxe
    group by id_tuyen;
    
 END$$
  
DELIMITER ;