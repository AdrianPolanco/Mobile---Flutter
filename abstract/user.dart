import 'package:uuid/uuid.dart';

import '../classes/customer.dart';
import '../classes/vendor.dart';
import '../enums/roles.dart';
import '../classes/admin.dart';

abstract class User {
  Uuid id = Uuid();
  String name;
  String email;
  int age;
  String password;
  Role role;
  User(
      {required this.name,
      required this.email,
      required this.age,
      required this.password,
      required this.role});

  factory User.createAdmin(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.ADMIN}) {
    return Admin(
        name: name, email: email, age: age, password: password, role: role);
  }

  factory User.createVendor(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.VENDOR}) {
    return Vendor(
        name: name, email: email, age: age, password: password, role: role);
  }

  factory User.createCustomer(
      {required String name,
      required String email,
      required int age,
      required String password,
      Role role = Role.CUSTOMER}) {
    return Customer(
        name: name, email: email, age: age, password: password, role: role);
  }
}
