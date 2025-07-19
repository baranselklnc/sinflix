// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieModelImpl _$$MovieModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieModelImpl(
      id: json['id'] as String,
      title: json['Title'] as String,
      year: json['Year'] as String,
      rated: json['Rated'] as String?,
      released: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      director: json['Director'] as String?,
      writer: json['Writer'] as String?,
      actors: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      language: json['Language'] as String?,
      country: json['Country'] as String?,
      awards: json['Awards'] as String?,
      poster: json['Poster'] as String?,
      metascore: json['Metascore'] as String?,
      imdbRating: json['imdbRating'] as String?,
      imdbVotes: json['imdbVotes'] as String?,
      imdbId: json['imdbID'] as String?,
      type: json['Type'] as String?,
      response: json['Response'] as String?,
      images:
          (json['Images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comingSoon: json['ComingSoon'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$$MovieModelImplToJson(_$MovieModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'Poster': instance.poster,
      'Metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'Response': instance.response,
      'Images': instance.images,
      'ComingSoon': instance.comingSoon,
      'isFavorite': instance.isFavorite,
    };

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      maxPage: (json['maxPage'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'perPage': instance.perPage,
      'maxPage': instance.maxPage,
      'currentPage': instance.currentPage,
    };

_$MovieListResponseImpl _$$MovieListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieListResponseImpl(
      response: ResponseInfo.fromJson(json['response'] as Map<String, dynamic>),
      data: MovieListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieListResponseImplToJson(
        _$MovieListResponseImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

_$MovieListDataImpl _$$MovieListDataImplFromJson(Map<String, dynamic> json) =>
    _$MovieListDataImpl(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieListDataImplToJson(_$MovieListDataImpl instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'pagination': instance.pagination,
    };
