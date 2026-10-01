from bronze.ingestion import importacao
from silver.cleaning import limpeza
from silver.transformation import transformacao
from gold.exportation import exportacao
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')   

def exec_pipeline():
    try:
        logging.info(f'>> Iniciando a descompactação e armazenamento dos arquivos')
        importacao()
        caminho_importacao = importacao()
        logging.info(f'>> Arquivos descompactados e armazenados na pasta: {caminho_importacao}')

        logging.info(f'>> Iniciando a limpeza das colunas')
        limpeza()
        logging.info(f'>> Limpeza realizada!!')

        logging.info(f'>> Iniciando a transformação das colunas')
        transformacao()
        logging.info(f'>> Transformação feita!!')

        logging.info(f'>> Iniciando a exportação do arquivo finalizado')
        exportacao()
        caminho_exportacao = exportacao()
        logging.info(f'>> Exportação realizada!!!')
        logging.info(f'>> Arquivo salvo na pasta: {caminho_exportacao}')
    except Exception as e:
        logging.error(f'Erro no pipeline: {e}')

if __name__ == '__main__':
    exec_pipeline()