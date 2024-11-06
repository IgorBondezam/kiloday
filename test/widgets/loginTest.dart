import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiloday/screns/login.dart';

void main() {
  testWidgets('Deve validar a tela de login', (tester) async {


    await tester.pumpWidget(
        MaterialApp(
          home: Login(),
        )
    );

    expect(find.text("KiloDay"), findsOneWidget);
    expect(find.text("Email"), findsOneWidget);
    expect(find.text("Password"), findsOneWidget);
  });
}

