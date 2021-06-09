
drop table if exists ass2.ga_tram ;

create table ass2.ga_tram(
	id_gatram varchar(7) primary key,
    address varchar(50) not null,
    name_gatram varchar(30) ,
    ga_tram bool ,
    id_gl1 varchar(6) not null,
    id_gl2 varchar(6) not null,
    constraint fk_gl1_gatram foreign key (id_gl1) references giaolo(id_gl),
    constraint fk_gl2_gatram foreign key (id_gl2) references giaolo(id_gl)
)

