CREATE DATABASE db_parqueadero;
GO

USE db_parqueadero;
GO

CREATE TABLE Sedes (
    Id        INT PRIMARY KEY IDENTITY(1,1),
    Nombre    NVARCHAR(100),
    Direccion NVARCHAR(150),
    Ciudad    NVARCHAR(50),
    Telefono  NVARCHAR(20),
    Activa    BIT DEFAULT 0
);

CREATE TABLE Cargos (
    Id               INT PRIMARY KEY IDENTITY(1,1),
    Nombre           NVARCHAR(50),
    Descripcion      NVARCHAR(150),
    AccesoVehiculos  BIT DEFAULT 0,
    AccesoCaja       BIT DEFAULT 0,
    AccesoSistema    BIT DEFAULT 0
);

CREATE TABLE Tarifas (
    Id             INT PRIMARY KEY IDENTITY(1,1),
    TipoVehiculo   INT NOT NULL,
    PrecioHora     DECIMAL(10,2),
    FraccionHora   DECIMAL(5,2),
    AplicaCargador BIT DEFAULT 0,
    ValorCarga     DECIMAL(10,2)
);

CREATE TABLE Promociones (
    Id              INT PRIMARY KEY IDENTITY(1,1),
    Nombre          NVARCHAR(100),
    Descuento       DECIMAL(5,2),
    FechaInicio     DATETIME,
    FechaFin        DATETIME,
    Activa          BIT DEFAULT 0,
    TipoVehiculo    INT NULL,
    SoloFinDeSemana BIT DEFAULT 0
);

CREATE TABLE Personas (
    Id       INT PRIMARY KEY IDENTITY(1,1),
    Nombre   NVARCHAR(50),
    Apellido NVARCHAR(50),
    Cedula   NVARCHAR(20),
    Telefono NVARCHAR(20),
    Correo   NVARCHAR(100)
);

CREATE TABLE Clientes (
    Id       INT PRIMARY KEY IDENTITY(1,1),
    Nombre   NVARCHAR(50),
    Apellido NVARCHAR(50),
    Cedula   NVARCHAR(20),
    Telefono NVARCHAR(20),
    Correo   NVARCHAR(100)
);

CREATE TABLE Empleados (
    Id       INT PRIMARY KEY IDENTITY(1,1),
    Nombre   NVARCHAR(50),
    Apellido NVARCHAR(50),
    Cedula   NVARCHAR(20),
    Telefono NVARCHAR(20),
    Correo   NVARCHAR(100),
    Cargo    INT NOT NULL REFERENCES Cargos(Id),
    Turno    INT NOT NULL
);

CREATE TABLE Pisos (
    Id          INT PRIMARY KEY IDENTITY(1,1),
    Nombre      NVARCHAR(50),
    Capacidad   INT,
    Descripcion NVARCHAR(100),
    Activo      BIT DEFAULT 0,
    Sede        INT NOT NULL REFERENCES Sedes(Id)
);

CREATE TABLE Espacios (
    Id           INT PRIMARY KEY IDENTITY(1,1),
    Numero       NVARCHAR(10),
    TipoVehiculo INT NOT NULL,
    PuestoCarga  BIT DEFAULT 0,
    Disponible   BIT DEFAULT 1,
    Piso         INT NOT NULL REFERENCES Pisos(Id)
);

CREATE TABLE Vehiculos (
    Id         INT PRIMARY KEY IDENTITY(1,1),
    Tipo       INT NOT NULL,
    Placa      NVARCHAR(20),
    Marca      NVARCHAR(50),
    Color      NVARCHAR(30),
    Combustion INT NOT NULL,
    Cliente    INT NOT NULL REFERENCES Clientes(Id)
);

