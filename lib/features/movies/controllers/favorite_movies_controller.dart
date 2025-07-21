import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dependency_injection.dart';
import '../../../core/errors/app_exception.dart';
import '../services/movie_service.dart';
import '../../../shared/models/movie_models.dart';

part 'favorite_movies_controller.g.dart';

@riverpod
class FavoriteMoviesController extends _$FavoriteMoviesController {
  late final MovieService _movieService;

  @override
  FutureOr<List<MovieModel>> build() async {
    _movieService = getIt<MovieService>();
    return [];
  }

  Future<void> loadFavoriteMovies({bool refresh = false}) async {
    try {
      if (refresh) {
        state = const AsyncValue.loading();
      } else if (state.isLoading) {
        return;
      }

      final favoriteMoviesData = await _movieService.getFavoriteMovies(1);
      state = AsyncValue.data(favoriteMoviesData.movies);
    } on AppException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Favori filmler yüklenirken bir hata oluştu'),
        stackTrace,
      );
    }
  }

  void addToFavorites(MovieModel movie) {
    final currentFavorites = state.value ?? [];
    if (!currentFavorites.any((m) => m.id == movie.id)) {
      final updatedFavorites = [...currentFavorites, movie.copyWith(isFavorite: true)];
      state = AsyncValue.data(updatedFavorites);
    }
  }

  void removeFromFavorites(String movieId) {
    final currentFavorites = state.value ?? [];
    final updatedFavorites = currentFavorites.where((movie) => movie.id != movieId).toList();
    state = AsyncValue.data(updatedFavorites);
  }

  bool isFavorite(String movieId) {
    final currentFavorites = state.value ?? [];
    return currentFavorites.any((movie) => movie.id == movieId);
  }

  bool get isLoading => state.isLoading;
  bool get hasError => state.hasError;
  String? get errorMessage => state.error?.toString();
} 