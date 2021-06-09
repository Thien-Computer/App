 
    drop  table if exists ass2.ve ;
 
create table ass2.ve(
	id_ve varchar(16) primary key, 
    loai_ve int not null,
	gia_ve int DEFAULT NULL,
    buy_at datetime ,
    id_hanhkhach  varchar(8) not null,
     check(loai_ve<3)
    );
    
DROP TRIGGER if exists update_giave;    
drop trigger  if exists ass2.update_tt_ve;

DELIMITER $$
CREATE TRIGGER ass2.update_tt_ve
BEFORE INSERT ON ass2.ve
FOR EACH ROW
BEGIN
   DECLARE loai int  ; 
    DECLARE mot int  ;  
    DECLARE hai int  ; 
     DECLARE ba int  ; 
	DECLARE bon int  ; 
       DECLARE key_ve varchar(1) ; 
	
    -- 0: tau, 1: bus

    
    set loai = new.loai_ve;
	
    select gia_xebus,day_in_week,day_last_week,month_one into mot,hai,ba,bon
    from banggia;
	 if (loai=1) then 
         set key_ve = 'M';
		elseif (loai=2 and DAYNAME(now())= 'Sunday') then 
         set key_ve = 'D';
         elseif (loai=2 ) then 
          set key_ve = 'D';
		else 
         set key_ve = 'O';
    end if ;
     set new.buy_at = DATE_FORMAT( CURRENT_TIMESTAMP(),'%Y-%m-%d %H:%i:%s');
     set new.id_ve =  concat('V',key_ve,DATE_FORMAT( CURRENT_TIMESTAMP(),'%d%m%Y%H%i%s'));
   END$$
  
DELIMITER ;	

  