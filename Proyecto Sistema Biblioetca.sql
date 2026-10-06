BEGIN TRANSACTION;
DROP TABLE IF EXISTS "Alumno";
CREATE TABLE "Alumno" (
	"Id_Alumno"	INTEGER NOT NULL,
	"Boleta"	TEXT UNIQUE,
	"Nombre"	TEXT NOT NULL,
	"Apellidos"	TEXT NOT NULL,
	"Semestre"	INTEGER NOT NULL,
	"Telefono"	TEXT NOT NULL,
	"Correo"	TEXT NOT NULL,
	PRIMARY KEY("Id_Alumno" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "Autor";
CREATE TABLE "Autor" (
	"Id_Autor"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Apellidos"	TEXT NOT NULL,
	PRIMARY KEY("Id_Autor" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "Libro";
CREATE TABLE "Libro" (
	"Id_Libro"	INTEGER NOT NULL,
	"Titulo"	TEXT NOT NULL,
	"Id_Autor"	INTEGER NOT NULL,
	"Editorial"	TEXT NOT NULL,
	"Categoria"	TEXT NOT NULL,
	"Anio_Publicacion"	INTEGER,
	"Anio_Ingreso"	INTEGER,
	"Cantidad_Ejemplares"	INTEGER DEFAULT 1,
	"Estado_Libro"	TEXT DEFAULT 'Disponible',
	PRIMARY KEY("Id_Libro" AUTOINCREMENT),
	FOREIGN KEY("Id_Autor") REFERENCES ""
);
DROP TABLE IF EXISTS "Prestamo";
CREATE TABLE "Prestamo" (
	"Id_Prestamo"	INTEGER NOT NULL,
	"Id_Alumno"	INTEGER NOT NULL,
	"Id_Libro"	INTEGER NOT NULL,
	"Fecha_Prestamo"	TEXT NOT NULL,
	"Fecha_Devolucion"	TEXT NOT NULL,
	"Estado_Prestamo"	TEXT NOT NULL DEFAULT 'Prestado' CHECK(Estado_Prestamo IN ('Prestado', 'Devuelto', 'Vencido')),
	PRIMARY KEY("Id_Prestamo" AUTOINCREMENT),
	FOREIGN KEY("Id_Alumno") REFERENCES "Alumno",
	FOREIGN KEY("Id_Libro") REFERENCES ""
);
COMMIT;
