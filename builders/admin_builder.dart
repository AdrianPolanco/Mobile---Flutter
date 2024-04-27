import '../abstract/builder.dart';
import '../abstract/user.dart';
import '../enums/roles.dart';
import '../mixins/delete_permission.dart';
import 'abstract/user_builder.dart';

class AdminBuilder extends UserBuilder implements Builder<User> {
  static final AdminBuilder _instance = AdminBuilder._internal();

  factory AdminBuilder() {
    return _instance;
  }

  AdminBuilder._internal();

  void setName(String name) {
    super.name = name;
  }

  void setEmail(String email) {
    super.email = email;
  }

  void setAge(int age) {
    super.age = age;
  }

  void setPassword(String password) {
    super.password = password;
  }

  void setRole() {
    super.role = Role.ADMIN;
  }

  @override
  User create() {
    return User.createAdmin(
        name: super.name,
        email: super.email,
        age: super.age,
        password: super.password);
  }
}
