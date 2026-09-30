import pandas as pd
import numpy as np
from cleaning import df_completo

# Criação de lista apenas das coluas com valores decimais
colunas_numericas = [
    'a_vencer_ate_90_dias',
    'a_vencer_de_91_ate_360_dias',
    'a_vencer_de_361_ate_1080_dias',
    'a_vencer_de_1081_ate_1800_dias',
    'a_vencer_de_1801_ate_5400_dias',
    'a_vencer_acima_de_5400_dias',
    'carteira_a_vencer',
    'vencido_de_15_ate_90_dias',
    'vencido_acima_de_90_dias',
    'carteira_vencida',
    'carteira_ativa',
    'carteira_inadimplencia',
    'ativo_problematico'
]
# Transformando os tipo das colunas com valores decimais para string e posteriormente alterando as vírgulas para pontos
df_completo[colunas_numericas] = df_completo[colunas_numericas].astype(str).replace(',','.', regex=True)
# Após alterar as vírgula para pontos, transformado os tipo das colunas de valores decimais em float
df_completo[colunas_numericas] = df_completo[colunas_numericas].astype('float64')
# Alteração da coluna 'data_base' em datetime64
df_completo = df_completo.astype({'data_base': 'datetime64[ns]',})

print(df_completo.info())