import pandas as pd
from silver.cleaning import limpeza

def transformacao() -> pd.DataFrame:
    df_completo = limpeza()

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
    # Transformando os tipo das colunas com valores decimais para string, depois alterando as vírgulas para pontos e por fim transformando os tipos das colunas em float
    df_completo[colunas_numericas] = df_completo[colunas_numericas].astype(
        str).replace(',', '.', regex=True).astype('float64').replace('.', ',', regex=True)
    # Alteração da coluna 'data_base' em datetime64
    df_completo = df_completo.astype({'data_base': 'datetime64[ns]'})
    
    return df_completo


if __name__ == "__main__":
    transformacao()
