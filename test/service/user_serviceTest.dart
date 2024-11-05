
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kiloday/service/user_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {


  test("Deve retornar erro ao salvar pois status não é 201", () {

    final mockClient = MockHttpClient();
    final userMockService = UserService();

    const url = 'http://localhost:3000';
    const responseBody = '{}';

    when(() => mockClient.post(Uri.parse(url))).thenAnswer(
          (_) async => http.Response(responseBody, 201),
    );

    print(userMockService.save(<String, dynamic>{}));

    expect(() async => await userMockService.save(<String, dynamic>{}),
      throwsA(
        predicate((e) =>
          e is Exception && e.toString() == 'Erro ao salvar',
        ),
      ),
    );
  });
}