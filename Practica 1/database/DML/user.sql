USE AirportDB;
GO

-- Administrator users
INSERT INTO User (name, lastname, email, password, status, regis_date, update_date, role_id)
VALUES 
    ('Josué Daniel', 'Rojché García', 'josue@aeropuerto.com', 'admin', 1, GETDATE(), GETDATE(), 1),
    ('Hesban Amilcar', 'Argueta Aguilar', 'hesban@aeropuerto.com', 'admin', 1, GETDATE(), GETDATE(), 1),
    ('Kevin Estuardo', 'Palacios Quiñonez', 'kevin@aeropuerto.com', 'admin', 1, GETDATE(), GETDATE(), 1),
    ('José Alejandro', 'Lorenty Herrera', 'jose@aeropuerto.com', 'admin', 1, GETDATE(), GETDATE(), 1),
    ('Diego Facundo', 'Pérez Nicolau', 'diego@aeropuerto.com', 'admin', 1, GETDATE(), GETDATE(), 1);
GO

-- Pilot users
INSERT INTO User (name, lastname, email, password, status, regis_date, update_date, role_id)
VALUES 
    ('Carlos Andrés', 'Méndez López', 'carlos@aeropuerto.com', 'piloto', 1, GETDATE(), GETDATE(), 2),
    ('Fernando Javier', 'Gómez Ramírez', 'fernando@aeropuerto.com', 'piloto', 1, GETDATE(), GETDATE(), 2),
    ('Raúl Sebastián', 'Torres Villanueva', 'raul@aeropuerto.com', 'piloto', 1, GETDATE(), GETDATE(), 2),
    ('Alejandro Iván', 'Hernández Castillo', 'alejandro@aeropuerto.com', 'piloto', 1, GETDATE(), GETDATE(), 2),
    ('Manuel Esteban', 'Díaz Fernández', 'manuel@aeropuerto.com', 'piloto', 1, GETDATE(), GETDATE(), 2);
GO

-- Hostess users
INSERT INTO User (name, lastname, email, password, status, regis_date, update_date, role_id)
VALUES 
    ('María Fernanda', 'López Ramírez', 'maria@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Ana Sofía', 'García Torres', 'ana@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Camila Valentina', 'Martínez Castillo', 'camila@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Valeria Isabel', 'Rodríguez Fernández', 'valeria@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Gabriela Natalia', 'Pérez González', 'gabriela@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Paula Andrea', 'Hernández Moreno', 'paula@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Diana Carolina', 'Díaz Méndez', 'diana@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Luciana Beatriz', 'Sánchez Ríos', 'luciana@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Renata Alejandra', 'Jiménez Álvarez', 'renata@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3),
    ('Isabella Julieta', 'Vargas Ortega', 'isabella@aeropuerto.com', 'asistente', 1, GETDATE(), GETDATE(), 3);

-- Passenger users
INSERT INTO User (name, lastname, email, password, status, regis_date, update_date, role_id)
VALUES 
    ('Javier Andrés', 'Gómez Rodríguez', 'javier@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Luis Fernando', 'Hernández Pérez', 'luis@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Ricardo Emilio', 'Martínez Díaz', 'ricardo@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Andrés Felipe', 'López Ramírez', 'andres@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Santiago Esteban', 'Jiménez Sánchez', 'santiago@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Mateo Alejandro', 'Castillo Vargas', 'mateo@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Daniel Alonso', 'Torres Méndez', 'daniel@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Juan Sebastián', 'Morales Ríos', 'juan@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Cristian Eduardo', 'Fernández Álvarez', 'cristian@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4),
    ('Esteban Adrián', 'Ortega Navarro', 'esteban@aeropuerto.com', 'pasajero', 1, GETDATE(), GETDATE(), 4);
