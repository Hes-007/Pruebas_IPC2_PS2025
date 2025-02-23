# AirportDB - Database Schema

## **Descripción**
_AirportDB_ es una base de datos diseñada para gestionar la información de un aeropuerto, incluyendo usuarios, roles, vuelos, boletos, pagos y tripulación.

## **Estructura de la Base de Datos**

### **1. Tabla `Role`**
Guarda los distintos roles de los usuarios del sistema.
```sql
CREATE TABLE Role (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role VARCHAR(100) NOT NULL UNIQUE
);
```

### **2. Tabla `User`**
Almacena la información de los usuarios del sistema, incluyendo pasajeros, pilotos, azafatas y administradores.
```sql
CREATE TABLE User (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    status BINARY(1) NOT NULL,
    regis_date DATETIME DEFAULT GETDATE(),
    update_date DATETIME DEFAULT GETDATE(),
    role_id INT NOT NULL,
    CONSTRAINT FK_User_Role FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
```

### **3. Tabla `Payment`**
Registra los pagos realizados por los pasajeros.
```sql
CREATE TABLE Payment (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    total_amount DECIMAL(10,2) NOT NULL,
    pay_date DATETIME DEFAULT GETDATE(),
    user_id INT NOT NULL,
    CONSTRAINT FK_Payment_User FOREIGN KEY (user_id) REFERENCES User(user_id)
);
```

### **4. Tabla `Ticket`**
Almacena la información de los boletos disponibles para los vuelos.
```sql
CREATE TABLE Ticket (
    ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    ticket_type VARCHAR(50) CHECK (ticket_type IN ('Economica', 'Ejecutiva', 'Primera Clase')),
    price DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Disponible', 'Vendido')),
    flight_id INT NOT NULL,
    CONSTRAINT FK_Ticket_Flight FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);
```

### **5. Tabla `Payment_Detail`**
Relaciona los pagos con los boletos comprados.
```sql
CREATE TABLE Payment_Detail (
    detail_id INT IDENTITY(1,1) PRIMARY KEY,
    payment_id INT NOT NULL,
    ticket_id INT NOT NULL,
    CONSTRAINT FK_PaymentDetail_Payment FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
    CONSTRAINT FK_PaymentDetail_Ticket FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);
```

### **6. Tabla `Gate`**
Almacena las puertas de embarque disponibles en el aeropuerto.
```sql
CREATE TABLE Gate (
    gate_id INT IDENTITY(1,1) PRIMARY KEY,
    gate_number INT NOT NULL UNIQUE
);
```

### **7. Tabla `Crew`**
Define la tripulación de los vuelos, incluyendo piloto y copiloto.
```sql
CREATE TABLE Crew (
    crew_id INT IDENTITY(1,1) PRIMARY KEY,
    pilot INT NOT NULL,
    co_pilot INT NOT NULL,
    CONSTRAINT FK_Crew_Pilot FOREIGN KEY (pilot) REFERENCES User(user_id),
    CONSTRAINT FK_Crew_CoPilot FOREIGN KEY (co_pilot) REFERENCES User(user_id)
);
```

### **8. Tabla `Flight`**
Registra los vuelos disponibles en el aeropuerto.
```sql
CREATE TABLE Flight (
    flight_id INT IDENTITY(1,1) PRIMARY KEY,
    origin VARCHAR(100) NOT NULL,
    destiny VARCHAR(100) NOT NULL,
    depart_date DATETIME NOT NULL,
    arrival_date DATETIME NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Programado', 'En Puerta', 'En Vuelo', 'Aterrizado')),
    limit INT NOT NULL CHECK (limit > 0),
    gate_id INT NOT NULL,
    crew_id INT NOT NULL,
    CONSTRAINT FK_Flight_Gate FOREIGN KEY (gate_id) REFERENCES Gate(gate_id),
    CONSTRAINT FK_Flight_Crew FOREIGN KEY (crew_id) REFERENCES Crew(crew_id)
);
```

### **9. Tabla `Hostess`**
Relaciona las azafatas con la tripulación de un vuelo.
```sql
CREATE TABLE Hostess (
    hostess_id INT IDENTITY(1,1) PRIMARY KEY,
    hostess INT NOT NULL,
    crew_id INT NOT NULL,
    CONSTRAINT FK_Hostess_User FOREIGN KEY (hostess) REFERENCES User(user_id),
    CONSTRAINT FK_Hostess_Crew FOREIGN KEY (crew_id) REFERENCES Crew(crew_id)
);
```

## **Relaciones en la Base de Datos**
- Cada **User** pertenece a un **Role**.
- Cada **Payment** está asociado a un **User** (pasajero).
- Los **Tickets** están asociados a un **Flight** y su estado cambia cuando son comprados.
- **Payment_Detail** conecta los **Payments** con los **Tickets** comprados.
- Cada vuelo usa una **Gate** y tiene asignado un **Crew**.
- **Crew** contiene a los pilotos del vuelo.
- **Hostess** almacena la relación de las azafatas con la tripulación.

## **Cómo Usar esta Base de Datos**
1. **Ejecutar el script** en SQL Server:
   ```sql
   CREATE DATABASE AirportDB;
   USE AirportDB;
   -- Ejecutar el resto del script
   ```
2. **Insertar datos de prueba** (Roles, Usuarios, Vuelos, Boletos, Pagos).
3. **Realizar consultas** para verificar datos, por ejemplo:
   ```sql
   SELECT * FROM Flight WHERE status = 'Programado';
   ```

## **Consideraciones Finales**
- **No se eliminan registros**, solo se deshabilitan con `status = 0`.
- **Las claves foráneas aseguran la integridad de los datos.**
- **Los `CHECK` garantizan que solo se almacenen valores válidos.**

