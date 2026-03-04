import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final FlutterSecureStorage _storage;
  static const _keyIsFirstTime = 'is_first_time';
  static const _keyUserName = 'user_name';

  AuthRepositoryImpl(this._storage);

  @override
  Future<bool> isFirstTime() async {
    final result = await _storage.read(key: _keyIsFirstTime);
    return result == null || result == 'true';
  }

  @override
  Future<void> registerUser(String name) async {
    await _storage.write(key: _keyIsFirstTime, value: 'false');
    await _storage.write(key: _keyUserName, value: name);
  }

  @override
  Future<String?> getUserName() async {
    return await _storage.read(key: _keyUserName);
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: _keyIsFirstTime);
    await _storage.delete(key: _keyUserName);
  }
}
