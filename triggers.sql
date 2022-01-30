
create table backup_log_insertar(
	usuario int primary key,
    nombre varchar(50),
    fecha_de_insercion date
);

#Trigger para crear un historial de las inserciones por usuario 
DELIMITER $$
create trigger evento_insertar before insert on usuario 
for each row
begin
insert into backup_log_insertar 
set usuario = new.cedula,
nombre = new.Nombres,
fecha_de_insercion = now();
end $$
DELIMITER ;

INSERT INTO USUARIO VALUES('0945245211', 'MARQUITO OSWALDITO', 'VARGAS TIXE', '1942-01-24', 15, 'HOMBRE', 961478520);

select * from backup_log_insertar;
drop trigger evento_insertar;


#Trigger para actualizar la presencialidad, es decir si quiero virtualidad por obvias razones no quiero presencialidad 
DELIMITER //
create trigger evento_actualizar before update on recomendacion_act 
for each row
begin
	 if(new.virtualidad = "VIRTUAL-SI" ) then	
		set new.presencial = "PRESENCIAL-NO";
	 end if;
end //
DELIMITER ;

update recomendacion_act set virtualidad = "VIRTUAL-SI" where cedula_usuario = "0789654456";
select * from recomendacion_act;

#Trigger para eliminar un pasatiempo sin errores
DELIMITER //
create trigger evento_eliminar before delete on pasatiempo
for each row
begin
	declare pasatiempoid int;
    select id_pasatiempo into pasatiempoid from pasatiempo where id_pasatiempo != old.id_pasatiempo limit 1; 
	update recomendacion_act set pasatiempo = pasatiempoid where pasatiempo = old.id_pasatiempo;
end //
DELIMITER ;


delete from pasatiempo where id_pasatiempo = 1004;
select * from pasatiempo;
drop trigger evento_eliminar;
