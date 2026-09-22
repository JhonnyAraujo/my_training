import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_training/feature/detail_treino/pages/detail_treino_page.dart';

void main() {
  group('DetailTreinoPage Widget Tests', () {
    testWidgets('deve exibir cards e o icone de edição', (tester) async {
      // Arrange
      await tester.pumpWidget(
          const GetMaterialApp(
            home: DetailTreinoPage(),
          )
        );

      // Assert
        expect(find.byIcon(Icons.edit), findsOneWidget);
        expect(find.byKey(const Key('card_exercices')), findsOneWidget);
        expect(find.byKey(const Key('card_interval')), findsOneWidget);
    });
  });
}
