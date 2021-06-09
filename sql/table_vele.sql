
drop table if exists ass2.vele;
create table ass2.vele(
	id_ve varchar(16) primary key ,
    id_tuyen varchar(4) not null ,
    used_at date not null,
    id_gatram_len varchar(7) not null,
     id_gatram_xuong varchar(7) not null,
    time_in time not null,
    time_out time not null,
    foreign key (id_ve) references ve(id_ve),
    foreign key (id_tuyen) references tuyenxe(id_tuyen),
    foreign key (id_gatram_len) references ga_tram(id_gatram),
    foreign key (id_gatram_xuong) references ga_tram(id_gatram),
	check (id_ve like 'VO%')
);

DROP TRIGGER IF EXISTS update_giave_le; 

DELIMITER $$
CREATE TRIGGER update_giave_le
BEFORE INSERT ON vele
FOR EACH ROW
BEGIN
	DECLARE so_gatram_dung INT DEFAULT 0; 
    DECLARE gatramlen VARCHAR(7);
    DECLARE gatramxuong VARCHAR(7);
	DECLARE tau_or_bus INT;
    DECLARE ma_tuyen VARCHAR(4);
	DECLARE dongia_tuyentau INT DEFAULT 0;
    DECLARE dongiatau INT DEFAULT 0;
    DECLARE dongia_bus INT DEFAULT 0;
    DECLARE hanhkhachid varchar(8);
    DECLARE giave INT;

	SET ma_tuyen = NEW.id_tuyen;
    
    IF EXISTS(SELECT id_tuyen FROM tuyenbus WHERE ma_tuyen = id_tuyen) THEN 
		SET tau_or_bus = 1;
		SET gatramlen = NEW.id_gatram_len;
        SET gatramxuong = NEW.id_gatram_xuong;
        SET so_gatram_dung = ABS((SELECT stt_tramdung FROM ghe_gas_tram WHERE id_tuyen=ma_tuyen AND id_gatram=gatramlen LIMIT 1) -
							     (SELECT stt_tramdung FROM ghe_gas_tram WHERE id_tuyen=ma_tuyen AND id_gatram=gatramxuong LIMIT 1));
	 ELSEIF EXISTS(SELECT id_tuyen FROM tuyentau WHERE matuyen = id_tuyen) THEN
		SET tau_or_bus = 0;
		SELECT dongia INTO dongia_tuyentau FROM tuyentau WHERE id_tuyen = ma_tuyen;
        SET gatramlen = NEW.id_gatram_len;
        SET gatramxuong = NEW.id_gatram_xuong;
        SET so_gatram_dung = ABS((SELECT stt_tramdung FROM ghe_gas_tram WHERE id_tuyen=ma_tuyen AND id_gatram=gatramlen LIMIT 1) -
							     (SELECT stt_tramdung FROM ghe_gas_tram WHERE id_tuyen=ma_tuyen AND id_gatram=gatramxuong LIMIT 1));
	END IF;
	 -- gia bus 
    IF (tau_or_bus = 1) THEN
		SELECT gia_xebus INTO dongia_bus FROM banggia;
        SET giave = dongia_bus * CEILING(so_gatram_dung/2);
	-- gia tau 
    ELSEIF (tau_or_bus = 0) THEN
		SET giave = dongia_tuyentau * CEILING(so_gatram_dung/2);
	END IF;
	
    UPDATE ve
    SET `ve`.`gia_ve` = giave
    WHERE id_ve = NEW.id_ve;   


END$$ 
DELIMITER ;

