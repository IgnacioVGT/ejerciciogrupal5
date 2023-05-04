/*Parte 1: Crear entorno de trabajo
- Crear una base de datos
- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.*/

create database grupal5;
use grupal5;
CREATE USER 'admin' IDENTIFIED BY 'qwer1234';
GRANT ALL PRIVILEGES ON grupal5.* TO 'admin';

/*Parte 2: Crear dos tablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
fecha-hora actual)).*/

CREATE TABLE usuarios (
    id_usu INT AUTO_INCREMENT primary key,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    contraseña VARCHAR(50),
    zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
    género VARCHAR(10),
    telefono VARCHAR(20)
);

CREATE TABLE ingresos (
    id_ingreso INT AUTO_INCREMENT primary key,
    id_usu INT,
    fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usu) REFERENCES usuarios(id_usu)
);

/*Parte 3: Modificación de la tabla
- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.*/

ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2';

/*Parte 4: Creación de registros.
- Para cada tabla crea 8 registros.*/

INSERT INTO usuarios (nombre, apellido, contraseña, género, telefono) VALUES
('Juan', 'Pérez', 'password123', 'Masculino', '+541112345678'),
('María', 'González', 'qwerty456', 'Femenino', '+541155555555'),
('Pedro', 'Rodríguez', 'securepass', 'Masculino', '+541122222222'),
('Lucía', 'López', 'mypassword', 'Femenino', '+541199999999'),
('Jorge', 'García', 'contraseña', 'Masculino', '+541133333333'),
('Ana', 'Martínez', '12345678', 'Femenino', '+541144444444'),
('Luis', 'Fernández', '987654321', 'Masculino', '+541177777777'),
('Carla', 'Gómez', 'testpass', 'Femenino', '+541188888888');

INSERT INTO ingresos (id_usu) VALUES /*llamo a id_usu para solo llenar esa columna ya que las demas se llenan de forma "automatica"*/
(1), (2), (3), (4), (5), (6), (7), (8);

/*Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?*/

/*id_usu y id_ingreso son del tipo INT ya que es necesario llevar un identificador unico*/
/*nombre y apellido son de clase VARCHAR ya que ambos son texto y ademas son variables*/
/*contraseña es un varchar ya que es necesario tener letras y caracteres especiales*/
/*zona horaria, telefono, genero son de la clase varchar ya que es necesario llevar un 
registro grande en los 3 casos ademas de almacenar caracteres especiales en zona horaria*/

/*Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
correo electronico).*/

CREATE TABLE contactos (
    id_contacto INT NOT NULL AUTO_INCREMENT,
    id_usu INT NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_contacto),
    FOREIGN KEY (id_usu) REFERENCES usuarios(id_usu)
);

/*Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
tabla Contactos.*/

ALTER TABLE usuarios add COLUMN id_contacto int;
ALTER TABLE usuarios ADD CONSTRAINT id_contacto FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);




