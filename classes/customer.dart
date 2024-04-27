import '../abstract/user.dart';
import '../enums/roles.dart';

class Customer extends User {
  Customer(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.CUSTOMER})
      : super(
            name: name, email: email, age: age, password: password, role: role);
}
