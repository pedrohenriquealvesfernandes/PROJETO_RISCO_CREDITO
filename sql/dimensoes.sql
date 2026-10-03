USE RiscoCredito;

--------------------------------------- dim_uf ---------------------------------

IF OBJECT_ID('dim_uf','V') IS NOT NULL
	DROP VIEW dim_uf;
GO

CREATE OR ALTER VIEW dim_uf AS
	SELECT DISTINCT uf FROM dbo.scr_risco_credito;

--------------------------------------- dim_segmento ---------------------------------

IF OBJECT_ID('dim_segmento','V') IS NOT NULL
	DROP VIEW dim_segmento;
GO

CREATE OR ALTER VIEW dim_segmento AS
	SELECT DISTINCT segmento FROM dbo.scr_risco_credito;

--------------------------------------- dim_cliente ---------------------------------

IF OBJECT_ID('dim_cliente', 'V') IS NOT NULL
	DROP VIEW dim_cliente;
GO

CREATE OR ALTER VIEW dim_cliente AS
	SELECT DISTINCT cliente FROM dbo.scr_risco_credito

--------------------------------------- dim_cnae_ocupacao ---------------------------------

IF OBJECT_ID('dim_cnae_ocupacao', 'V') IS NOT NULL
	DROP VIEW dim_cnae_ocupacao;
GO

CREATE OR ALTER VIEW dim_cnae_ocupacao AS 
	SELECT DISTINCT cnae_ocupacao FROM dbo.scr_risco_credito

--------------------------------------- dim_porte ---------------------------------

IF OBJECT_ID ('dim_porte', 'V') IS NOT NULL
	DROP VIEW dim_porte;
GO

CREATE OR ALTER VIEW dim_porte AS
	SELECT DISTINCT porte FROM dbo.scr_risco_credito

--------------------------------------- dim_modalidade ---------------------------------

IF OBJECT_ID ('dim_modalidade', 'V') IS NOT NULL
	DROP VIEW dim_modalidade;
GO

CREATE OR ALTER VIEW dim_modalidade AS
	SELECT DISTINCT modalidade FROM dbo.scr_risco_credito

--------------------------------------- dim_submodalidade ---------------------------------

IF OBJECT_ID ('dim_submodalidade', 'V') IS NOT NULL
	DROP VIEW dim_submodalidade;
GO

CREATE OR ALTER VIEW dim_submodalidade AS
	SELECT DISTINCT submodalidade FROM dbo.scr_risco_credito

--------------------------------------- dim_origem ---------------------------------

IF OBJECT_ID ('dim_origem', 'V') IS NOT NULL
	DROP VIEW dim_origem;
GO

CREATE OR ALTER VIEW dim_origem AS
	SELECT DISTINCT origem FROM dbo.scr_risco_credito

--------------------------------------- dim_indexador ---------------------------------

IF OBJECT_ID ('dim_indexador', 'V') IS NOT NULL
	DROP VIEW dim_indexador;
GO

CREATE OR ALTER VIEW dim_indexador AS
	SELECT DISTINCT indexador FROM dbo.scr_risco_credito

