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


