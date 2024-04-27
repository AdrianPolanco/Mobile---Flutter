import '../abstract/user.dart';
import '../classes/user_warehouse.dart';

mixin DeletePermission {
  UserWarehouse _warehouse = UserWarehouse();
  //En los mixin se pueden usar metodos abstractos
  bool canDelete(User user);
  String delete(User user) {
    if (!canDelete(user))
      return "You have no permission to delete the user ${user.name} with the role ${user.role}. Your role is equal or lesser than the user's role.";
    if (!_warehouse.items.contains(user))
      return "The user ${user.name} does not exist.";

    _warehouse.items
        .removeWhere((element) => element.id.hashCode == user.id.hashCode);
    return "User deleted successfully. Remaining users: ${_warehouse.items.map((u) => u.name).toList()}.";
  }
}
