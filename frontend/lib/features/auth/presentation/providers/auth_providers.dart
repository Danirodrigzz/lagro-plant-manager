import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(storage);
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

enum AuthStatus { initial, unauthenticated, authenticated }

class AuthState {
  final AuthStatus status;
  final String? userName;

  AuthState({required this.status, this.userName});

  AuthState copyWith({AuthStatus? status, String? userName}) {
    return AuthState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _repository;

  AuthNotifier(this._repository) : super(AuthState(status: AuthStatus.initial)) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final isFirst = await _repository.isFirstTime();
    if (isFirst) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    } else {
      final name = await _repository.getUserName();
      state = state.copyWith(
        status: AuthStatus.authenticated,
        userName: name,
      );
    }
  }

  Future<void> register(String name) async {
    await _repository.registerUser(name);
    state = state.copyWith(
      status: AuthStatus.authenticated,
      userName: name,
    );
  }

  Future<void> logout() async {
    await _repository.logout();
    state = state.copyWith(status: AuthStatus.unauthenticated, userName: null);
  }
}
