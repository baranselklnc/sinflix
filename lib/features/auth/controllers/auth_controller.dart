import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dependency_injection.dart';
import '../../../core/errors/app_exception.dart';
import '../../../core/storage/storage_service.dart';
import '../services/auth_service.dart';
import '../../../shared/models/auth_models.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final AuthService _authService;
  late final StorageService _storageService;

  @override
  FutureOr<UserData?> build() async {
    _authService = getIt<AuthService>();
    _storageService = getIt<StorageService>();
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    
    try {
      final userData = await _authService.login(email, password);
      state = AsyncValue.data(userData);
      
      // Başarılı giriş sonrası token'ı storage'a kaydet
      await _storageService.setString('token', userData.token);
      await _storageService.setString('user_id', userData.id);
    } on AppException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Bilinmeyen bir hata oluştu'),
        stackTrace,
      );
    }
  }

  Future<void> register(String email, String name, String password) async {
    state = const AsyncValue.loading();
    
    try {
      final userData = await _authService.register(email, name, password);
      state = AsyncValue.data(userData);
    } on AppException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Kayıt olurken bir hata oluştu'),
        stackTrace,
      );
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      state = const AsyncValue.data(null);
    } on AppException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Çıkış yapılırken hata oluştu'),
        stackTrace,
      );
    }
  }

  bool get isLoggedIn => state.value != null;
  UserData? get currentUser => state.value;

  void updatePhotoUrl(String photoUrl) {
    final currentUser = state.value;
    if (currentUser != null) {
      final updatedUser = currentUser.copyWith(photoUrl: photoUrl);
      state = AsyncValue.data(updatedUser);
    }
  }
} 