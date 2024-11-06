
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kiloday/model/user.dart';
import 'package:kiloday/service/user_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {

  test("Deve retornar o GET do usuário", () async {

    final mockClient = MockHttpClient();
    final userService = UserService(mockClient);

    const url = 'http://localhost:3000/user';

    when(() => mockClient.get(Uri.parse(url))).thenAnswer(
          (_) async => http.Response(jsonEncode(
              [
                {'id': '1', 'email': 'Igor', 'password': '1234'}
              ]
          ), 200),
    );

    final result = await userService.findAll();
    expect(result.first.id, 1);
    expect(result.first.email, 'Igor');
    expect(result.first.password, '1234');
  });
}