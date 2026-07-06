import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CriarTreinoView extends StatefulWidget {
  const CriarTreinoView({super.key});

  @override
  State<CriarTreinoView> createState() => _CriarTreinoViewState();
}

class _CriarTreinoViewState extends State<CriarTreinoView> {
  int maisExercicio = 1;

  final TextEditingController nomeTreinoController = TextEditingController();
  final TextEditingController intervaloTreinoController =
      TextEditingController();

  @override
  void dispose() {
    nomeTreinoController.dispose();
    intervaloTreinoController.dispose();
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Intervalo',
                  hintText: 'Quantos minutos de intervalo?',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: maisExercicio + 1,
                  itemBuilder: (_, index) {
                    if (index <= (maisExercicio - 1)) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
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
                            onPressed: () => setState(() {
                              maisExercicio++;
                            }),
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
                  onPressed: () {},
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
