 drop table if exists ass2.chuyenxe;
create table ass2.chuyenxe (
	id_tuyen varchar(4) not null,
    stt int not null,
    CONSTRAINT PK_chuyenxe PRIMARY KEY (id_tuyen,stt)
)

