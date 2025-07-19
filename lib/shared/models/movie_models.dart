import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_models.dart';

part 'movie_models.freezed.dart';
part 'movie_models.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'Title') required String title,
    @JsonKey(name: 'Year') required String year,
    @JsonKey(name: 'Rated') String? rated,
    @JsonKey(name: 'Released') String? released,
    @JsonKey(name: 'Runtime') String? runtime,
    @JsonKey(name: 'Genre') String? genre,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Writer') String? writer,
    @JsonKey(name: 'Actors') String? actors,
    @JsonKey(name: 'Plot') String? plot,
    @JsonKey(name: 'Language') String? language,
    @JsonKey(name: 'Country') String? country,
    @JsonKey(name: 'Awards') String? awards,
    @JsonKey(name: 'Poster') String? poster,
    @JsonKey(name: 'Metascore') String? metascore,
    @JsonKey(name: 'imdbRating') String? imdbRating,
    @JsonKey(name: 'imdbVotes') String? imdbVotes,
    @JsonKey(name: 'imdbID') String? imdbId,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'Response') String? response,
    @JsonKey(name: 'Images') List<String>? images,
    @JsonKey(name: 'ComingSoon') bool? comingSoon,
    @JsonKey(name: 'isFavorite') bool? isFavorite,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int totalCount,
    required int perPage,
    required int maxPage,
    required int currentPage,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    required ResponseInfo response,
    required MovieListData data,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}

@freezed
class MovieListData with _$MovieListData {
  const factory MovieListData({
    required List<MovieModel> movies,
    required PaginationModel pagination,
  }) = _MovieListData;

  factory MovieListData.fromJson(Map<String, dynamic> json) =>
      _$MovieListDataFromJson(json);
} 