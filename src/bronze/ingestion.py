import pandas as pd
import numpy as np
import zipfile
import os

# Essa variável irá especificar o diretório para extração
target_directory = "../../data/bronze/arquivos_extraidos"
# Faz a confirmação para verificar se o diretório existe
os.makedirs(target_directory,exist_ok=True)
# Criação de variavel para extração de ano
ano_extracao = np.array([2022,2023,2024,2025])
# Abre e extrai todos os arquivos zip
for ano in ano_extracao:
    with zipfile.ZipFile("../../data/bronze/scrdata_" + str(ano) + ".zip", "r") as zip_ref:
        zip_ref.extractall(target_directory)

print("Extração feita")
