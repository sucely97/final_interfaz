CREATE DATABASE tienda_master;
USE tienda_master;

CREATE TABLE usuarios(
    id          int(255) auto_increment not null,
    nombre      varchar(100) not null,
    apellido    varchar(255),
    email       varchar(255) not null,
    contrasenia varchar(255) not null,
    rol         varchar(20),
    imagen      varchar(255),
    CONSTRAINT pk_usuarios PRIMARY KEY(id),
    CONSTRAINT uq_email UNIQUE(email)
)ENGINE=InnoDb


CREATE TABLE productos(
    id           int(255) auto_increment not null,
    nombre       int(255) not null,
    descripcion  varchar (100) not null
    precio       float(100,2) not null,
    fecha        date not null,
    stock        int (255) not null,
    imagen       varchar(255) not null,
)ENGINE=InnoDb

CREATE TABLE pedidos(
    id              int(255) auto_increment not null,
    usuarios_id     int(255) not null,
    pais            varchar (100) not null,
    provincia       varchar (100) not null,
    direccion       varchar (255) not null,
    costo           float(200,2) not null,
    estado          varchar(20)not null,
    fecha           date ,
    hora            time,
    CONSTRAINT pk_pedidos PRIMARY KEY (id),
    CONSTRAINT fk_pedido_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
)ENGINE=InnoDb



CREATE TABLE inventario(
    id              int(255) auto_increment not null,
    pedido_id       int(255) not null,
    producto_id     int(255)not null,
    CONSTRAINT pk_inventario PRIMARY KEY (id),
    CONSTRAINT fk_inventario_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    CONSTRAINT fk_inventario_producto FOREIGN KEY (producto_id) REFERENCES productos(id),

)

