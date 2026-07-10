import 'package:flutter/material.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';

class CriarTreinoPage extends StatefulWidget {
  const CriarTreinoPage({super.key});

  @override
  State<CriarTreinoPage> createState() => _CriarTreinoPageState();
}

class _CriarTreinoPageState extends State<CriarTreinoPage> {
  final List<String> listaExercicios = [];

  final TextEditingController nomeTreinoController = TextEditingController();
  final TextEditingController intervaloTreinoController =
      TextEditingController();
  final TextEditingController exercicioTreinoController =
      TextEditingController();

  @override
  void dispose() {
    nomeTreinoController.dispose();
    intervaloTreinoController.dispose();
    exercicioTreinoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Treino'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: nomeTreinoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do treino',
                  hintText: 'Ex: Treino de costa',
                ),
              ),
              TextField(
                controller: intervaloTreinoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Intervalo',
                  hintText: 'Quantos minutos de intervalo?',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listaExercicios.length + 2,
                  itemBuilder: (_, index) {
                    if (index < listaExercicios.length) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 18,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                          border: BoxBorder.all(color: Colors.black54),
                        ),
                        child: Text(listaExercicios[index]),
                      );
                    } else if (index == listaExercicios.length) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: exercicioTreinoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome do exercicio',
                            hintText: 'Ex: Flexão',
                          ),
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Divider()),
                          IconButton.filled(
                            onPressed: () {
                              final nomeExercicio =
                                  exercicioTreinoController.text;

                              if (nomeExercicio.isEmpty) {
                                return;
                              }

                              setState(() {
                                listaExercicios.add(nomeExercicio);
                                exercicioTreinoController.clear();
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                          Expanded(child: Divider()),
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 62,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    final TreinoModel novoTreino = TreinoModel(
                      name: nomeTreinoController.text,
                      interval:
                          int.tryParse(intervaloTreinoController.text) ?? 0,
                      exercises: listaExercicios,
                    );

                    Navigator.pop(context, novoTreino);
                  },
                  child: Text('Criar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
