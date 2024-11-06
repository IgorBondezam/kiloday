import 'package:kiloday/model/refeicao.dart';
import 'package:kiloday/service/abstract_crud_service.dart';

class RefeicaoService extends AbstractCrudService<Refeicao> {

  RefeicaoService(super.client);

  @override
  String getComplemento() {
    return "refeicao";
  }

  @override
  Refeicao getInstance(Map<String, dynamic> item) {
    return Refeicao.decodeToClass(item);
  }
}