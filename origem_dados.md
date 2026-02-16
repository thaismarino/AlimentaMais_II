# Fonte de Dados e Processo de Extração

## 1. Fonte Oficial dos Dados
[cite_start]A fonte oficial utilizada neste projeto são os **Microdados do Censo Escolar da Educação Básica 2024**, produzidos e divulgados pelo **Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP)**[cite: 82, 84].

[cite_start]O Censo Escolar é a principal pesquisa estatística educacional brasileira, abrangendo todas as escolas, turmas, docentes e matrículas da educação básica[cite: 86]. [cite_start]A escolha desta fonte justifica-se pela sua abrangência censitária (nacional), legitimidade oficial e granularidade dos dados, permitindo análises detalhadas sobre a infraestrutura escolar[cite: 63, 69].

## 2. Obtenção dos Dados
Os dados são públicos e foram obtidos através do portal oficial de **Dados Abertos do INEP** (Gov.br).
* [cite_start]**Formato:** Os arquivos estão disponibilizados em formato **.CSV** (Comma-Separated Values), o que garante interoperabilidade e facilidade de leitura por softwares estatísticos e linguagens de programação como Python[cite: 90, 92].
* [cite_start]**Arquivos Utilizados:** O foco da extração são os arquivos referentes às **Escolas**, pois contêm as variáveis de infraestrutura física, tecnológica e administrativa necessárias para o cálculo dos indicadores propostos[cite: 182].

## 3. Processo de Extração (ETL)
[cite_start]O processo de extração foi planejado para garantir a integridade das informações originais[cite: 127]. As etapas técnicas incluem:

1.  [cite_start]**Leitura Automatizada:** Utilização da linguagem **Python** e da biblioteca **Pandas** para leitura dos arquivos CSV brutos.
2.  [cite_start]**Configuração de Leitura:** Definição correta dos parâmetros de codificação (encoding) e delimitadores (separador `;`) conforme o dicionário de dados do INEP[cite: 126].
3.  [cite_start]**Seleção de Variáveis (Filtragem Vertical):** Durante a extração, são selecionadas apenas as colunas relevantes para o estudo de infraestrutura e localização, descartando dados desnecessários para otimizar o processamento.
    * [cite_start]*Geográficas:* `NO_REGIAO`, `SG_UF`, `NO_MUNICIPIO`[cite: 95].
    * [cite_start]*Administrativas:* `TP_DEPENDENCIA` (Rede Pública/Privada), `TP_LOCALIZACAO` (Urbana/Rural)[cite: 96, 97].
    * [cite_start]*Infraestrutura:* `IN_AGUA_REDE_PUBLICA`, `IN_ENERGIA_REDE_PUBLICA`, `IN_INTERNET`, `IN_BIBLIOTECA`, `IN_LABORATORIO_INFORMATICA`, etc.[cite: 98, 99].

Este processo gera um *dataframe* inicial contendo apenas os dados brutos de interesse, pronto para as etapas subsequentes de Transformação e Carga.
