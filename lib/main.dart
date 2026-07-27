import 'package:flutter/material.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';
import 'package:my_training/feature/criar_treino/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();

    return MaterialApp(
      title: 'My Training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(controller: controller),
    );
  }
}
