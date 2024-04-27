import '../abstract/user.dart';
import '../abstract/warehouse.dart';

class UserWarehouse extends Warehouse<User> {
  //Singleton pattern in Dart
  static final UserWarehouse _instance = UserWarehouse._internal();

  factory UserWarehouse() {
    return _instance;
  }

  UserWarehouse._internal();
}
