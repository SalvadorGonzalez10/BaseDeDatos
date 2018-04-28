SELECT Nombres_Cliente as Nombre,Id_Cliente as ID,Tipo_Cliente as Tipo 
FROM Cliente
SELECT Nombre_insumo as Ingrediente,Cantidad_insumo as Cantidad,Unidad_medida_insumo as 'Unidad de medida' 
FROM Insumo
SELECT Id_Pedido as 'Numero de pedido',Fecha_Pedido as Fecha, Id_Cliente as 'Mesero'
FROM Pedido
SELECT Tipo_producto as Producto,Descripcion_producto as Descripcion,Precio_producto as Precio
FROM Producto
SELECT top (3) Id_Cliente as ID,Nombres_Cliente as Nombres From Cliente
SELECT top (4) Id_Pedido as 'Numero de pedido',Fecha_Pedido as Pedido From Pedido
SELECT top (6) Id_Venta as 'Numero de venta',Total From Venta
SELECT top (5) Nombre_proveedor as 'Nombre de proveedor',Telefono_proveedor as Telefono 
From Proveedor
SELECT top (2) Nombre_insumo as Insumo, Cantidad_insumo as Cantidad From Insumo
SELECT C.Apellidos_Cliente
FROM Cliente AS C
GROUP BY C.Apellidos_Cliente
SELECT I.Nombre_insumo,I.Cantidad_insumo
FROM Insumo AS I
GROUP BY I.Nombre_insumo,I.Cantidad_insumo
SELECT P.Id_Pedido AS 'NUMERO DE PEDIDO',P.Tipo_Pedido AS 'MODO DE PAGO'
FROM PEDIDO AS P
GROUP BY P.Id_Pedido,P.Tipo_Pedido
SELECT P.Tipo_producto AS PRODUCTO
FROM Producto AS P
GROUP BY P.Tipo_producto
SELECT P.Nombres,P.Salario
FROM Personal AS P
GROUP BY P.Nombres,P.Salario
SELECT AVG(Subtotal) as 'Media de venta del dia'
FROM Venta
WHERE Total >40
SELECT SUM(Total) as 'Venta del dia'
FROM Venta
SELECT count(Precio_producto) as 'Productos premium'
FROM Producto
WHERE Precio_producto > 50
SELECT count(Tipo_empleo) as 'Cantidad de empleados de medio tiempo'
FROM Empleo
WHERE Tipo_empleo = 'medio tiempo'
SELECT max(Precio_producto) as 'Precio del producto'
FROM Producto
WHERE Precio_producto < 50
SELECT Id_producto, avg(Precio_producto) as Cantidad
from Producto
Group by Id_producto
Having avg(Precio_producto) >= 35
SELECT Id_Cliente, count(Id_Cliente) as Cantidad
from Cliente
Group by Id_Cliente
Having count(Id_Cliente) >= 2
SELECT Tipo_Cliente, count(Tipo_Cliente) as 'Cantidad de Clientes Frecuentes'
from Cliente
where Tipo_Cliente = 'Cliente Frecuente'
Group by Tipo_Cliente
Having count(Tipo_Cliente) >2
SELECT Fecha, count(Fecha) as Cantidad
from Venta
where fecha = '2018-01-02'
Group by Fecha
Having count(fecha) >2
SELECT Precio_producto, count(Precio_producto) as Cantidad
from Producto
where Precio_producto >= 35
Group by Precio_producto
Having count(Precio_producto) >2