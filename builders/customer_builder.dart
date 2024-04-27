import '../abstract/builder.dart';
import '../abstract/user.dart';
import '../enums/roles.dart';
import 'abstract/user_builder.dart';

class CustomerBuilder extends UserBuilder implements Builder<User> {
  static final CustomerBuilder _instance = CustomerBuilder._internal();

  factory CustomerBuilder() {
    return _instance;
  }

  CustomerBuilder._internal();

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
    super.role = Role.CUSTOMER;
  }

  @override
  User create() {
    super.builder = this;
    return User.createCustomer(
        name: super.name,
        email: super.email,
        age: super.age,
        password: super.password);
  }
}
