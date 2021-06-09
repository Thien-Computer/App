
drop table if exists ass2.doanduong;

 create table ass2.doanduong(
	id_gl1 varchar(10) not null,
    id_gl2 varchar(10) not null, 
    id_cd  varchar (10) not null,
    stt int not null,
    length  DECIMAL(8,2) ,
    constraint fk_gl1 foreign key (id_gl1 ) references giaolo(id_gl),
    constraint fk_gl2 foreign key (id_gl2 ) references giaolo(id_gl),
    constraint fk_cd foreign key (id_cd) references  conduong(id_cd)
    
 )