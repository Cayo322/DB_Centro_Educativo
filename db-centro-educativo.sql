CREATE DATABASE IF NOT EXISTS centro_educativo;
-- para crear la base de datos
USE centro_educativo;

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


INSERT INTO
    Alumnos (
        Nombre_Alumno,
        Fecha_Nacimiento,
        Direccion,
        Correo_Electronico
    )
VALUES (
        'Cayo Phocco',
        '2000-11-21',
        'Calle rosales 123',
        'cayo.phocco@gmail.com'
    ),
    (
        'Alberto Machacca',
        '2001-05-21',
        'Calle Lujan 123',
        'alberto.machacca@gmail.com'
    ),
    (
        'Alan García',
        '1961-05-21',
        'Mar de Bolivia 123',
        'alan.garcia@gmail.com'
    );

INSERT INTO
    Departamentos (
        Nombre_Departamento,
        Ubicacion
    )
VALUES (
        'Ciencias de la Computación',
        'Edificio A'
    ),
    (
        'Estudios Generales',
        'Edificio B'
    ),
    ('Mecanica', 'Edificio C');
INSERT INTO
    Docentes (
        Nombre_Docente,
        Departamento_ID,
        Titulo_Academico
    )
VALUES (
        'Cesar Bobadilla',
        1,
        'Ingeniero en Computación'
    ),
    (
        'Abel Ccopa',
        1,
        'Ingeniero de Sistemas'
    ),
    (
        'Hugo Sanchez',
        2,
        'Economista'
    ),
    (
        'Carlos Tevez',
        2,
        'Economista'
    ),
    (
        'Julio Belarde',
        3,
        'Ingeniero Mecánico'
    ),
    (
        'Isaac Newton',
        3,
        'Ingeniero Mecánico'
    );

INSERT INTO
    Cursos (
        Nombre_Curso,
        Departamento_ID,
        Duracion_Curso,
        Creditos
    )
VALUES (
        'Introducción a la Programación',
        1,
        60,
        4
    ),
    (
        'Fundamentos de la economía',
        2,
        60,
        4
    ),
    (
        'Mecánica de fluidos',
        3,
        60,
        4
    );

INSERT INTO
    Matriculas (
        Alumno_ID,
        Curso_ID,
        Fecha_Matricula,
        Estado_Matricula
    )
VALUES (1, 1, '2024-08-11', 'Activa'),
    (2, 2, '2024-08-11', 'Activa'),
    (3, 3, '2024-08-11', 'Activa');


