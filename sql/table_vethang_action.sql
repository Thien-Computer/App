drop table if exists ass2.vethang_action ;

create table ass2.vethang_action
(
	id_ve varchar(16) not null ,
    used_at date not null,
    time_in time not null,
    time_out time not null,
     id_gatram_len varchar(7) not null,
     id_gatram_xuong varchar(7) not null,
     foreign key (id_ve) references ass2.vethang(id_ve), 
    foreign key (id_gatram_len) references ga_tram(id_gatram),
    foreign key (id_gatram_xuong) references ga_tram(id_gatram),
    check(time_in<time_out)

);
 
drop TRIGGER if exists ass2.check_gatram;
DELIMITER $$

CREATE TRIGGER  ass2.check_gatram
BEFORE INSERT
ON vethang_action FOR EACH ROW
BEGIN 
	 DECLARE id_1 varchar(7) ;
      DECLARE id_2 varchar(7) ;
	SELECT id_gatram1,id_gatram2 INTO id_1,id_2
    from vethang
    where id_ve = new.id_ve ;  
     IF (  NOT id_1=new.id_gatram_len OR  NOT id_2 = new.id_gatram_xuong) THEN
       set new.id_ve = '0';
	ELSE 
		set new.id_ve = new.id_ve;
    END IF; 

END $$

DELIMITER ;