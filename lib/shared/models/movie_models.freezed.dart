// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return _MovieModel.fromJson(json);
}

/// @nodoc
mixin _$MovieModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rated')
  String? get rated => throw _privateConstructorUsedError;
  @JsonKey(name: 'Released')
  String? get released => throw _privateConstructorUsedError;
  @JsonKey(name: 'Runtime')
  String? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Genre')
  String? get genre => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director')
  String? get director => throw _privateConstructorUsedError;
  @JsonKey(name: 'Writer')
  String? get writer => throw _privateConstructorUsedError;
  @JsonKey(name: 'Actors')
  String? get actors => throw _privateConstructorUsedError;
  @JsonKey(name: 'Plot')
  String? get plot => throw _privateConstructorUsedError;
  @JsonKey(name: 'Language')
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'Country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'Awards')
  String? get awards => throw _privateConstructorUsedError;
  @JsonKey(name: 'Poster')
  String? get poster => throw _privateConstructorUsedError;
  @JsonKey(name: 'Metascore')
  String? get metascore => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdbRating')
  String? get imdbRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdbVotes')
  String? get imdbVotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdbID')
  String? get imdbId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Response')
  String? get response => throw _privateConstructorUsedError;
  @JsonKey(name: 'Images')
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComingSoon')
  bool? get comingSoon => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavorite')
  bool? get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this MovieModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieModelCopyWith<MovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieModelCopyWith<$Res> {
  factory $MovieModelCopyWith(
          MovieModel value, $Res Function(MovieModel) then) =
      _$MovieModelCopyWithImpl<$Res, MovieModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Year') String year,
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
      @JsonKey(name: 'isFavorite') bool? isFavorite});
}

/// @nodoc
class _$MovieModelCopyWithImpl<$Res, $Val extends MovieModel>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? year = null,
    Object? rated = freezed,
    Object? released = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? writer = freezed,
    Object? actors = freezed,
    Object? plot = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? awards = freezed,
    Object? poster = freezed,
    Object? metascore = freezed,
    Object? imdbRating = freezed,
    Object? imdbVotes = freezed,
    Object? imdbId = freezed,
    Object? type = freezed,
    Object? response = freezed,
    Object? images = freezed,
    Object? comingSoon = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String?,
      actors: freezed == actors
          ? _value.actors
          : actors // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      awards: freezed == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      metascore: freezed == metascore
          ? _value.metascore
          : metascore // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbRating: freezed == imdbRating
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbVotes: freezed == imdbVotes
          ? _value.imdbVotes
          : imdbVotes // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comingSoon: freezed == comingSoon
          ? _value.comingSoon
          : comingSoon // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieModelImplCopyWith<$Res>
    implements $MovieModelCopyWith<$Res> {
  factory _$$MovieModelImplCopyWith(
          _$MovieModelImpl value, $Res Function(_$MovieModelImpl) then) =
      __$$MovieModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Year') String year,
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
      @JsonKey(name: 'isFavorite') bool? isFavorite});
}

