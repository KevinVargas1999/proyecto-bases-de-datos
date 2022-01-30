#Vista para el conteo de las recomendaciones por pasatiempos
create view recomendaciones as 
select nombre as Pasatiempo,count(id_recomendaciones) as Se_recomienda from recomendacion_act inner join pasatiempo on pasatiempo = id_pasatiempo group by nombre;
SELECT * FROM proyecto_tercera_rueda.recomendaciones;
drop view recomendaciones;

#Vista para mostrar los usuarios menores de edad 
create view menoresusuarios as 
select nombres,apellidos,edad_actual as edad from usuario where edad_actual < 18;
SELECT * FROM proyecto_tercera_rueda.menoresusuarios;
drop view menoresusuarios;


#Vista para mostrar todos los mensajes de un grupo
create view mensajegrupo as 
SELECT g.nombre_grupo as grupo, mg.mensaje as mensajes_del_grupo FROM grupo g 
inner join mensaje_grupo mg on g.id_grupo = mg.receptor ;
SELECT * FROM proyecto_tercera_rueda.mensajegrupo;
drop view mensajegrupo;

