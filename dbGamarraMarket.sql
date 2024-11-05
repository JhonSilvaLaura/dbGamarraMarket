drop database if exists dbGamarraMarket;
create database dbGamarraMarket;
/***Default CHARACTER SET utf8;***/
use dbGamarraMarket;

create table cliente(
	id int ,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
	activo bool,
    constraint cliente_pk primary key(id)
);
show columns in cliente;

show tables;

alter table cliente
add column estado_civil char(1);

alter table cliente
 drop column fecha_nacimiento; /*drop table cliente*/
 





create table venta (
	id integer auto_increment,
    fecha_hora timestamp,
    activo bool,
    cliente_id int,
    vendedor_id int
);




/***creacion de una relacion venta_cliente ***/ 
alter table venta
add constraint venta_cliente foreign key(cliente_id)
references cliente(id)
on update cascade
on delete cascade

/***listar relaciones***/
SELECT 
	i.constraint_name, 
    k.table_name, 
    k.column_name, 
    k.referenced_table_name, 
    k.referenced_column_name
FROM
    information_schema.TABLE_CONSTRAINTS AS i
JOIN 
    information_schema.KEY_COLUMN_USAGE AS k
ON 
    i.constraint_name = k.constraint_name
AND 
    i.table_schema = k.table_schema
WHERE 
    i.constraint_type = 'FOREIGN KEY'
    AND i.table_schema = 'dbGamarraMarket';



alter table venta
drop constraint venta_cliente ;



