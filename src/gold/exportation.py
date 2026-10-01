from silver.transformation import transformacao


def exportacao():
    df_finalizado = transformacao()
    caminho_saida = '../../data/gold/dados_limpos.csv'
    # Exportação de dados
    df_finalizado.to_csv(caminho_saida, sep=';', index=False)

    return caminho_saida


if __name__ == "__main__":
    exportacao()
