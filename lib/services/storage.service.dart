import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage  = FlutterSecureStorage();

  Future saveAuthUser(String value) async {
    await _storage.write(key: 'auth:user', value: value);
  }

  Future deleteAuthUser() async {
    await _storage.delete(key: 'auth:user');
  }

  Future readAuthUser() async {
    return await _storage.read(key: 'auth:user');
  }
}
