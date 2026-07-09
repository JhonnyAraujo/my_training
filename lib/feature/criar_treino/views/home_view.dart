import 'package:flutter/material.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/criar_treino/view_models/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_training/feature/criar_treino/views/criar_treino_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: viewModel.treinos.length,
                itemBuilder: (_, index) {
                  TreinoModel treino = viewModel.treinos[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(treino.name, textAlign: TextAlign.center),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          TreinoModel novoTreino = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CriarTreinoView()),
          );
          viewModel.adicionaTreino(novoTreino: novoTreino);
        },
        label: const Text('Criar um treino'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
