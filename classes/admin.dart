import '../enums/roles.dart';
import '../abstract/user.dart';
import '../mixins/delete_permission.dart';

class Admin extends User with DeletePermission {
  Admin(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.ADMIN})
      : super(
            name: name, email: email, age: age, password: password, role: role);

  @override
  bool canDelete(User user) {
    return true;
  }
}
