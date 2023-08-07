class Personagem {
  String Nome;

  Personagem({required this.Nome});

  static Personagem fromString(String item) {
    return Personagem(Nome: item);
  }
}
