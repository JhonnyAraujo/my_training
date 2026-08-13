import 'package:flutter_test/flutter_test.dart';
import 'package:my_training/core/models/treino_model.dart';

void main() {
  group('TreinoModel -', () {
    test('deve converter TreinoModel para um Map no toJson', () {
      // 1. ARRANGE (Preparar o TreinoModel com dados de teste)
      final TreinoModel treino = TreinoModel(name: 'Treino A', interval: 60, exercises: ['Flexão']);

      // 2. ACT (Chamar o .toJson())
      final Map<String, dynamic> map = treino.toJson();

      // 3. ASSERT (Verificar com o expect se o Map gerado é igual ao esperado) 
      expect(map['name'], 'Treino A');
      expect(map['interval'], 60);
      expect(map['exercises'], ['Flexão']);
    });

    test('deve criar uma instancia de TreinoModel a partir de um Map no fromJson', () {
      // ARRANGE
      final Map<String, dynamic> json = {
        'name': 'Treino B',
        'interval': 60,
        'exercises': ['Flexão']
      };

      // ACT
      final TreinoModel treino = TreinoModel.fromJson(json);

      // ASSERT
      expect(treino.name, 'Treino B');
      expect(treino.interval, 60);
      expect(treino.exercises, ['Flexão']);
    });
  });
}