import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/feature/home/binding/home_binding.dart';
import 'package:my_training/feature/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'My Training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialBinding: HomeBinding(),
      home: const HomePage(),
    );
  }
}
