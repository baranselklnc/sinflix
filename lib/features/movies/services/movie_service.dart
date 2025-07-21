import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../../core/errors/app_exception.dart';
import '../../../shared/models/movie_models.dart';

abstract class MovieService {
  Future<MovieListData> getMovies(int page);
  Future<void> toggleFavorite(String movieId);
  Future<MovieListData> getFavoriteMovies(int page);
}

class MovieServiceImpl implements MovieService {
  final ApiClient _apiClient;

  MovieServiceImpl(this._apiClient);

  @override
  Future<MovieListData> getMovies(int page) async {
    try {
      final response = await _apiClient.get(
        '/movie/list',
        queryParameters: {'page': page},
      );

      print('Movie Service: API Response received'); // Debug için

      final movieListResponse = MovieListResponse.fromJson(response.data);
      
      print('Movie Service: Parsed ${movieListResponse.data.movies.length} movies'); // Debug için
      return movieListResponse.data;
    } on AppException {
      rethrow;
    } catch (e) {
      print('Movie Service Error: $e'); // Debug için
      throw UnknownException(
        message: 'Filmler yüklenirken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<void> toggleFavorite(String movieId) async {
    try {
      await _apiClient.post(
        '/movie/favorite/$movieId',
      );
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: 'Favori işlemi yapılırken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<MovieListData> getFavoriteMovies(int page) async {
    try {
      final response = await _apiClient.get(
        '/movie/favorites',
        queryParameters: {'page': page},
      );

      print('Favorite movies response: ${response.data}'); // Debug için

      // Favori filmler direkt data array'i olarak geliyor
      if (response.data['data'] is List) {
        final movies = (response.data['data'] as List)
            .map((movieJson) => MovieModel.fromJson(movieJson))
            .toList();
        
      
        final pagination = PaginationModel(
          totalCount: movies.length,
          perPage: movies.length,
          maxPage: 1,
          currentPage: 1,
        );
        
        return MovieListData(
          movies: movies,
          pagination: pagination,
        );
      } else {
    
        final movieListResponse = MovieListResponse.fromJson(response.data);
        return movieListResponse.data;
      }
    } on AppException {
      rethrow;
    } catch (e) {
      print('Error in getFavoriteMovies: $e'); // Debug için
      throw UnknownException(
        message: 'Favori filmler yüklenirken bir hata oluştu',
        originalError: e,
      );
    }
  }
} 