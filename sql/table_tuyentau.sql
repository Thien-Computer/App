drop table if exists ass2.tuyentau;

create table ass2.tuyentau(
	id_tau varchar(1)  primary key ,
    name_tau varchar(30)  not null unique,
    dongia int ,
    id_tuyen varchar(4) not null,
    constraint fk_tuyentau foreign key (id_tuyen) references tuyenxe(id_tuyen),
    constraint check_tuyentau check( id_tuyen like 'T%'))