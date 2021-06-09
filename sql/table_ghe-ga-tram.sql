drop table if exists ass2.ghe_gas_tram;
create table ass2.ghe_gas_tram(
	id_tuyen varchar(4) not null,
    stt int not null,
    id_gatram varchar(7) not null,
    stt_tramdung int not null,
    time_begin 	 time not null,
    time_stop  time not null,
    foreign key (id_tuyen,stt)  references chuyenxe(id_tuyen,stt), 
    foreign key (id_gatram) references ga_tram(id_gatram),
    primary key (id_tuyen,stt,id_gatram,stt_tramdung) 
    
)