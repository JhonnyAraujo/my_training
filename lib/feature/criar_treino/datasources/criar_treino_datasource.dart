import 'dart:convert';

import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CriarTreinoDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    try {
      final jsonList = treinos.map((treino) => treino.toJson()).toList();
      await asyncPrefs.setString('treinos', jsonEncode(jsonList));
    } catch (_) {
      throw Exception('Não foi possível criar o treino');
    }
  }
} 