CREATE TABLE Ingresos (
    Id         INT PRIMARY KEY IDENTITY(1,1),
    HoraEntrada DATETIME,
    HoraSalida  DATETIME,
    TotalHoras  DECIMAL(5,2),
    Vehiculo   INT NOT NULL REFERENCES Vehiculos(Id),
    Empleado   INT NOT NULL REFERENCES Empleados(Id),
    Espacio    INT NOT NULL REFERENCES Espacios(Id)
);

CREATE TABLE Reservas (
    Id           INT PRIMARY KEY IDENTITY(1,1),
    Cliente      INT NOT NULL REFERENCES Clientes(Id),
    Vehiculo     INT NOT NULL REFERENCES Vehiculos(Id),
    Espacio      INT NOT NULL REFERENCES Espacios(Id),
    FechaReserva DATETIME,
    FechaIngreso DATETIME,
    Activa       BIT DEFAULT 0
);

CREATE TABLE Tiquetes (
    Id               INT PRIMARY KEY IDENTITY(1,1),
    Codigo           NVARCHAR(30),
    FechaGeneracion  DATETIME,
    Pagado           BIT DEFAULT 0,
    FechaVencimiento DATETIME,
    Ingreso          INT NOT NULL REFERENCES Ingresos(Id)
);

CREATE TABLE Fichos (
    Id        INT PRIMARY KEY IDENTITY(1,1),
    Fecha     DATETIME,
    Codigo    NVARCHAR(20),
    Entregado BIT DEFAULT 0,
    Cliente   INT NOT NULL REFERENCES Clientes(Id)
);

CREATE TABLE ValetRegistros (
    Id          INT PRIMARY KEY IDENTITY(1,1),
    HoraEntrada DATETIME,
    HoraSalida  DATETIME,
    Empleado    INT NOT NULL REFERENCES Empleados(Id),
    Vehiculo    INT NOT NULL REFERENCES Vehiculos(Id),
    Ficho       INT NOT NULL REFERENCES Fichos(Id)
);

CREATE TABLE Detalles (
    Id          INT PRIMARY KEY IDENTITY(1,1),
    Ingreso     BIT DEFAULT 0,
    Descripcion NVARCHAR(200),
    Fecha       DATETIME,
    Vehiculo    INT NOT NULL REFERENCES Vehiculos(Id),
    Empleado    INT NOT NULL REFERENCES Empleados(Id)
);

CREATE TABLE Cobros (
    Id         INT PRIMARY KEY IDENTITY(1,1),
    Subtotal   DECIMAL(10,2),
    Descuento  DECIMAL(5,2),
    Total      DECIMAL(10,2),
    Ingreso    INT NOT NULL REFERENCES Ingresos(Id),
    UsoValet   BIT DEFAULT 0,
    TarifaValet DECIMAL(10,2),
    Cliente    INT NOT NULL REFERENCES Clientes(Id),
    Tarifa     INT NOT NULL REFERENCES Tarifas(Id),
    Promocion  INT NULL REFERENCES Promociones(Id)
);

CREATE TABLE Pagos (
    Id          INT PRIMARY KEY IDENTITY(1,1),
    Cobro       INT NOT NULL REFERENCES Cobros(Id),
    MetodoPago  INT NOT NULL,
    Valor       DECIMAL(10,2),
    Fecha       DATETIME,
    Aprobado    BIT DEFAULT 0
);

CREATE TABLE Notificaciones (
    Id       INT PRIMARY KEY IDENTITY(1,1),
    Mensaje  NVARCHAR(300),
    Leida    BIT DEFAULT 0,
    Canal    NVARCHAR(20),
    Fecha    DATETIME,
    Cliente  INT NOT NULL REFERENCES Clientes(Id)
);

CREATE TABLE Mantenimientos (
    Id          INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(200),
    FechaInicio DATETIME,
    FechaFin    DATETIME,
    Activo      BIT DEFAULT 0,
    Espacio     INT NOT NULL REFERENCES Espacios(Id),
    Empleado    INT NOT NULL REFERENCES Empleados(Id)
);