/// @nodoc
class __$$MovieModelImplCopyWithImpl<$Res>
    extends _$MovieModelCopyWithImpl<$Res, _$MovieModelImpl>
    implements _$$MovieModelImplCopyWith<$Res> {
  __$$MovieModelImplCopyWithImpl(
      _$MovieModelImpl _value, $Res Function(_$MovieModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? year = null,
    Object? rated = freezed,
    Object? released = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? writer = freezed,
    Object? actors = freezed,
    Object? plot = freezed,
    Object? language = freezed,
    Object? country = freezed,
    Object? awards = freezed,
    Object? poster = freezed,
    Object? metascore = freezed,
    Object? imdbRating = freezed,
    Object? imdbVotes = freezed,
    Object? imdbId = freezed,
    Object? type = freezed,
    Object? response = freezed,
    Object? images = freezed,
    Object? comingSoon = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$MovieModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as String?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as String?,
      actors: freezed == actors
          ? _value.actors
          : actors // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      awards: freezed == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
      metascore: freezed == metascore
          ? _value.metascore
          : metascore // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbRating: freezed == imdbRating
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbVotes: freezed == imdbVotes
          ? _value.imdbVotes
          : imdbVotes // ignore: cast_nullable_to_non_nullable
              as String?,
      imdbId: freezed == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comingSoon: freezed == comingSoon
          ? _value.comingSoon
          : comingSoon // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieModelImpl implements _MovieModel {
  const _$MovieModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'Title') required this.title,
      @JsonKey(name: 'Year') required this.year,
      @JsonKey(name: 'Rated') this.rated,
      @JsonKey(name: 'Released') this.released,
      @JsonKey(name: 'Runtime') this.runtime,
      @JsonKey(name: 'Genre') this.genre,
      @JsonKey(name: 'Director') this.director,
      @JsonKey(name: 'Writer') this.writer,
      @JsonKey(name: 'Actors') this.actors,
      @JsonKey(name: 'Plot') this.plot,
      @JsonKey(name: 'Language') this.language,
      @JsonKey(name: 'Country') this.country,
      @JsonKey(name: 'Awards') this.awards,
      @JsonKey(name: 'Poster') this.poster,
      @JsonKey(name: 'Metascore') this.metascore,
      @JsonKey(name: 'imdbRating') this.imdbRating,
      @JsonKey(name: 'imdbVotes') this.imdbVotes,
      @JsonKey(name: 'imdbID') this.imdbId,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'Response') this.response,
      @JsonKey(name: 'Images') final List<String>? images,
      @JsonKey(name: 'ComingSoon') this.comingSoon,
      @JsonKey(name: 'isFavorite') this.isFavorite})
      : _images = images;

  factory _$MovieModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'Title')
  final String title;
  @override
  @JsonKey(name: 'Year')
  final String year;
  @override
  @JsonKey(name: 'Rated')
  final String? rated;
  @override
  @JsonKey(name: 'Released')
  final String? released;
  @override
  @JsonKey(name: 'Runtime')
  final String? runtime;
  @override
  @JsonKey(name: 'Genre')
  final String? genre;
  @override
  @JsonKey(name: 'Director')
  final String? director;
  @override
  @JsonKey(name: 'Writer')
  final String? writer;
  @override
  @JsonKey(name: 'Actors')
  final String? actors;
  @override
  @JsonKey(name: 'Plot')
  final String? plot;
  @override
  @JsonKey(name: 'Language')
  final String? language;
  @override
  @JsonKey(name: 'Country')
  final String? country;
  @override
  @JsonKey(name: 'Awards')
  final String? awards;
  @override
  @JsonKey(name: 'Poster')
  final String? poster;
  @override
  @JsonKey(name: 'Metascore')
  final String? metascore;
  @override
  @JsonKey(name: 'imdbRating')
  final String? imdbRating;
  @override
  @JsonKey(name: 'imdbVotes')
  final String? imdbVotes;
  @override
  @JsonKey(name: 'imdbID')
  final String? imdbId;
  @override
  @JsonKey(name: 'Type')
  final String? type;
  @override
  @JsonKey(name: 'Response')
  final String? response;
  final List<String>? _images;
  @override
  @JsonKey(name: 'Images')
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ComingSoon')
  final bool? comingSoon;
  @override
  @JsonKey(name: 'isFavorite')
  final bool? isFavorite;

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metascore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, response: $response, images: $images, comingSoon: $comingSoon, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.rated, rated) || other.rated == rated) &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.director, director) ||
                other.director == director) &&
            (identical(other.writer, writer) || other.writer == writer) &&
            (identical(other.actors, actors) || other.actors == actors) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.awards, awards) || other.awards == awards) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.metascore, metascore) ||
                other.metascore == metascore) &&
            (identical(other.imdbRating, imdbRating) ||
                other.imdbRating == imdbRating) &&
            (identical(other.imdbVotes, imdbVotes) ||
                other.imdbVotes == imdbVotes) &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.comingSoon, comingSoon) ||
                other.comingSoon == comingSoon) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        poster,
        metascore,
        imdbRating,
        imdbVotes,
        imdbId,
        type,
        response,
        const DeepCollectionEquality().hash(_images),
        comingSoon,
        isFavorite
      ]);

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      __$$MovieModelImplCopyWithImpl<_$MovieModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieModelImplToJson(
      this,
    );
  }
}

