import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text('Treino 1', textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Criar um treino'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
