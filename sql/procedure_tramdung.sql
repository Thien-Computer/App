DELIMITER $$
 
DROP PROCEDURE IF EXISTS  ass2.ghe_tram $$
 
CREATE PROCEDURE  ass2.ghe_tram(  
 IN input_idtuyen VARCHAR(4),
 In input_stt int 
)
BEGIN
	select g.stt_tramdung, g.id_gatram,gt.name_gatram , g.time_begin,g.time_stop from ghe_gas_tram g
    join ga_tram gt on g.id_gatram = gt.id_gatram
    where g.id_tuyen = input_idtuyen and g.stt = input_stt
    group by g.stt_tramdung;
    
 END$$
  
DELIMITER ;