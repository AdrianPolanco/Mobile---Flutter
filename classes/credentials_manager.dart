import 'dart:convert';
import 'package:crypto/crypto.dart';

class CredentialsManager {
  static final CredentialsManager _instance = CredentialsManager._internal();
  factory CredentialsManager() {
    return _instance;
  }
  CredentialsManager._internal();

  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    var hashedPassword = digest.toString();
    return hashedPassword;
  }

  bool verifyPassword(String password, String hashedPassword) {
    return password == hashedPassword;
  }
}
