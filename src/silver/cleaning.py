import pandas as pd
import numpy as np
import glob

# Armazenando o caminho dos arquivos extraidos
arquivos_extraidos = glob.glob('../../data/bronze/arquivos_extraidos/*.csv')
# Transformando em lista a variável criada
arquivos_extraidos_lista = list(arquivos_extraidos)
# Concatenando os DataFrames em um só
dfs_completo = pd.concat([pd.read_csv(arq, sep=';') for arq in np.array(arquivos_extraidos_lista)], ignore_index=True)

dfs_completo = dfs_completo["numero_de_operacoes"].replace("-1", "0")
print(dfs_completo["numero_de_operacoes"].head(5))


git