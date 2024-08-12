REVISAR ESTE DOCUMENTO 

https://docs.google.com/document/d/14i6XQE18owVYUlYjAqZSjpwvLNTg3g8-Jpc-9YbWT4g/edit?usp=sharing


paso 1 

iniciar sesion en: https://labs.play-with-docker.com/

Paso 2

seleccionamos la opcion +ADD NEW INSTANCE

paso 3
copiar y pegar el siguiente comando

docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=tu_contraseña -d bitnami/mysql:latest

paso 4
copiar y pegar el siguiente comando

docker exec -it mysql-container mysql -uroot -p

paso 5 
copiar y pegar la contraseña asignada anteriormente

tu_contraseña

paso 6

CREATE DATABASE centro_educativo;

paso 7

USE centro_educativo;

paso 8

CREATE TABLE Alumnos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Alumno VARCHAR(255) NOT NULL,
    Fecha_Nacimiento DATE,
    Direccion VARCHAR(255),
    Correo_Electronico VARCHAR(255)
);

CREATE TABLE Departamentos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Departamento VARCHAR(255) NOT NULL,
    Ubicacion VARCHAR(255)
);

CREATE TABLE Docentes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Docente VARCHAR(255) NOT NULL,
    Departamento_ID INT,
    Titulo_Academico VARCHAR(255),
    FOREIGN KEY (Departamento_ID) REFERENCES Departamentos(ID)
);

CREATE TABLE Cursos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Curso VARCHAR(255) NOT NULL,
    Departamento_ID INT,
    Duracion_Curso INT,
    Creditos INT,
    FOREIGN KEY (Departamento_ID) REFERENCES Departamentos(ID)
);

CREATE TABLE Matriculas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Alumno_ID INT,
    Curso_ID INT,
    Fecha_Matricula DATE,
    Estado_Matricula VARCHAR(50),
    FOREIGN KEY (Alumno_ID) REFERENCES Alumnos(ID),
    FOREIGN KEY (Curso_ID) REFERENCES Cursos(ID)
);


-----------------------Datos-----------------------------


INSERT INTO Alumnos (Nombre_Alumno, Fecha_Nacimiento, Direccion, Correo_Electronico)
VALUES ('Cayo Phocco', '2000-11-21', 'Calle rosales 123', 'cayo.phocco@gmail.com'),
('Alberto Machacca', '2001-05-21', 'Calle Lujan 123', 'alberto.machacca@gmail.com'),
('Alan García', '1961-05-21', 'Mar de Bolivia 123', 'alan.garcia@gmail.com');


INSERT INTO Departamentos (Nombre_Departamento, Ubicacion)
VALUES ('Ciencias de la Computación', 'Edificio A'),
('Estudios Generales', 'Edificio B'),
('Mecanica', 'Edificio C');


INSERT INTO Docentes (Nombre_Docente, Departamento_ID, Titulo_Academico)
VALUES ('Juan Pérez', 1, 'Ingeniero en Computación');


INSERT INTO Cursos (Nombre_Curso, Departamento_ID, Duracion_Curso, Creditos)
VALUES ('Introducción a la Programación', 1, 60, 4),
('Fundamentos de la economía', 2, 60, 4),
('Mecánica de fluidos', 3, 60, 4);


INSERT INTO Matriculas (Alumno_ID, Curso_ID, Fecha_Matricula, Estado_Matricula)
VALUES (1, 1, '2024-08-11', 'Activa'),
(2, 2, '2024-08-11', 'Activa'),
(3, 3, '2024-08-11', 'Activa');


CONSULTAS SQL

Escribe una consulta SQL que muestre todos los alumnos matriculados en un curso
específico.

USE centro_educativo;

SELECT A.Nombre_Alumno
FROM Alumnos A
INNER JOIN Matriculas M ON A.ID = M.Alumno_ID
WHERE M.Curso_ID = 3;



Escribe una consulta SQL que muestre todos los cursos en los que un docente específico está
asignado como instructor.

USE centro_educativo;

SELECT C.Nombre_Curso
FROM Cursos C
INNER JOIN Docentes D ON C.Departamento_ID = D.Departamento_ID
WHERE D.ID = 6;
