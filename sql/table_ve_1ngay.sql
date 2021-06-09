
drop table if exists ass2.ve_1ngay;
create table ass2.ve_1ngay(
	 id_ve varchar(16) primary key ,	
      used_at date not null,  
      foreign key (id_ve) references ve(id_ve),
      check(id_ve like 'VD%')
);

DROP TRIGGER IF EXISTS ass2.update_giave_ngay;

DELIMITER $$
CREATE TRIGGER update_giave_ngay
BEFORE INSERT ON ve_1ngay
FOR EACH ROW
BEGIN
	DECLARE giave INT;
    DECLARE ngaymua DATETIME;
    
    SELECT buy_at INTO ngaymua WHERE NEW.id_ve = id_ve;
    IF(DAYOFWEEK(ngaymua)=1 OR DAYOFWEEK(ngaymua)=7) THEN
		SELECT day_last_week INTO giave FROM banggia;
	ELSE
		SELECT day_in_week INTO giave FROM banggia;
	END IF;
    
    UPDATE ve
    SET gia_ve = giave
    WHERE NEW.id_ve = id_ve;
END$$
DELIMITER ;
