# 💳 Análise de Risco de Crédito - SCR

[![LinkedIn](https://img.shields.io/badge/LinkedIn-pedrohalves-0077B5?style=flat&logo=linkedin)](https://www.linkedin.com/in/pedrohalves/)
[![GitHub](https://img.shields.io/badge/GitHub-pedrohenriquealvesfernandes-ff7300?style=flat&logo=GitHub)](https://github.com/pedrohenriquealvesfernandes)


> Projeto de ETL para coleta, transformação e análise dos dados das operações de crédito referentes a 2025, disponibilizados pelo Banco Central do Brasil por meio do Sistema de Informações de Créditos (SCR).

---
## Aparência do Dashboard

  [![Dashboard Análise de Risco de Crédito](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/img/Insights.jpg)](https://app.powerbi.com/view?r=eyJrIjoiYWY3YmE3MjctNTVjMS00YTllLWEyZTQtMzgwZTE5OGI2ODY4IiwidCI6IjM4MDQwNjEzLTI2MDItNDJjMC1iNDVkLWU4YTk4ZjgzY2Q1MCJ9)

---

## 🔗 Links Importantes do Projeto

| 🗃 Tema  | 🔗 Link |
|:-----------:|:--------:|
| 📈 **Dashboard** | [Power BI - Análise de Risco de Crédito](https://app.powerbi.com/view?r=eyJrIjoiYWY3YmE3MjctNTVjMS00YTllLWEyZTQtMzgwZTE5OGI2ODY4IiwidCI6IjM4MDQwNjEzLTI2MDItNDJjMC1iNDVkLWU4YTk4ZjgzY2Q1MCJ9) |
| 📄 **Documentação** | [Notion - Etapas e Tópicos do Projeto](https://app.notion.com/p/An-lise-de-Risco-de-Cr-dito-3e3134e65c5c8047977bd3afd182fa3f?source=copy_link) |
| 💻 **Repositório** | [GitHub - PROJETO_RISCO_CREDITO](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO) |

---

## 📋 Sumário

- [Sobre o Projeto](#-sobre-o-projeto)
- [Arquitetura do Pipeline](#-arquitetura-do-pipeline)
- [Stack Tecnológica](#-stack-tecnológica)
- [Detalhamento das Etapas](#-detalhamento-das-etapas)
- [Contribuindo](#-contribuindo)

---

## 🎯 Sobre o Projeto

> **Problema de Negócio**: Analisar a composição da carteira de crédito do sistema financeiro brasileiro e identificar as medidas agregadas de Inadimplência, Carteira Ativa, Número de Operações e Ativo Problematico com a possibilidade de detalhamento por segmentos.

---

## 🏗️ Arquitetura do Pipeline

![Pipeline](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/img/Pipeline.jpg)

---

## 🛠️ Stack Tecnológica

### Core
- **Python 3.14+** - Linguagem principal
- **Notion** - Orquestração do pipeline
- **SQL Server** - Banco de dados relacional
- **Power BI** - Visualização do Dashboard


### Bibliotecas Python
- **pandas** - Manipulação e transformação de dados
- **numpy** - Funções matemáticas


### Outras Ferramentas
- **Jupyter Notebook** - Análise exploratória de dados
- **UV** - Gerenciador de pacotes Python rápido

---

## 🔍 Detalhamento das Etapas

### 🥉 **EXTRAÇÃO**

**Acesso ao dataset:**
Os arquivos mensais do tipo CSV, com campos separados por ; (ponto e vírgula) são disponibilizados dentro de arquivos anuais compactados que podem ser acessados a partir da seguinte URL:
https://www.bcb.gov.br/pda/desig/scrdata_{ANO}.zip

Substituindo a expressão {ANO} pelo ano correspondente. Por exemplo, o arquivo com os dados de 2025 podem
ser baixados através da URL:
https://www.bcb.gov.br/pda/desig/scrdata_2025.zip

**Arquivo:** [`src/bronze/ingestion.py`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/src/bronze/ingestion.py)

**O que faz:**

#### 1.1  Extração do dataset

Extração do arquivo `srcdata[ano].zip`, localizado na pasta data/bronze/, conforme o ano definido na função.

#### 1.2 Armazenamento dos arquivos gerados
Os arquivos .csv gerados pela extração são salvos na pasta data/bronze/arquivos_extraidos.

**Dados coletados:**

- Carteira Ativa ➡ Calcula-se pela totalização dos valores dos vencimentos a vencer e vencidos;
- Inadimplência ➡ Calcula-se pela totalização dos valores vencidos há mais de 90 dias;
- Ativo Problemático ➡  Calcula-se pela totalização dos valores quando há evidências de que a obrigação não será integralmente honrada;
- Número de Operações ➡ Representa o número de operações de crédito para um dado recorte de dados;
- Valores a vencer até 90 dias ➡ Somatório dos créditos a vencer até 90 dias;
- Valores a vencer de 91 a 360 dias ➡Somatório dos créditos a vencer de 91 até 360 dias;
- Valores a vencer de 361 até 1080 dias ➡ Somatório dos créditos a vencer de 361 até 1080 dias;
- Valores a vencer de 1081 até 1800 dias ➡ Somatório dos créditos a vencer de 1081 até 1800 dias;
- Valores a vencer de 1801 até 5400 dias ➡ Somatório dos créditos a vencer de 1801 até 5400 dias;
- Valores a vencer acima de 5400 dias ➡ Somatório dos créditos a vencer acima de 5400 dias;
- Carteira a Vencer ➡ Somatórios dos valores a vencer;
- Valores vencidos de 15 a 90 dias ➡ Somatório dos créditos vencidos de 15 até 90 dias;
- Valores vencidos acima de 90 dias ➡ Somatório dos créditos vencidos acima de 90 dias;
- Carteira vencida ➡ Somatório dos valores vencido;
- Data Base ➡ Data de referência dos dados;
- UF ➡ As 27 unidades da federação;
- Segmento da instituição financeira ➡ Agrupamentos que foram criados a partir do segmento da instituição financeira cadastrado no Banco Central (Arrendamento, Banco, Cooperativa, etc..);
- Tipo de Cliente ➡ Os 2 tipos de agrupamento de clientes (Pessoa Física e Pessoa Jurídica);
- CNAE / Ocupação ➡ Naturezação da Ocupação para Pessoas Físicas / classificação e categorização das atividades econômicas para Pessoa Jurídica;
- Porte dos Clientes ➡ Valor recebido em salário para Pessoas Físicas / porte da empresa para Pessoas Jurídicas;
- Modalidades ➡ Finalidade da requisição de crédito (Empréstimos, Financiamentos, Operações de arrendamento, etc..)
- Submodalidade ➡ Detalhamento das modalidades;
- Origem de Recursos ➡ Origem da requisição de crédito;
- Indexador da Operação ➡ Corrigir o valor do saldo devedor e calcular as parcelas de um financiamento.

---

### 🥈 **TRANSFORMAÇÃO**

**Arquivo:** [`src/silver/cleaning.py`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/src/silver/cleaning.py)

**O que faz:**

#### 2.1 **Criação do DataFrame**
- Concatenação dos arquivos .csv em um único arquivo .csv
- Transformação dos valores negativos na coluna `numero_de_operacoes` em 0.
- Alteração do formato padrão de data da coluna `data_base` para dd/mm/yyyy.

#### 2.2 Transformação dos dados do DataFrame
- Alteração do tipo das colunas         `a_vencer_ate_90_dias`,
        `a_vencer_de_91_ate_360_dias`,
        `a_vencer_de_361_ate_1080_dias`,
        `a_vencer_de_1081_ate_1800_dias`,
        `a_vencer_de_1801_ate_5400_dias`,
        `a_vencer_acima_de_5400_dias`,
        `carteira_a_vencer`,
        `vencido_de_15_ate_90_dias`,
        `vencido_acima_de_90_dias`,
        `carteira_vencida`,
        `carteira_ativa`,
        `carteira_inadimplencia`,
        `ativo_problematico` para float64.
- Alteração do tipo da coluna `data_base` para datetime64

---

### 🥇 **CARREGAMENTO**

**Arquivo:** [`src/gold/exportation.py`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/src/gold/exportation.py)

**O que faz:**

#### 3.1 Exportação dos dados limpos

- Exportação do arquivo .csv com os dados limpos para a pasta data/gold/.

#### 3.2 **Inserção dos dados no SQL Server**

**Arquivo**: [`sql/importaçãodb.sql`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/sql/importacaodb.sql)

- Criação da tabela `scr_risco_credito` e tipagem de seus campos.
- Criação da procedure `sp_inserir_dados` com a utilização de TRUNCATE TABLE E BULK INSERT dos `dados_limpos.csv`.
- Execução da procedure `sp_inserir_dados`.

#### 3.3 Criação das tabelas Dimensões

**Arquivo**: [`sql/dimensoes.sql`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/sql/dimensoes.sql)

- Criação das tabelas dimensões: `dim_uf`, `dim_segmento`, `dim_cliente`, `dim_cnae_ocupacao`, `dim_porte`, `dim_modalidade`, `dim_submodalidade`, `dim_origem`, `dim_indexador`.

#### 3.4 Criação da tabela fato

**Arquivo**: [`sql/fato.sql`](https://github.com/pedrohenriquealvesfernandes/PROJETO_RISCO_CREDITO/blob/main/sql/fato.sql)

 - Utilização de INNER JOIN para junção e criação de ID das categorias para inserir na tabela fato.

 #### 3.5 **Validação das tabelas**
- Vericação de valores nulos ou duplicados.
- Verificação do total de registros.

---

## Indicadores e Páginas do Dashboard

- Importação das tabelas dimensões e fato para o Power BI.
- Criação da Tabela Calendário
- Realização da Modelagem de Dados
- Definição dos KPIs que serão utilizados no Dashboard
- Seleção dos Gráficos, Paleta de Cores e Plano de Fundo para o Dashboard
- Desenvolvimento e Publicação do Dashboard

---

## Principais descobertas com os resultados

- A taxa de inadimplência é inferior a 5% na maioria dos cenários analisados.
- O segmento “Banco” representa mais de 75% do total da inadimplência.
- As regiões Sul e Sudeste concentram, conjuntamente, 68% da Carteira Ativa e 60% do total de inadimplência.
- O valor médio total da Carteira Ativa é de R$ 20,75 bilhões.
- A modalidade de Empréstimo apresenta o cenário mais preocupante, pois a maior discrepância entre a participação na Carteira Ativa e a proporção de inadimplência indica um desequilíbrio mais acentuado em comparação às demais modalidades.
- O estado do Maranhão apresenta a maior taxa de inadimplência, atingindo 6,15%.
---

## 📧 Contato

**Pedro Henrique Alves Fernandes | pedrohenriquealvesfernandes02@gmail.com**


[![Instagram](https://img.shields.io/badge/Instagram-@ppedro_halvess-E4405F?style=flat&logo=instagram)](https://www.instagram.com/ppedro_halvess)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-pedrohalves-0077B5?style=flat&logo=linkedin)](https://www.linkedin.com/in/pedrohalves/)
[![GitHub](https://img.shields.io/badge/GitHub-pedrohenriquealvesfernandes-ff7300?style=flat&logo=GitHub)](https://github.com/pedrohenriquealvesfernandes)