abstract class _MovieModel implements MovieModel {
  const factory _MovieModel(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'Title') required final String title,
      @JsonKey(name: 'Year') required final String year,
      @JsonKey(name: 'Rated') final String? rated,
      @JsonKey(name: 'Released') final String? released,
      @JsonKey(name: 'Runtime') final String? runtime,
      @JsonKey(name: 'Genre') final String? genre,
      @JsonKey(name: 'Director') final String? director,
      @JsonKey(name: 'Writer') final String? writer,
      @JsonKey(name: 'Actors') final String? actors,
      @JsonKey(name: 'Plot') final String? plot,
      @JsonKey(name: 'Language') final String? language,
      @JsonKey(name: 'Country') final String? country,
      @JsonKey(name: 'Awards') final String? awards,
      @JsonKey(name: 'Poster') final String? poster,
      @JsonKey(name: 'Metascore') final String? metascore,
      @JsonKey(name: 'imdbRating') final String? imdbRating,
      @JsonKey(name: 'imdbVotes') final String? imdbVotes,
      @JsonKey(name: 'imdbID') final String? imdbId,
      @JsonKey(name: 'Type') final String? type,
      @JsonKey(name: 'Response') final String? response,
      @JsonKey(name: 'Images') final List<String>? images,
      @JsonKey(name: 'ComingSoon') final bool? comingSoon,
      @JsonKey(name: 'isFavorite') final bool? isFavorite}) = _$MovieModelImpl;

  factory _MovieModel.fromJson(Map<String, dynamic> json) =
      _$MovieModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'Title')
  String get title;
  @override
  @JsonKey(name: 'Year')
  String get year;
  @override
  @JsonKey(name: 'Rated')
  String? get rated;
  @override
  @JsonKey(name: 'Released')
  String? get released;
  @override
  @JsonKey(name: 'Runtime')
  String? get runtime;
  @override
  @JsonKey(name: 'Genre')
  String? get genre;
  @override
  @JsonKey(name: 'Director')
  String? get director;
  @override
  @JsonKey(name: 'Writer')
  String? get writer;
  @override
  @JsonKey(name: 'Actors')
  String? get actors;
  @override
  @JsonKey(name: 'Plot')
  String? get plot;
  @override
  @JsonKey(name: 'Language')
  String? get language;
  @override
  @JsonKey(name: 'Country')
  String? get country;
  @override
  @JsonKey(name: 'Awards')
  String? get awards;
  @override
  @JsonKey(name: 'Poster')
  String? get poster;
  @override
  @JsonKey(name: 'Metascore')
  String? get metascore;
  @override
  @JsonKey(name: 'imdbRating')
  String? get imdbRating;
  @override
  @JsonKey(name: 'imdbVotes')
  String? get imdbVotes;
  @override
  @JsonKey(name: 'imdbID')
  String? get imdbId;
  @override
  @JsonKey(name: 'Type')
  String? get type;
  @override
  @JsonKey(name: 'Response')
  String? get response;
  @override
  @JsonKey(name: 'Images')
  List<String>? get images;
  @override
  @JsonKey(name: 'ComingSoon')
  bool? get comingSoon;
  @override
  @JsonKey(name: 'isFavorite')
  bool? get isFavorite;

  /// Create a copy of MovieModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieModelImplCopyWith<_$MovieModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int get totalCount => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call({int totalCount, int perPage, int maxPage, int currentPage});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? perPage = null,
    Object? maxPage = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, int perPage, int maxPage, int currentPage});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? perPage = null,
    Object? maxPage = null,
    Object? currentPage = null,
  }) {
    return _then(_$PaginationModelImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  const _$PaginationModelImpl(
      {required this.totalCount,
      required this.perPage,
      required this.maxPage,
      required this.currentPage});

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  final int totalCount;
  @override
  final int perPage;
  @override
  final int maxPage;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'PaginationModel(totalCount: $totalCount, perPage: $perPage, maxPage: $maxPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCount, perPage, maxPage, currentPage);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  const factory _PaginationModel(
      {required final int totalCount,
      required final int perPage,
      required final int maxPage,
      required final int currentPage}) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  int get totalCount;
  @override
  int get perPage;
  @override
  int get maxPage;
  @override
  int get currentPage;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return _MovieListResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieListResponse {
  ResponseInfo get response => throw _privateConstructorUsedError;
  MovieListData get data => throw _privateConstructorUsedError;

  /// Serializes this MovieListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieListResponseCopyWith<MovieListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListResponseCopyWith<$Res> {
  factory $MovieListResponseCopyWith(
          MovieListResponse value, $Res Function(MovieListResponse) then) =
      _$MovieListResponseCopyWithImpl<$Res, MovieListResponse>;
  @useResult
  $Res call({ResponseInfo response, MovieListData data});

  $ResponseInfoCopyWith<$Res> get response;
  $MovieListDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MovieListResponseCopyWithImpl<$Res, $Val extends MovieListResponse>
    implements $MovieListResponseCopyWith<$Res> {
  _$MovieListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseInfo,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MovieListData,
    ) as $Val);
  }

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseInfoCopyWith<$Res> get response {
    return $ResponseInfoCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieListDataCopyWith<$Res> get data {
    return $MovieListDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieListResponseImplCopyWith<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  factory _$$MovieListResponseImplCopyWith(_$MovieListResponseImpl value,
          $Res Function(_$MovieListResponseImpl) then) =
      __$$MovieListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseInfo response, MovieListData data});

  @override
  $ResponseInfoCopyWith<$Res> get response;
  @override
  $MovieListDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$MovieListResponseImplCopyWithImpl<$Res>
    extends _$MovieListResponseCopyWithImpl<$Res, _$MovieListResponseImpl>
    implements _$$MovieListResponseImplCopyWith<$Res> {
  __$$MovieListResponseImplCopyWithImpl(_$MovieListResponseImpl _value,
      $Res Function(_$MovieListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? data = null,
  }) {
    return _then(_$MovieListResponseImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseInfo,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MovieListData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListResponseImpl implements _MovieListResponse {
  const _$MovieListResponseImpl({required this.response, required this.data});

  factory _$MovieListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListResponseImplFromJson(json);

  @override
  final ResponseInfo response;
  @override
  final MovieListData data;

  @override
  String toString() {
    return 'MovieListResponse(response: $response, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListResponseImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response, data);

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      __$$MovieListResponseImplCopyWithImpl<_$MovieListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListResponseImplToJson(
      this,
    );
  }
}

abstract class _MovieListResponse implements MovieListResponse {
  const factory _MovieListResponse(
      {required final ResponseInfo response,
      required final MovieListData data}) = _$MovieListResponseImpl;

  factory _MovieListResponse.fromJson(Map<String, dynamic> json) =
      _$MovieListResponseImpl.fromJson;

  @override
  ResponseInfo get response;
  @override
  MovieListData get data;

  /// Create a copy of MovieListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieListData _$MovieListDataFromJson(Map<String, dynamic> json) {
  return _MovieListData.fromJson(json);
}

/// @nodoc
mixin _$MovieListData {
  List<MovieModel> get movies => throw _privateConstructorUsedError;
  PaginationModel get pagination => throw _privateConstructorUsedError;

  /// Serializes this MovieListData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieListDataCopyWith<MovieListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListDataCopyWith<$Res> {
  factory $MovieListDataCopyWith(
          MovieListData value, $Res Function(MovieListData) then) =
      _$MovieListDataCopyWithImpl<$Res, MovieListData>;
  @useResult
  $Res call({List<MovieModel> movies, PaginationModel pagination});

  $PaginationModelCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MovieListDataCopyWithImpl<$Res, $Val extends MovieListData>
    implements $MovieListDataCopyWith<$Res> {
  _$MovieListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
    ) as $Val);
  }

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get pagination {
    return $PaginationModelCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieListDataImplCopyWith<$Res>
    implements $MovieListDataCopyWith<$Res> {
  factory _$$MovieListDataImplCopyWith(
          _$MovieListDataImpl value, $Res Function(_$MovieListDataImpl) then) =
      __$$MovieListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieModel> movies, PaginationModel pagination});

  @override
  $PaginationModelCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$MovieListDataImplCopyWithImpl<$Res>
    extends _$MovieListDataCopyWithImpl<$Res, _$MovieListDataImpl>
    implements _$$MovieListDataImplCopyWith<$Res> {
  __$$MovieListDataImplCopyWithImpl(
      _$MovieListDataImpl _value, $Res Function(_$MovieListDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? pagination = null,
  }) {
    return _then(_$MovieListDataImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListDataImpl implements _MovieListData {
  const _$MovieListDataImpl(
      {required final List<MovieModel> movies, required this.pagination})
      : _movies = movies;

  factory _$MovieListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListDataImplFromJson(json);

  final List<MovieModel> _movies;
  @override
  List<MovieModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final PaginationModel pagination;

  @override
  String toString() {
    return 'MovieListData(movies: $movies, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListDataImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), pagination);

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListDataImplCopyWith<_$MovieListDataImpl> get copyWith =>
      __$$MovieListDataImplCopyWithImpl<_$MovieListDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListDataImplToJson(
      this,
    );
  }
}

abstract class _MovieListData implements MovieListData {
  const factory _MovieListData(
      {required final List<MovieModel> movies,
      required final PaginationModel pagination}) = _$MovieListDataImpl;

  factory _MovieListData.fromJson(Map<String, dynamic> json) =
      _$MovieListDataImpl.fromJson;

  @override
  List<MovieModel> get movies;
  @override
  PaginationModel get pagination;

  /// Create a copy of MovieListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieListDataImplCopyWith<_$MovieListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
