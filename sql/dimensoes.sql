USE RiscoCredito;

--------------------------------------- dim_uf ---------------------------------

DROP TABLE IF EXISTS dim_uf;

CREATE TABLE dim_uf
(
	uf_id INT NOT NULL,
	uf NVARCHAR(2)
)

INSERT INTO dim_uf
SELECT 
	ROW_NUMBER() OVER (ORDER BY uf) as uf_id,
	uf.uf
FROM (SELECT DISTINCT uf FROM dbo.scr_risco_credito) as uf

SELECT * FROM dim_uf

--------------------------------------- dim_segmento ---------------------------------

DROP TABLE IF EXISTS dim_segmento;

CREATE TABLE dim_segmento
(
	segmento_id INT NOT NULL,
	segmento NVARCHAR(100)
)

INSERT INTO dim_segmento
SELECT 
	ROW_NUMBER() OVER(ORDER BY segmento) as segmento_id,
	segmento
FROM (SELECT DISTINCT segmento FROM dbo.scr_risco_credito) as seg

SELECT * FROM dim_segmento

--------------------------------------- dim_cliente ---------------------------------

DROP TABLE IF EXISTS dim_cliente;

CREATE TABLE dim_cliente
(
	cliente_id INT NOT NULL,
	cliente NVARCHAR(2)
)

INSERT INTO dim_cliente
SELECT 
	ROW_NUMBER() OVER(ORDER BY cliente) as cliente_id,
	cliente
FROM (SELECT DISTINCT cliente FROM dbo.scr_risco_credito) as c

SELECT * FROM dim_cliente

--------------------------------------- dim_cnae_ocupacao ---------------------------------

DROP TABLE IF EXISTS dim_cnae_ocupacao;

CREATE TABLE dim_cnae_ocupacao
(
	cnae_ocupacao_id INT NOT NULL,
	cnae_ocupacao NVARCHAR(100)
)

INSERT INTO dim_cnae_ocupacao
SELECT 
	ROW_NUMBER() OVER(ORDER BY cnae_ocupacao) as cnae_ocupacao_id,
	cnae_ocupacao
FROM (SELECT DISTINCT cnae_ocupacao FROM dbo.scr_risco_credito) as co

SELECT * FROM dim_cnae_ocupacao
--------------------------------------- dim_porte ---------------------------------

DROP TABLE IF EXISTS dim_porte;

CREATE TABLE dim_porte
(
	porte_id INT NOT NULL,
	porte NVARCHAR(100)
)

INSERT INTO dim_porte
SELECT 
	ROW_NUMBER () OVER(ORDER BY porte) as porte_id,
	p.porte 
FROM (SELECT DISTINCT porte FROM DBO.scr_risco_credito) as p

SELECT * FROM dim_porte

--------------------------------------- dim_modalidade ---------------------------------
DROP TABLE IF EXISTS dim_modalidade;

CREATE TABLE dim_modalidade
(
	modalidade_id INT NOT NULL,
	modalidade NVARCHAR(100)
)

INSERT INTO dim_modalidade
SELECT 
	ROW_NUMBER() OVER(ORDER BY modalidade) as modalidade_id,
	modalidade
FROM (SELECT DISTINCT modalidade FROM dbo.scr_risco_credito) as m

SELECT * FROM dim_modalidade

--------------------------------------- dim_submodalidade ---------------------------------

DROP TABLE IF EXISTS dim_submodalidade;

CREATE TABLE dim_submodalidade
(
	submodalidade_id INT NOT NULL,
	submodalidade NVARCHAR(160)
)

INSERT INTO dim_submodalidade
SELECT 
	ROW_NUMBER() OVER(ORDER BY submodalidade) as submodalidade_id,
	submodalidade
FROM (SELECT DISTINCT submodalidade FROM dbo.scr_risco_credito) as sm

SELECT * FROM dim_submodalidade

--------------------------------------- dim_origem ---------------------------------

DROP TABLE IF EXISTS dim_origem;

CREATE TABLE dim_origem
(
	origem_id INT NOT NULL,
	origem NVARCHAR(160)
)

INSERT INTO dim_origem
SELECT 
	ROW_NUMBER() OVER(ORDER BY origem) as origem_id,
	origem
FROM (SELECT DISTINCT origem FROM dbo.scr_risco_credito) as o

SELECT * FROM dim_origem

--------------------------------------- dim_indexador ---------------------------------

DROP TABLE IF EXISTS dim_indexador;

CREATE TABLE dim_indexador
(
	indexador_id INT NOT NULL,
	indexador NVARCHAR(100)
)

INSERT INTO dim_indexador
SELECT 
	ROW_NUMBER() OVER(ORDER BY indexador) as indexador_id,
	indexador
FROM (SELECT DISTINCT indexador FROM dbo.scr_risco_credito) as i

SELECT * FROM dim_indexador