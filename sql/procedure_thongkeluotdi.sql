DELIMITER $$
 
DROP PROCEDURE IF EXISTS  ass2.thongkeluotnguoi $$
 
CREATE PROCEDURE  ass2.thongkeluotnguoi (
    IN input_idtuyen VARCHAR(4), 
    in input_daybegin date ,
    in input_dayend date 
    
)
BEGIN
	 select op.used_at as Ngay, sum(op.soluot) as`So luot` from (
    select used_at  , count(used_at) as soluot
     from vele
     where id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
     group by used_at 
     union all
     select used_at, count(used_at)  
     from vethang_action
     join vethang on vethang_action.id_ve = vethang.id_ve 
     where vethang.id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
     group by used_at  
	 union all
    select d.used_at, count(ac.id_ve) 
    from ve_1ngay d 
    join ve_1ngay_action ac on   ac.id_ve =d.id_ve 
	where ac.id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
    group by used_at) as op
    group by Ngay
    order by Ngay
    ;
    
 END$$
  
DELIMITER ;