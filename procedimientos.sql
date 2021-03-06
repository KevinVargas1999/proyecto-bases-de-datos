USE proyecto_tercera_rueda;

#Procedimientos

#Procedimiento para mostrar las recomendaciones por pasatiempo
DELIMITER //
CREATE PROCEDURE RecomendacionByPasatiempo(IN pasatiempo VARCHAR(60))
BEGIN
SELECT * FROM pasatiempo natural join recomendacion_act  WHERE nombre = pasatiempo;
END //DELIMITER ;

call RecomendacionByPasatiempo("VIAJAR");
drop procedure RecomendacionByPasatiempo;


#Procedimiento para mostrar el mensaje mandado por el usuario
DELIMITER //
CREATE PROCEDURE showMensaje(IN usuario VARCHAR(60),  OUT mensaje INT)
BEGIN
SELECT mensaje INTO mensaje FROM usuario u 
inner join mensaje_usuario mu on mu.emisor = u.cedula  WHERE emisor = usuario;
END //DELIMITER ;

call showMensaje("KEVIN ADONIS",@mensaje);
select @mensaje;
drop procedure showMensaje;

#Procedimiento para mostrar los mensajes mandado por el usuario
DELIMITER //
CREATE PROCEDURE showMensaje(IN usuario VARCHAR(60))
BEGIN
SELECT mu.mensaje as mensajes_del_usuario FROM usuario u 
inner join mensaje_usuario mu on  u.cedula = mu.emisor WHERE u.nombres = usuario;
END //DELIMITER ;

call showMensaje("KEVIN ADONIS");
drop procedure showMensaje;


#procedimiento para verificar si un usuario cumple para esa actividad
DELIMITER $$
CREATE PROCEDURE mayoredad(in cod int, in actividad varchar(50),
out	mayoredad varchar(100))  
BEGIN
DECLARE edad int;
DECLARE edad_ini int;
SELECT edad_actual into edad
FROM usuario WHERE cedula = cod;

SELECT edad_inicial into edad_ini
FROM actividades WHERE nombre = actividad;


IF edad >= edad_ini
THEN SET mayoredad = 'CUMPLE LA EDAD PARA LA ACTIVIDAD';
ELSEIF edad < edad_ini
THEN SET mayoredad = 'NO CUMPLE LA EDAD PARA LA ACTIVIDAD';
END IF;  
END$$ 
DELIMITER ;


call mayoredad(0145871111,"SPINNIGN", @mensaje);
select @mensaje;
drop procedure mayoredad;
