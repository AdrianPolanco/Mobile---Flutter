import 'builders/admin_builder.dart';
import 'builders/customer_builder.dart';
import 'builders/vendor_builder.dart';
import 'classes/admin.dart';
import 'classes/customer.dart';
import 'classes/user_warehouse.dart';
import 'classes/vendor.dart';
import 'data/data.dart';
import 'enums/roles.dart';

void main() {
  AdminBuilder adminBuilder = AdminBuilder();
  VendorBuilder vendorBuilder = VendorBuilder();
  CustomerBuilder customerBuilder = CustomerBuilder();
  /* for (var user in users) {
    if (user["role"] == Role.ADMIN) {
      adminBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole(user["role"] as Role)
        ..setBuilder(adminBuilder);
      adminBuilder.build();
    } else if (user["role"] == Role.VENDOR) {
      vendorBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole(user["role"] as Role)
        ..setBuilder(vendorBuilder);
      vendorBuilder.build();
    } else {
      customerBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole(user["role"] as Role)
        ..setBuilder(customerBuilder);
      customerBuilder.build();
    }
  }*/

//La razon por la que no me estaba agregando los usuarios creados es porque .map se ejecuta en diferido (lazy), hasta que no uses .toList() no se ejecutara el codigo dentro del map
  var data = users.map((user) {
    if (user["role"] == Role.ADMIN) {
      adminBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole()
        ..setBuilder(adminBuilder);
      return adminBuilder.build() as Admin;
    } else if (user["role"] == Role.VENDOR) {
      vendorBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole()
        ..setBuilder(vendorBuilder);
      return vendorBuilder.build() as Vendor;
    } else {
      customerBuilder
        ..setName(user["name"] as String)
        ..setEmail(user["email"] as String)
        ..setAge(user["age"] as int)
        ..setPassword(user["password"] as String)
        ..setRole()
        ..setBuilder(customerBuilder);
      return customerBuilder.build() as Customer;
    }
  }).toList();

  /* Admin admin = UserWarehouse().items[0] as Admin;
  String message = admin.delete(UserWarehouse().items[1]);*/
  Vendor vendor = UserWarehouse().items[2] as Vendor;
  String message1 = vendor.delete(UserWarehouse().items[
      3]); //No podra borrarlo ya que un vendedor no puede eliminar a otro vendedor
  String message2 = vendor.delete(UserWarehouse().items[
      4]); //Podra borrarlo ya que un vendedor puede eliminar a un cliente
  String message3 = vendor.delete(UserWarehouse().items[
      0]); //No podra borrarlo ya que un vendedor no puede eliminar a un admin
  print(message1);
  print(message2);
  print(message3);
  Customer customer = UserWarehouse().items[4] as Customer;
  // customer.delete(); Nisiquiera tiene el metodo de borrar disponible, ya que el mixin lo usamos solo en los usuarios con rol Admin y Vendor
}
