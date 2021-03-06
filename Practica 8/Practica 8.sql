use TacosBerna
Create procedure Consulta
as 
select * from Producto
where Precio_producto >= 40

exec SumarCantInsumo '3001',2

select * from Insumo

Create procedure Pedido_persona
as
select ped.Tipo_Pedido,count(*) Total
from Cliente c inner join Pedido ped
on c.Id_Cliente=ped.Id_Cliente
group by ped.Tipo_Pedido

create proc Persona_pedido
@ped int
as
select Nombres_Cliente nombre, Apellidos_Cliente apellido, Tipo_Cliente 'tipo de cliente' 
from Cliente where Id_Cliente=(
select Id_Cliente from pedido
where Id_Pedido=@ped)

create proc RestarCantInsumo
@idIns as int,
@Cantidad as int
as
update Insumo set Cantidad_insumo=Cantidad_insumo-@Cantidad
where Id_insumo=@idIns

create proc SumarCantInsumo
@idIns as int,
@Cantidad as int
as
update Insumo set Cantidad_insumo=Cantidad_insumo+@Cantidad
where  Id_insumo=@idIns

create function fechaL
(@fecha as date)
returns varchar(40)
as
begin
declare @resultado varchar(50)
set @resultado=concat(day(@fecha), ' of ',datename(month,@fecha),' ',year(@fecha))
return @resultado
end

create function calcularpromedio
(@valor1 as decimal (10,2),@valor2 as decimal (10,2))
returns decimal (10,2)
as 
begin
declare @resultado decimal (10,2)
set @resultado=(@valor1+@valor2)/2
return @resultado
end

select dbo.calcularpromedio (25,6) as Promedio

select dbo.fechaL ('2018-03-03')

select Nombres_Cliente,Apellidos_Cliente,dbo.fechaL(FechaNacimiento) 
from Cliente

create trigger mensaje_cliente
on cliente
for insert,update
as
Print 'Cliente Creado'
go

insert into Cliente values ('10032','Juan','Perez','12345678','su casa','cliente frecuente','1991-01-15')