CREATE TYPE estado_reserva AS ENUM ('Confirmada', 'Pendiente', 'Cancelada');
CREATE TYPE estado_orden AS ENUM ('Abierta', 'Cerrada');
CREATE TYPE metodo_pago AS ENUM ('Efectivo', 'Tarjeta', 'Transferencia');

-- Creación de la tabla Categorias
CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

-- Creación de la tabla Platillos
CREATE TABLE Platillos (
    id_platillo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(100),
	sueldo DECIMAL(10,2),
);

-- Creación de la tabla Mesas
CREATE TABLE Mesas (
    id_mesa SERIAL PRIMARY KEY,
    numero INT NOT NULL,
    capacidad INT NOT NULL,
    ubicacion VARCHAR(100)
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- Creación de la tabla Reservas
CREATE TABLE Reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_cliente INT,
    id_mesa INT,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    cantidad_personas INT NOT NULL,
    estado estado_reserva DEFAULT 'Pendiente',
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_mesa FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa)
);

-- Creación de la tabla Ordenes
CREATE TABLE Ordenes (
    id_orden SERIAL PRIMARY KEY,
    id_mesa INT,
    id_empleado INT,
    fecha_orden TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    estado estado_orden DEFAULT 'Abierta',
    CONSTRAINT fk_mesa_orden FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa),
    CONSTRAINT fk_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- Creación de la tabla DetalleOrden
CREATE TABLE DetalleOrden (
    id_detalle SERIAL PRIMARY KEY,
    id_orden INT,
    id_platillo INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    CONSTRAINT fk_orden FOREIGN KEY (id_orden) REFERENCES Ordenes(id_orden),
    CONSTRAINT fk_platillo FOREIGN KEY (id_platillo) REFERENCES Platillos(id_platillo)
);

-- Creación de la tabla Pagos
CREATE TABLE Pagos (
    id_pago SERIAL PRIMARY KEY,
    id_orden INT,
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(10,2),
    metodo_pago metodo_pago DEFAULT 'Efectivo',
    CONSTRAINT fk_pago_orden FOREIGN KEY (id_orden) REFERENCES Ordenes(id_orden)
);
-- Creacióm de la tabla Usuario
CREATE TABLE Usuario(
	id_usuario SERIAL PRIMARY KEY,
	username VARCHAR(20),
	pass_user VARCHAR(20),
	id_empleado INT,
	CONSTRAINT fk_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)	
)