import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class MockTreinoDatasource extends Mock implements ITreinoDatasource {}

void main() {
  late MockTreinoDatasource mockDatasource;
  late TreinoRepository repository;

  setUp(() {
    mockDatasource = MockTreinoDatasource();
    repository = TreinoRepository(datasource: mockDatasource);
  });

  group('TreinoRepository -', () {
    test('deve chamar o datasource para buscar a lista de treinos e retornar a lista', () async {
      // Arrange
        final TreinoModel treino = TreinoModel(name: 'Treino A', interval: 60, exercises: ['Flexao']);
        when(() => mockDatasource.buscarTreinos()).thenAnswer((_) async => [treino]);

      // Act
        final result = await repository.buscarTreinos();

      // Assert
        verify(() => mockDatasource.buscarTreinos()).called(1);
        expect(result, [treino]);
    });

    test('deve chamar o datasource para salvar um treino criado', () async {
      // Arrange
        final TreinoModel treino = TreinoModel(name: 'Treino A', interval: 60, exercises: ['Flexao']);
        when(() => mockDatasource.salvarTreino(treinos: any(named: 'treinos'))).thenAnswer((_) async => {});

      // Act
        await repository.salvarTreino(treinos: [treino]);

      // Assert
        verify(() => mockDatasource.salvarTreino(treinos: [treino])).called(1);
    });

    test('deve chamar o datasource para remover um treino identificado pelo id', () async {
      // Arrange
        const int idTreino = 1;
        when(() => mockDatasource.removeTreino(id: any(named: 'id'))).thenAnswer((_) async {});

      // Act
        await repository.removeTreino(id: idTreino);
        
      // Assert
        verify(() => mockDatasource.removeTreino(id: idTreino)).called(1);
    });
  });
}