create table ass2.ve_1ngay_action(
	id_ve varchar(16) not null,
     id_tuyen varchar(4) not null ,
     id_gatram_len varchar(7) not null,
     id_gatram_xuong varchar(7) not null,
      time_in time not null,
    time_out time not null,
      foreign key (id_ve) references ve_1ngay(id_ve), 
      foreign key (id_tuyen) references tuyenxe(id_tuyen),
       foreign key (id_gatram_len) references ga_tram(id_gatram),
    foreign key (id_gatram_xuong) references ga_tram(id_gatram),
    check(time_in<time_out)
)