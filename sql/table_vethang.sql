create table ass2.vethang(
	id_ve varchar(16) primary key ,
     id_tuyen varchar(4) not null ,
     id_gatram1 varchar(7) not null,
     id_gatram2 varchar(7) not null,
      foreign key (id_ve) references ve(id_ve),
    foreign key (id_tuyen) references tuyenxe(id_tuyen),
    foreign key (id_gatram1) references ga_tram(id_gatram),
    foreign key (id_gatram2) references ga_tram(id_gatram),
    check (id_ve like 'VM%')
);

DROP TRIGGER IF EXISTS update_giavethang;

DELIMITER $$
CREATE TRIGGER update_giavethang
BEFORE INSERT ON ass2.vethang
FOR EACH ROW
BEGIN
	DECLARE so_gatram_dung INT DEFAULT 0; 
    DECLARE gatramlen VARCHAR(7);
    DECLARE gatramxuong VARCHAR(7);
	DECLARE tau_or_bus INT;
    DECLARE matuyen VARCHAR(4);
	DECLARE dongia_tuyentau INT DEFAULT 0;
    DECLARE dongiatau INT DEFAULT 0;
    DECLARE dongia_bus INT DEFAULT 0;
    DECLARE hanhkhachid varchar(8);
    DECLARE giave INT DEFAULT 0;
    DECLARE nghenghiep varchar (50);
    DECLARE ngaymua DATETIME;
    DECLARE ngaymua_vetruocdo DATETIME;
    DECLARE tram1 INT;
    DECLARE tram2 INT;
    
    SET matuyen = NEW.id_tuyen;
    
    INSERT INTO debug(val2) value (matuyen);
    -- bus
    IF EXISTS(SELECT id_tuyen FROM tuyenbus WHERE id_tuyen=matuyen) THEN 
		SET tau_or_bus = 1;
        SET gatramlen = NEW.id_gatram1;
        SET gatramxuong = NEW.id_gatram2;
		SELECT stt_tramdung INTO tram1 FROM ghe_gas_tram WHERE id_tuyen=matuyen AND id_gatram=gatramlen LIMIT 1;
        SELECT stt_tramdung INTO tram2 FROM ghe_gas_tram WHERE id_tuyen=matuyen AND id_gatram=gatramxuong LIMIT 1;
		SET so_gatram_dung = ABS(tram1 - tram2);
	-- tau
    ELSEIF EXISTS(SELECT id_tuyen FROM tuyentau WHERE matuyen = id_tuyen) THEN
		SET tau_or_bus = 0;
		SELECT dongia INTO dongia_tuyentau FROM tuyentau WHERE matuyen=id_tuyen;
		SET gatramlen = NEW.id_gatram1;
        SET gatramxuong = NEW.id_gatram2;
        SELECT stt_tramdung INTO tram1 FROM ghe_gas_tram WHERE id_tuyen=matuyen AND id_gatram=gatramlen LIMIT 1;
        SELECT stt_tramdung INTO tram2 FROM ghe_gas_tram WHERE id_tuyen=matuyen AND id_gatram=gatramxuong LIMIT 1;
		SET so_gatram_dung = ABS(tram1 - tram2);

	END IF;
    -- gia bus thang
    IF (tau_or_bus = 1) THEN
		SELECT gia_xebus INTO dongia_bus FROM banggia;
        SET giave = dongia_bus * CEILING(so_gatram_dung/2) * 20 * 2;
	-- gia tau thang
    ELSEIF (tau_or_bus = 0) THEN
		SET giave = dongia_tuyentau * CEILING(so_gatram_dung/2) * 20 * 2;
	END IF;
    
    -- hoc sinh giam 50%
    SELECT id_hanhkhach INTO hanhkhachid FROM ve WHERE id_ve=NEW.id_ve;
    SELECT job INTO nghenghiep FROM hanhkhach WHERE id_hanhkhach = hanhkhachid;
    
     IF (LOWER(nghenghiep) = 'sinh vien') THEN
 		SET giave = giave/2;
 	ELSE 
     -- trong mô tả bài tậpp lớn 2 không có nói phần cột chỉ ngày bắt đầu sử dụng vé tháng, nên assume là ngày bắt đầu sử dụng là ngày mua
 		SELECT buy_at INTO ngaymua FROM ve WHERE NEW.id_ve = ve.id_ve;
         IF EXISTS (SELECT buy_at FROM ve 
         WHERE buy_at != ngaymua AND id_hanhkhach =hanhkhachid  AND DATEDIFF(ngaymua, buy_at) <= 20) THEN
 			SET giave = giave - 10/100 * giave;
 		END IF;
 	END IF;
    
	UPDATE ve
    SET gia_ve = giave
    WHERE id_ve = NEW.id_ve;   

END$$
DELIMITER ;