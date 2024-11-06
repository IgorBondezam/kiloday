import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AbstractCrudService<T> {

  final http.Client client;

  AbstractCrudService(this.client);

  String getComplemento();
  T getInstance(Map<String, dynamic> item);

  String url = "http://localhost:3000";

  Future<List<T>> findAll() async {
    http.Response retorno = await client.get((Uri.parse('$url/${getComplemento()}')));

    List<Map<String, dynamic>> listData = List<Map<String, dynamic>>.from(jsonDecode(retorno.body));
    List<T> loadedItems = [];
    for(Map<String, dynamic> item in listData) {
      loadedItems.add(getInstance(item));
    }
    return loadedItems;
  }

  Future<T> findById(int id) async {
    http.Response retorno = await client.get((Uri.parse('$url/${getComplemento()}/$id')));
    Map<String, dynamic> data = jsonDecode(retorno.body);
    return getInstance(data);
  }

  Future<void> save(Map<String, dynamic> body) async {
    http.Response response = await client.post((Uri.parse('$url/${getComplemento()}')), body: jsonEncode(body));
    if (response.statusCode != 201) {
      throw Exception('Erro ao salvar');
    }
  }

  Future<void> update(int id, T body) async {
    http.Response response = await client.put((Uri.parse('$url/${getComplemento()}/$id')), body: jsonEncode(body));
    if (response.statusCode != 200) {
      throw Exception('Erro ao Editar');
    }
  }

  Future<void> delete(int id) async {
     http.Response response = await client.delete((Uri.parse('$url/${getComplemento()}/$id')));
     if (response.statusCode != 204) {
       throw Exception('Erro ao Deletar');
     }
  }


}