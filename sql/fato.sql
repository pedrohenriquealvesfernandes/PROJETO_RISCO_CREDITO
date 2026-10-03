USE RiscoCredito;

IF OBJECT_ID ('fato_scr', 'V') IS NOT NULL
	DROP VIEW fato_scr;
GO

CREATE OR ALTER VIEW fato_scr AS
 SELECT 
	data_base,
	uf_id,
	segmento_id,
	cliente_id,
	cnae_ocupacao_id,
	porte_id,
	modalidade_id,
	submodalidade_id,
	origem_id,
	indexador_id,
	numero_de_operacoes,
	a_vencer_ate_90_dias,
	a_vencer_de_91_ate_360_dias
	a_vencer_de_361_ate_1080_dias,
	a_vencer_de_1081_ate_1800_dias,
	a_vencer_de_1801_ate_5400_dias,
	a_vencer_acima_de_5400_dias,
	carteira_a_vencer,
	vencido_de_15_ate_90_dias,
	vencido_acima_de_90_dias,
	carteira_vencida,
	carteira_ativa,
	carteira_inadimplencia,
	ativo_problematico
 FROM dbo.scr_risco_credito AS scr  
 LEFT JOIN dbo.dim_uf as u
	ON u.uf = scr.uf
 LEFT JOIN dbo.dim_segmento as seg
	ON seg.segmento = scr.segmento
 LEFT JOIN dbo.dim_cliente as c
	ON c.cliente = scr.cliente
 LEFT JOIN dbo.dim_cnae_ocupacao as co
	ON co.cnae_ocupacao = scr.cnae_ocupacao
 LEFT JOIN dbo.dim_porte as p
	ON p.porte = scr.porte
 LEFT JOIN dbo.dim_modalidade as m
	ON m.modalidade = scr.modalidade
 LEFT JOIN dbo.dim_submodalidade as sm
	ON sm.submodalidade = scr.submodalidade
 LEFT JOIN dbo.dim_origem as o
	ON o.origem = scr.origem
 LEFT JOIN dbo.dim_indexador as i
	ON i.indexador = scr.indexador
