import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';
import 'package:my_training/feature/home/pages/home_page.dart';

class MockTreinoRepository extends Mock implements ITreinoRepository {}

void main() {
  late MockTreinoRepository mockTreinoRepository;
  late HomeController controller;

  setUp(() {
    mockTreinoRepository = MockTreinoRepository();

    when(() => mockTreinoRepository.buscarTreinos()).thenAnswer((_) async => []);

    controller = Get.put(HomeController(repository: mockTreinoRepository));
  });

  tearDown(() {
    Get.reset();
  });
 
  group('HomePage Widget Tests -', () {
    testWidgets('deve exibir botao de criar um treino na tela', (WidgetTester tester) async {
      // Arrange
        

        await tester.pumpWidget(
          const GetMaterialApp(
            home: HomePage(),
          )
        );

      // Act

      // Assert
        expect(find.text('Criar um treino'), findsOneWidget); 
    });

    testWidgets('deve exibir a lista de cards quando houver treinos salvos', (WidgetTester tester) async {
      // Arrange
        TreinoModel treino = TreinoModel(name: 'Treino de Peito', interval: 60, exercises: ['Supino reto']);

        when(() => mockTreinoRepository.buscarTreinos()).thenAnswer((_) async => [treino]);

        await controller.buscarTreino();

        await tester.pumpWidget(
          const GetMaterialApp(
            home: HomePage(),
          )
        );

      // Act

      // Assert
        expect(find.text('Treino de Peito'), findsOneWidget); 
    });

    testWidgets('deve remover o treino da tela ao arrastar o card para o lado', (WidgetTester tester) async {
      // Arrange
        TreinoModel treino = TreinoModel(id: 1, name: 'Treino de Peito', interval: 60, exercises: ['Supino reto']);

        when(() => mockTreinoRepository.buscarTreinos()).thenAnswer((_) async => [treino]);
        when(() => mockTreinoRepository.removeTreino(id: any(named: 'id'))).thenAnswer((_) async => {});

        await controller.buscarTreino();

        await tester.pumpWidget(
          const GetMaterialApp(
            home: HomePage(),
          )
        );

      // Act
        await tester.drag(find.text('Treino de Peito'), const Offset(-500, 0.0));
        await tester.pumpAndSettle();

      // Assert
        verify(() => mockTreinoRepository.removeTreino(id: 1)).called(1);

        await tester.pump(const Duration(seconds: 4));
        await tester.pumpAndSettle();
    });
  });
}