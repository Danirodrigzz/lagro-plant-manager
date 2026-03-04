abstract class IAuthRepository {
  Future<bool> isFirstTime();
  Future<void> registerUser(String name);
  Future<String?> getUserName();
  Future<void> logout();
}
