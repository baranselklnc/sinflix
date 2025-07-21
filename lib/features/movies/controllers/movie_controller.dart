// ignore_for_file: unused_catch_clause, avoid_print

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/dependency_injection.dart';
import '../../../core/errors/app_exception.dart';
import '../services/movie_service.dart';
import '../../../shared/models/movie_models.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  late final MovieService _movieService;
  int _currentPage = 0;
  int _maxPage = 1;
  bool _isRestarting = false;

  @override
  FutureOr<MovieListData?> build() async {
    _movieService = getIt<MovieService>();
    return null;
  }

  Future<void> loadMovies({bool refresh = false}) async {
    
    if (refresh) {
      state = const AsyncValue.loading();
      _currentPage = 0;
      _isRestarting = false;
    } else if (state.isLoading) {
    
      return;
    }

    try {
      final currentData = state.value;
      
      if (refresh || currentData == null) {
        _currentPage = 1;
        _isRestarting = false;
      } else {
        _currentPage++;
      
        if (_currentPage > _maxPage) {
          _currentPage = 1;
          _isRestarting = true;
        }
      }
      
      
      final movieData = await _movieService.getMovies(_currentPage);
      
      if (refresh || currentData == null) {
        _maxPage = movieData.pagination.maxPage;
      }
      
      
      
      if (refresh || currentData == null) {
        // İlk yüklemede favori durumlarını da güncelle
        await _updateFavoriteStatus(movieData);
        state = AsyncValue.data(movieData);
      } else {
        // Eğer bu sayfada film yoksa, sayfa 1'den başlayarak yükle
        if (movieData.movies.isEmpty) {
          final firstPageData = await _movieService.getMovies(1);
          _currentPage = 1;
          _maxPage = firstPageData.pagination.maxPage;
          await _updateFavoriteStatus(firstPageData);
          state = AsyncValue.data(firstPageData);
        } else {
          if (_currentPage == 1 && _isRestarting) {
            
            
            await _updateFavoriteStatus(movieData);
            state = AsyncValue.data(movieData);
            _isRestarting = false;
            

          } else {
            final updatedMovies = [...currentData.movies, ...movieData.movies];
            final updatedData = movieData.copyWith(movies: updatedMovies);
            
            print('MovieController: Adding ${movieData.movies.length} movies to existing ${currentData.movies.length}');
            
            await _updateFavoriteStatus(updatedData);
            state = AsyncValue.data(updatedData);
          }
        }
      }
    } on AppException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        UnknownException(message: 'Filmler yüklenirken bir hata oluştu'),
        stackTrace,
      );
    }
  }

  // Favori durumlarını güncelle (tüm sayfalardan)
  Future<void> _updateFavoriteStatus(MovieListData movieData) async {
    try {
      print('MovieController: Updating favorite status for ${movieData.movies.length} movies');
      
      // Tüm favori filmleri al
      List<MovieModel> allFavoriteMovies = [];
      int page = 1;
      bool hasMorePages = true;
      
      while (hasMorePages) {
        final favoriteMoviesData = await _movieService.getFavoriteMovies(page);
        
        allFavoriteMovies.addAll(favoriteMoviesData.movies);
        hasMorePages = favoriteMoviesData.pagination.currentPage < favoriteMoviesData.pagination.maxPage;
        page++;
      }
      
      
      // Filmlerin favori durumlarını güncelle
      final updatedMovies = movieData.movies.map((movie) {
        final isFavorite = allFavoriteMovies.any((favMovie) => favMovie.id == movie.id);
        return movie.copyWith(isFavorite: isFavorite);
      }).toList();
      
      // State'i güncelle
      final updatedData = movieData.copyWith(movies: updatedMovies);
      state = AsyncValue.data(updatedData);
      
    } catch (e) {
      // ignore: avoid_print
      print('Error updating favorite status: $e');
    }
  }

  Future<void> toggleFavorite(String movieId) async {
    try {
      // Önce UI'da hemen güncelle (optimistic update)
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
      
      // Sonra API'ye gönder
      await _movieService.toggleFavorite(movieId);
      
    } on AppException catch (e) {
      // Hata durumunda geri al
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
    // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      // Hata durumunda geri al
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
    }
  }

  Future<void> loadFavoriteMovies() async {
    try {
      final favoriteMoviesData = await _movieService.getFavoriteMovies(1);
      
      // Favori filmleri mevcut state'e ekle veya güncelle
      final currentData = state.value;
      if (currentData != null) {
        // Mevcut filmlerin favori durumlarını güncelle
        final updatedMovies = currentData.movies.map((movie) {
          final isFavorite = favoriteMoviesData.movies.any((favMovie) => favMovie.id == movie.id);
          return movie.copyWith(isFavorite: isFavorite);
        }).toList();
        
        final updatedData = currentData.copyWith(movies: updatedMovies);
        state = AsyncValue.data(updatedData);
      }
    } on AppException catch (e) {
      if (kDebugMode) {
        print('Load favorite movies error: ${e.message}');
      }
    // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Load favorite movies error: $e');
      }
    }
  }

  // Profil sayfası için favori filmleri yükle (sayfa numarasını değiştirmeden)
  Future<void> loadFavoriteMoviesForProfile() async {
    try {
      
      List<MovieModel> allFavoriteMovies = [];
      int page = 1;
      bool hasMorePages = true;
      
      while (hasMorePages) {
        final favoriteMoviesData = await _movieService.getFavoriteMovies(page);
        
        allFavoriteMovies.addAll(favoriteMoviesData.movies);
        
        hasMorePages = favoriteMoviesData.pagination.currentPage < favoriteMoviesData.pagination.maxPage;
        page++;
      }
      
      
      // Mevcut state'i güncelle
      final currentData = state.value;
      if (currentData != null) {
        // Mevcut filmlerin favori durumlarını güncelle
        final updatedMovies = currentData.movies.map((movie) {
          final isFavorite = allFavoriteMovies.any((favMovie) => favMovie.id == movie.id);
          return movie.copyWith(isFavorite: isFavorite);
        }).toList();
        
        final updatedData = currentData.copyWith(movies: updatedMovies);
        state = AsyncValue.data(updatedData);
      }
    } on AppException catch (e) {
      print('Load  movies for profile error: ${e.message}');
    } catch (e, stackTrace) {
      print('Load favorite movies for profile error: $e');  //Apploger

    }
  }

  // Film detayı için provider - API çağrısı yerine mevcut veriyi kullan
  MovieModel? getMovieDetail(String movieId) {
    try {
      final currentData = state.value;
      if (currentData != null) {
        // Mevcut filmler arasından ID'ye göre bul
        final movie = currentData.movies.firstWhere(
          (movie) => movie.id == movieId,
          orElse: () => throw Exception('Film bulunamadı'),
        );
        return movie;
      }
      return null;
    } catch (e) {
      throw UnknownException(
        message: 'Film detayı alınırken bir hata oluştu',
        originalError: e,
      );
    }
  }

  bool get hasMorePages {
    // Loading durumunda false döndür
    if (isLoading) return false;
    
    // Mevcut state'te pagination bilgisi varsa, gerçek pagination durumunu kontrol et
    final currentData = state.value;
    if (currentData != null) {
      // Sonsuz döngü için: Her zaman true döndür
      // Bu sayede sürekli yeni filmler yüklenir ve son sayfaya gelindiğinde sayfa 1'e döner
      return true;
    }
    
    // Henüz veri yoksa true döndür (ilk yükleme için)
    return true;
  }

  bool get isLoading => state.isLoading;
  bool get hasError => state.hasError;
  String? get errorMessage => state.error?.toString();
} 