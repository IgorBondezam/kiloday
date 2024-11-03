import 'package:kiloday/model/user.dart';
import 'package:kiloday/service/abstract_crud_service.dart';

class UserService extends AbstractCrudService<User> {
  @override
  String getComplemento() {
    return "user";
  }

  @override
  User getInstance(Map<String, dynamic> item) {
    return User.decodeToClass(item);
  }
}