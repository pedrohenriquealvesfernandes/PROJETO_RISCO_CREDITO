import pandas as pd
import numpy as np
import glob
import re

# Armazenando o caminho dos arquivos extraidos
arquivos_extraidos = glob.glob('../../data/bronze/arquivos_extraidos/*.csv')
# Transformando em lista a variável criada
arquivos_extraidos_lista = list(arquivos_extraidos)
# Concatenando os DataFrames em um só
df_completo = pd.concat([pd.read_csv(arq, sep=';') for arq in arquivos_extraidos_lista], ignore_index=True)
# Alterando o valor de -1 para 0 na coluna numero_de_operacoes
df_completo['numero_de_operacoes'] = df_completo['numero_de_operacoes'].replace(to_replace=-1, value=0)
# Alterando a coluna data_base para o formato padrão dd/mm/yyyy
df_completo['data_base'] = df_completo['data_base'].str.replace(
    r'(\d{4})-(\d{2})-(\d{2})', 
    r'\3/\2/\1',
    regex=True)


