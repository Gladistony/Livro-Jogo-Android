import 'package:equatable/equatable.dart';
import 'package:livrojogo/Modelos/Capitulo.dart';
import 'package:livrojogo/Modelos/Personagem.dart';

class GerenciadorModelos extends Equatable {
  int Id;
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
        NPCs = List.empty(),
        Capilutos = List.empty();

  Map<String, dynamic> toMap() {
    return {
      "id": Id,
      "nome": Nome,
      "npcs": NPCs,
      "capitulos": Capilutos,
    };
  }

  List<Personagem> getNPCsFromString(String texto) {
    List<Personagem> retorno = List.empty();
    List<String> lista = texto.split("#");
    for (var item in lista) {
      retorno.add(Personagem.fromString(item));
    }
    return retorno;
  }

  String getNPCs() {
    String retorno = "";
    for (var item in NPCs) {
      retorno += "${item.Nome}, ";
      retorno += "#";
    }
    return retorno;
  }

  String getCapitulos() {
    String retorno = "";
    for (var item in Capilutos) {
      retorno += "${item.narracao}, ";
      retorno += "#";
    }
    return retorno;
  }

  @override
  List<Object?> get props => [Id];
}
