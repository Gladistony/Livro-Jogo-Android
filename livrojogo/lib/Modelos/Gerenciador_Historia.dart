import 'package:livrojogo/Modelos/Capitulo.dart';
import 'package:livrojogo/Modelos/Personagem.dart';

class GerenciadorModelos {
  String Id;
  String Nome;
  List<Personagem> NPCs;
  List<Capitulo> Capilutos;

  GerenciadorModelos(
      {required this.Id,
      required this.Nome,
      required this.NPCs,
      required this.Capilutos});

  GerenciadorModelos.fromMap(Map<String, dynamic> map)
      : Id = map["id"],
        Nome = map["nome"],
        NPCs = map["npcs"],
        Capilutos = map["capitulos"];

  Map<String, dynamic> toMap() {
    return {
      "id": Id,
      "nome": Nome,
      "npcs": NPCs,
      "capitulos": Capilutos,
    };
  }
}
