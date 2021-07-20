create database shopitesz;
use shopitesz;

create table Categorias(
idCategoria int auto_increment not null,
nombre varchar(60) not null,
imagen mediumblob null,
estatus varchar(10) not null,
constraint pk_categorias primary key(idCategoria),
constraint uk_nombre_categoria unique(nombre),
constraint chk_estatus check(estatus in('Activa','Inactica'))
);

/* inserccion de registros*/
insert into categorias(nombre, estatus) values ('Equipo de computo', 'Sin valor');
select *from Categorias;

create table Productos(
idProducto int auto_increment not null,
idCategoria int not null,
nombre varchar(100) not null,
descripcion varchar(200),
precioVenta float,
existencia int not null,
foto mediumblob null,
especificaciones mediumblob null,
estatus varchar(10) not null,
constraint pk_productos primary key(idProducto),
index (idCategoria),
foreign key(idCategoria) references Categorias(idCategoria)
on update cascade,
constraint uk_nombre_productos unique(nombre),
constraint chk_estatus check(estatus in('Existente', 'No Existe'))
);

create table Usuarios(
idUsuario int auto_increment not null,
nombreCompleto varchar(60) not null,
direccion varchar(200) not null,
telefono char(12) not null,
email varchar(100) not null,
password varchar(20) not null,
tipo varchar(10) not null,
estatus varchar(10) not null,
constraint pk_usuarios primary key(idUsuario),
constraint uk_nombreCompleto_usuarios unique(nombreCompleto),
constraint chk_estatus check(estatus in('Activo','Inactivo'))
);

create table Tarjetas(
idTarjeta int auto_increment not null,
idUsuario int not null,
noTarjeta varchar(16) not null,
saldo float not null,
Banco varchar(50) not null,
estatus varchar(10) not null,
constraint pk_tarjetas primary key(idTarjeta),
constraint fk_tarjetas foreign key(idUsuario) references Usuarios(idUsuario),
constraint chk_estatus check(estatus in('Activa','Inactiva'))
);

create table Carrito(
idCarrito int auto_increment not null,
idUsuario int not null,
idProducto int not null,
fecha date not null,
cantidad int not null,
estatus varchar(10) not null,
constraint pk_carrito primary key(idCarrito),
constraint fk_carrito_usuarios foreign key(idUsuario) references Usuarios(idUsuario),
constraint fk_carrito_productos foreign key(idProducto) references Productos(idProducto),
constraint chk_estatus check(estatus in('Con objeto','Vacio'))
);

create table Pedidos(
idPedido int auto_increment not null,
idComprador int not null,
idVendedor int not null,
idTarjeta int not null,
fechaRegistro date not null,
fechaAtencion date not null,
fechaRecepcion date not null,
fechaCierre date not null,
total float not null,
estatus varchar(10) not null,
constraint pk_pedidos primary key(idPedido),
constraint fk_pedidos_tarjetas foreign key(idTarjeta) references Tarjetas(idTarjeta),
constraint chk_estatus check(estatus in('Hecho','Fallido'))
);

create table DetallePedido(
idDetalle int auto_increment not null,
idPedido int not null,
idProducto int not null,
precio float not null,
cantidadPedida int not null,
cantidadEnviada int not null,
cantidadAceptada int not null,
cantidadRechazada int not null,
subtotal float not null,
estatus varchar(10) not null,
comentario varchar(200) not null,
constraint pk_detalle primary key(idDetalle),
constraint fk_detalle_pedidos foreign key(idPedido) references Pedidos(idPedido),
constraint fk_detalle_productos foreign key(idProducto) references Productos(idProducto),
constraint chk_estatus check(estatus in('Aceptado','Cancelado'))
);

/*Crear un usuario para la conexion con la app*/
create user user_shopitesz identified by 'Shopit3sz.123';
grant select,insert,update,delete on shopitesz.categorias to user_shopitesz;
