import 'package:livrojogo/Modelos/Personagem.dart';

class Capitulo {
  Personagem pjPrincipal;
  String? narracao;

  Capitulo({required this.pjPrincipal});

  static Capitulo fromString(String item) {
    List<String> lista = item.split(",");
    return Capitulo(
        pjPrincipal: Personagem(
      Nome: lista[0],
    ));
  }
}
