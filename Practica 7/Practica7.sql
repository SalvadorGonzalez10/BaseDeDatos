create view MetodoPago as
select P.Tipo_Pedido as 'Modo de pago', V.Total from Venta as V,Pedido as P
where p.Id_Pedido = v.Id_Pedido

select * from MetodoPago

create view CostoInsumo1 as
select i.Nombre_insumo as Nombre, m.Precio_insumo as Precio from Proveedor_Insumo as m, Insumo as i
where m.Id_insumo = i.Id_insumo

select * from CostoInsumo1

create view CargoPersonal as
select p.Nombres as Nombre,c.Cargo as Puesto from cargo as c, Personal as p
where c.Id_cargo = p.Id_cargo

select * from CargoPersonal

create view ClienteTipo as
select c.Nombres_Cliente as Nombre, c.Apellidos_Cliente as Apeddilos, c.Tipo_Cliente as 'Tipo de cliente' from Cliente as c

select * from ClienteTipo

create view TelefonoPersonal as
select p.Nombres,p.Apellidos,p.Telefono from Personal as p

select * from TelefonoPersonal
