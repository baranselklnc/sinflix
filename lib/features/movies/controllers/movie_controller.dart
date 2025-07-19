import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dependency_injection.dart';
import '../../../core/errors/app_exception.dart';
import '../services/movie_service.dart';
import '../../../shared/models/movie_models.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  late final MovieService _movieService;

  @override
  FutureOr<MovieListData?> build() async {
    _movieService = getIt<MovieService>();
    return null;
  }

  Future<void> loadMovies({bool refresh = false}) async {
    print('MovieController: loadMovies called with refresh=$refresh'); // Debug için
    print('MovieController: Current state.isLoading = ${state.isLoading}'); // Debug için
    
    if (refresh) {
      state = const AsyncValue.loading();
    } else if (state.isLoading) {
      print('MovieController: Early return because state.isLoading = true'); // Debug için
      return;
    }

    try {
      final currentData = state.value;
      final nextPage = currentData == null ? 1 : currentData.pagination.currentPage + 1;
      
      print('Loading movies for page: $nextPage'); // Debug için
      
      final movieData = await _movieService.getMovies(nextPage);
      
      print('Movie data received: ${movieData.movies.length} movies'); // Debug için
      
      if (refresh || currentData == null) {
        state = AsyncValue.data(movieData);
      } else {
        // Append new movies to existing list
        final updatedMovies = [...currentData.movies, ...movieData.movies];
        final updatedData = movieData.copyWith(movies: updatedMovies);
        state = AsyncValue.data(updatedData);
      }
    } on AppException catch (e) {
      print('AppException in movie controller: $e'); // Debug için
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      print('Unknown error in movie controller: $e'); // Debug için
      state = AsyncValue.error(
        UnknownException(message: 'Filmler yüklenirken bir hata oluştu'),
        stackTrace,
      );
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    try {
      await _movieService.toggleFavorite(movieId);
      
      // Update local state
      final currentData = state.value;
      if (currentData != null) {
        final updatedMovies = currentData.movies.map((movie) {
          if (movie.id == movieId) {
            return movie.copyWith(isFavorite: !(movie.isFavorite ?? false));
          }
          return movie;
        }).toList();
        
        final updatedData = currentData.copyWith(movies: updatedMovies);
        state = AsyncValue.data(updatedData);
      }
    } on AppException catch (e) {
      // Show error but don't update state
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Favori işlemi yapılırken bir hata oluştu'),
        stackTrace,
      );
    }
  }

  bool get hasMorePages {
    final data = state.value;
    if (data == null) return false;
    return data.pagination.currentPage < data.pagination.maxPage;
  }

  bool get isLoading => state.isLoading;
  bool get hasError => state.hasError;
  String? get errorMessage => state.error?.toString();
} 