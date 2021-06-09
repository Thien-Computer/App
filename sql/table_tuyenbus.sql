drop table if exists ass2.tuyenbus;

create table ass2.tuyenbus(
	No_id int not null primary key auto_increment,
    id_tuyen varchar(4) not null,
    constraint fk_tuyen foreign key (id_tuyen) references tuyenxe(id_tuyen),
    constraint check_tuyen check( id_tuyen like 'B%'))