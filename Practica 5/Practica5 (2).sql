USE [TacosBerna]
GO

DELETE FROM [dbo].[Cliente]
      WHERE Nombres_Cliente = 'Raul'
GO
DELETE FROM [dbo].[Producto_Pedido]
      WHERE Id_Producto = '55001'
GO
DELETE FROM [dbo].[Producto_Pedido]
      WHERE Id_Pedido = '1101'
GO
DELETE FROM [dbo].[Cargo]
      WHERE Id_cargo = '25'
GO
DELETE FROM [dbo].[Cargo]
      WHERE Cargo = 'Contador'
GO