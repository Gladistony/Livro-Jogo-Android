const String TABELA_NOME = "historias";

const String COLUNA_ID = "id";
const String COLUNA_NOME = "nome";
const String COLUNA_NPCS = "npcs";
const String COLUNA_CAPITULOS = "capitulos";

const String CREATE_TABLE = '''
    CREATE TABLE $TABELA_NOME 
    (
    $COLUNA_ID INTEGER PRIMARY KEY,
    $COLUNA_NOME TEXT,
    $COLUNA_NPCS TEXT,
    $COLUNA_CAPITULOS TEXT
    )
    ''';
