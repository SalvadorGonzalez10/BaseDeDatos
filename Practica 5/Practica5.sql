USE [TacosBerna]
GO

UPDATE [dbo].[Insumo]
   SET Cantidad_insumo = '60'
 WHERE Id_insumo = '3008'
GO
UPDATE Cargo
   SET Cargo = 'CAJERO'
 WHERE Id_cargo = '6'
GO
UPDATE Empleo
   SET Tipo_empleo = 'Tiempo completo'
 WHERE Id_tipo_personal = '406'
GO
UPDATE Mesa
   SET Capacidad = '6'
 WHERE Id_Mesa = '110'
GO
UPDATE Cliente
   SET Telefono = '41774985'
 WHERE Id_Cliente = '4'
GO



