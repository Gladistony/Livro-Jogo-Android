import 'package:livrojogo/Modelos/Gerenciador_Historia.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'data_constantes.dart';

class DataSqliteDataSource {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'livrojogo.db'),
      onCreate: (db, version) {
        return db.execute(
          CREATE_TABLE,
        );
      },
      version: 1,
    );
  }

  Future create(GerenciadorModelos gerenciadorModelos) async {
    final Database db = await _getDatabase();

    gerenciadorModelos.Id = await db.rawInsert(''' 
    insert into $TABELA_NOME (
      $COLUNA_NOME,
      $COLUNA_NPCS,
      $COLUNA_CAPITULOS
    ) values (?,?,?)
    ''', [
      gerenciadorModelos.Nome,
      gerenciadorModelos.getNPCs(),
      gerenciadorModelos.getCapitulos()
    ]);
  }

  Future<GerenciadorModelos> getFirst() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TABELA_NOME);

    return GerenciadorModelos.fromMap(maps.first);
  }

  Future<List<GerenciadorModelos>> getAll() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TABELA_NOME);

    return List.generate(maps.length, (index) {
      return GerenciadorModelos.fromMap(maps[index]);
    });
  }
}
