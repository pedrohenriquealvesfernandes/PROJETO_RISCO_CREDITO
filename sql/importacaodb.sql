USE RiscoCredito;

IF OBJECT_ID('scr_risco_credito', 'U') IS NOT NULL
	DROP TABLE scr_risco_credito;
GO

CREATE TABLE scr_risco_credito 
(
	data_base DATE,
	uf NVARCHAR(2),
	segmento NVARCHAR(100),
	cliente NVARCHAR(2),
	cnae_ocupacao NVARCHAR(100),
	porte NVARCHAR(100),
	modalidade NVARCHAR(100),
	submodalidade NVARCHAR(160),
	origem NVARCHAR(160),
	indexador NVARCHAR(100),
	numero_de_operacoes NVARCHAR(20),
	a_vencer_ate_90_dias DECIMAL(16,2),
	a_vencer_de_91_ate_360_dias DECIMAL(16,2),
	a_vencer_de_361_ate_1080_dias DECIMAL(16,2),
	a_vencer_de_1081_ate_1800_dias DECIMAL(16,2),
	a_vencer_de_1801_ate_5400_dias DECIMAL(16,2),
	a_vencer_acima_de_5400_dias DECIMAL(16,2),
	carteira_a_vencer DECIMAL(16,2),
	vencido_de_15_ate_90_dias DECIMAL(16,2),
	vencido_acima_de_90_dias DECIMAL(16,2),
	carteira_vencida DECIMAL(16,2),
	carteira_ativa DECIMAL(16,2),
	carteira_inadimplencia DECIMAL(16,2),
	ativo_problematico DECIMAL(16,2),
)

CREATE OR ALTER PROCEDURE sp_inserir_dados AS
BEGIN
	DECLARE @tempo_inicio DATETIME, @tempo_final DATETIME;
	BEGIN TRY
		SET @tempo_inicio = GETDATE();

		TRUNCATE TABLE scr_risco_credito;
		BULK INSERT dbo.scr_risco_credito
			FROM 'C:\Users\Pedro\Desktop\ESTUDOS\ANALISE_DADOS\PROJETOS\PROJETO_RISCO_CREDITO\data\gold\dados_limpos.csv'
			WITH
			(
				FORMAT = 'CSV',
				FIELDTERMINATOR = ';',
				CODEPAGE = '65001',
				FIRSTROW = 1,
				BATCHSIZE = 100000,
				MAXERRORS = 100,
				ERRORFILE = 'C:\sisampla\erros_scr.csv'
			);

		SET @tempo_final = GETDATE();

		PRINT('Importação realizada em: ' + CAST(DATEDIFF(second, @tempo_inicio, @tempo_final) AS NVARCHAR(50)) + ' segundos.')
	END TRY
	BEGIN CATCH
		PRINT '===========================================================';
		PRINT 'OCORRÊNCIA DE ERRO';
		PRINT 'Mensagem de erro: ' + ERROR_MESSAGE();
		PRINT 'Número do erro:' + CAST (ERROR_NUMBER() AS NVARCHAR(50));
		PRINT 'Status erro:' + CAST (ERROR_STATE() AS NVARCHAR(50));
		PRINT '===========================================================';
	END CATCH
END;

exec dbo.sp_inserir_dados

