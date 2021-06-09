DELIMITER $$
 
DROP PROCEDURE IF EXISTS  ass2.lotrinh $$
 
CREATE PROCEDURE  ass2.lotrinh (
    IN input_idtuyen VARCHAR(4)   
)
BEGIN 
    SELECT  group_concat(name_gatram) as `Lộ Trình`  FROM ass2.ghe_gas_tram GGT 
    join ga_tram GT on GGT.id_gatram = GT.id_gatram
    where GGT.stt= 1 and input_idtuyen = GGT.id_tuyen;
	
END$$
  
DELIMITER ;