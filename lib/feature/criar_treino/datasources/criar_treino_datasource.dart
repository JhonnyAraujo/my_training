import 'dart:convert';

import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICriarTreinoDatasouce {
  Future<void> salvarTreino({required List<TreinoModel> treinos});
}

class CriarTreinoDatasource implements ICriarTreinoDatasouce {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  @override
  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    try {
      final jsonList = treinos.map((treino) => treino.toJson()).toList();
      await asyncPrefs.setString('treinos', jsonEncode(jsonList));
    } catch (_) {
      throw Exception('Não foi possível criar o treino');
    }
  }
} 
