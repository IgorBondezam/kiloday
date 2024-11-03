import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/service/abstract_crud_service.dart';

class AlimentoService extends AbstractCrudService<Alimento> {
  @override
  String getComplemento() {
    return "alimento";
  }

  @override
  Alimento getInstance(Map<String, dynamic> item) {
    return Alimento.decodeToClass(item);
  }
}