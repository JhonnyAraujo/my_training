import 'package:flutter_test/flutter_test.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TreinoDatasource datasource;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
    datasource = TreinoDatasource();
  });
  
  group('TreinoDatasource -', () {
    test('deve salvar os treinos e buscar com sucesso', () async {
      // Arrange
        final treino = TreinoModel(name: 'Treino A', interval: 60, exercises: ['Flexao']);

      // Act
        await datasource.salvarTreino(treinos: [treino]);
        final List<TreinoModel> result = await datasource.buscarTreinos();

      // Assert
        expect(result, isNotEmpty);
        expect(result.first.name, 'Treino A');
        expect(result.first.interval, 60);
        expect(result.first.exercises, ['Flexao']);
    });

    test('deve remover o treino correspondente ao id informado', () async {
      // Arrange
        final treinoA = TreinoModel(id: 1, name: 'Treino A', interval: 60, exercises: ['Flexao']);
        final treinoB = TreinoModel(id: 2, name: 'Treino B', interval: 60, exercises: ['Barra']);

      // Act
        await datasource.salvarTreino(treinos: [treinoA, treinoB]);
        await datasource.removeTreino(id: 1);
        final List<TreinoModel> result = await datasource.buscarTreinos();

      // Assert
        expect(result, hasLength(1));
        expect(result.first.id, 2);
        expect(result.first.name, treinoB.name);
    });
  });
}