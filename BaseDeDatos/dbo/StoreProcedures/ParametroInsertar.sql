CREATE PROCEDURE [dbo].[ParametroInsertar]
	@Id_Parametro INT,
	@Codigo VARCHAR(250),
	@Descripcion VARCHAR(250),
	@Valor VARCHAR(250),
	@Estado bit
	

AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA 
    
	BEGIN TRY

	 INSERT INTO dbo.Parametro
	 (  Id_Parametro
		,Codigo
		,Descripcion
		,Valor
		,Estado 
	 )
	 VALUES
	 (  @Id_Parametro
		,@Codigo
		,@Descripcion
		,@Valor
		,@Estado	 
	 )

	 COMMIT TRANSACTION TRASA
	 SELECT 0 AS CodeError, '' AS MsgError

	END TRY

	BEGIN CATCH

	 SELECT 
	       ERROR_NUMBER() AS CodeError,
		   ERROR_MESSAGE() AS MsgError

     ROLLBACK TRANSACTION TRASA

	END CATCH

  END
