import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/criar_treino/controller/home_controller.dart';
import 'package:my_training/feature/criar_treino/pages/criar_treino_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    buscarTreino();
    super.initState();
  }

  void buscarTreino() {
    try {
      widget.controller.buscarTreino();
    } catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exception.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: widget.controller.treinos.length,
              itemBuilder: (_, index) {
                TreinoModel treino = widget.controller.treinos[index];
                return Dismissible(
                  key: ValueKey(treino.id),
                  onDismissed: (_) {
                    try {
                      widget.controller.removeTreino(id: treino.id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Treino removido com sucesso!')));
                    } catch (exception) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exception.toString())));
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.remove),
                  ),

                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(treino.name, textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CriarTreinoPage()),
          );

          buscarTreino();
        },
        label: const Text('Criar um treino'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
