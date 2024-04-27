import '../../abstract/builder.dart';
import '../../abstract/user.dart';
import '../../classes/credentials_manager.dart';
import '../../classes/user_warehouse.dart';
import '../../enums/roles.dart';

abstract class UserBuilder implements Builder<User> {
  late String _name;
  late String _email;
  late int _age;
  late String _password;
  Role? _role = null;
  late UserBuilder _builder;
  final UserWarehouse _userWarehouse = UserWarehouse();
  final CredentialsManager credentialsManager = CredentialsManager();

  set name(String name) => this._name = name;
  String get name => this._name;
  set email(String email) => this._email = email;
  String get email => this._email;
  set age(int age) => this._age = age;
  int get age => this._age;
  set password(String password) =>
      this._password = credentialsManager.hashPassword(password);
  String get password => this._password;
  set role(Role? role) {
    if (role != null) this._role = role;
  }

  Role? get role => this._role;
  set builder(UserBuilder builder) => this._builder = builder;

  UserBuilder setBuilder(UserBuilder builder) {
    this._builder = builder;
    return builder;
  }

  User create();

  @override
  User build() {
    User user = _builder.create();
    _userWarehouse.items.add(user);
    return user;
  }

  void reset() {
    _name = '';
    _email = '';
    _age = 0;
    _password = '';
    _role = null;
  }

  bool validate() {
    if (_name.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _age < 18 ||
        _role == null) {
      return false;
    }
    return true;
  }
}
