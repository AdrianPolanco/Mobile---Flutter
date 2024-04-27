import '../abstract/user.dart';
import '../enums/roles.dart';
import '../mixins/delete_permission.dart';

class Vendor extends User with DeletePermission {
  Vendor(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.VENDOR})
      : super(
            name: name, email: email, age: age, password: password, role: role);

  @override
  bool canDelete(User user) {
    return user.role == Role.CUSTOMER;
  }
}
