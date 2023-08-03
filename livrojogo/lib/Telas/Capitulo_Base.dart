import "package:flutter/material.dart";
import "package:livrojogo/Modelos/Gerenciador_Historia.dart";

class CapituloBase extends StatelessWidget {
  CapituloBase({super.key});

  final List<GerenciadorModelos> ListaHistoria = [
    GerenciadorModelos(
        Id: "ID001",
        Nome: "Fuga da ilha",
        NPCs: List.empty(),
        Capilutos: List.empty()),
    GerenciadorModelos(
        Id: "ID002",
        Nome: "O grande roubo",
        NPCs: List.empty(),
        Capilutos: List.empty())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Lista de Historias"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A6D92),
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Teste");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: List.generate(ListaHistoria.length, (index) {
            GerenciadorModelos modeloAtual = ListaHistoria[index];
            return ElevatedButton(
                onPressed: () {}, child: Text(modeloAtual.Nome));
          }),
        ),
      ),
    );
  }
}
