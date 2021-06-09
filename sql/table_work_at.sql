
create table ass2.work_at 
(
	id_nhanvien varchar(6) primary key ,
    id_gatram varchar(7) not null,
    foreign key (id_nhanvien) references nhanvien(id_nhanvien)
)
