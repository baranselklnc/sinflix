import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../../core/errors/app_exception.dart';
import '../../../shared/models/movie_models.dart';

abstract class MovieService {
  Future<MovieListData> getMovies(int page);
  Future<void> toggleFavorite(String movieId);
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
      // TODO: Implement favorite toggle API
      await _apiClient.post(
        '/movie/favorite',
        data: {'movieId': movieId},
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
} 