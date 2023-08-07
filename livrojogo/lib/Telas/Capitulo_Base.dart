import "package:flutter/material.dart";
import "package:livrojogo/Modelos/Gerenciador_Historia.dart";

import "../data/data_sqlite.dart";

class CapituloBase extends StatefulWidget {
  CapituloBase({super.key});

  @override
  State<CapituloBase> createState() => _CapituloBaseState();
}

class _CapituloBaseState extends State<CapituloBase> {
  // List<GerenciadorModelos> ListaHistoria = [
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
          //print("Teste");
          DataSqliteDataSource().create(GerenciadorModelos(
              Id: 1,
              Nome: "Fuga da ilha",
              NPCs: List.empty(),
              Capilutos: List.empty()));
          setState(() {});
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
          // children: List.generate(ListaHistoria.length, (index) {
          //   GerenciadorModelos modeloAtual = ListaHistoria[index];
          //   return ElevatedButton(
          //       onPressed: () {}, child: Text(modeloAtual.Nome));}
          children: [
            FutureBuilder(
              future: DataSqliteDataSource().getAll(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GerenciadorModelos>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        GerenciadorModelos modeloAtual = snapshot.data![index];
                        return ElevatedButton(
                            onPressed: () {}, child: Text(modeloAtual.Nome));
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
