import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';

class MockTreinoRepository extends Mock implements ITreinoRepository {}

void main() {
  late MockTreinoRepository mockRepository;
  late HomeController controller;

  setUp(() {
    mockRepository = MockTreinoRepository();
    controller = HomeController(repository: mockRepository);
  });

  group('HomeController -', () {
    test('deve chamar o repository para trazer os treinos', () async {
      //Arrange
      final TreinoModel treinoA = TreinoModel(name: 'Treino A', interval: 60, exercises: ['Felxao']);
      when(() => mockRepository.buscarTreinos()).thenAnswer((_) async => [treinoA]);

      //Act
      await controller.buscarTreino();

      //Assert
      verify(() => mockRepository.buscarTreinos()).called(1);
      expect(controller.treinos[0], treinoA);
    });

    test('deve chamar o repository para remover um treino identificado pelo id', () async {
      //Arrange
      const int idTreino = 1;
      when(() => mockRepository.removeTreino(id: any(named: 'id'))).thenAnswer((_) async => {});

      //Act
      await controller.removeTreino(id: idTreino);

      //Assert
      verify(() => mockRepository.removeTreino(id: idTreino)).called(1);

    });
  });
}