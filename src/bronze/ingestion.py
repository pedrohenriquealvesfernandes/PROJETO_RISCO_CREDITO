import pandas as pd
import numpy as np
import zipfile
import os


def importacao() -> pd.DataFrame:
    # Essa variável irá especificar o diretório para extração
    diretorio_extracao = "../../data/bronze/arquivos_extraidos"
    # Faz a confirmação para verificar se o diretório existe
    os.makedirs(diretorio_extracao, exist_ok=True)
    # Criação de variavel para definir quais anos serão extraidos
    ano_extracao = np.array([2025])
    # Abre e extrai todos os arquivos zip
    for ano in ano_extracao:
        with zipfile.ZipFile("../../data/bronze/scrdata_" + str(ano) + ".zip", "r") as zip_ref:
            arquivos_extraidos = zip_ref.extractall(diretorio_extracao)

    return diretorio_extracao


if __name__ == "__main__":
    importacao()
