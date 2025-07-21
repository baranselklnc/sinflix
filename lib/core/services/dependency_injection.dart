import 'package:get_it/get_it.dart';
import '../network/api_client.dart';
import '../storage/storage_service.dart';
import '../../features/auth/services/auth_service.dart';
import '../../features/movies/services/movie_service.dart';
import 'firebase_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core Services
  getIt.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<StorageService>()));
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  
  // Feature Services
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<MovieService>(
    () => MovieServiceImpl(getIt<ApiClient>()),
  );
  
  // Initialize storage service
  await getIt<StorageService>().init();
  
  // Initialize Firebase service
  await getIt<FirebaseService>().initialize();
} 