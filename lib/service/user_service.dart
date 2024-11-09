import 'package:kiloday/model/user.dart';
import 'package:kiloday/service/abstract_crud_service.dart';

class UserService extends AbstractCrudService<User> {
  UserService(super.client);

  @override
  String getComplemento() {
    return "user";
  }

  @override
  User getInstance(Map<String, dynamic> item) {
    return User.decodeToClass(item);
  }

  Future<void> createIfNotExist(User user) async {
    User? userBanco = await findById(user.id);
    if(userBanco == null) {
      await save(user.toJson());
    }
  }
}
