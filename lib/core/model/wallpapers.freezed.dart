// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallpapers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallpapers _$WallpapersFromJson(Map<String, dynamic> json) {
  return _Wallpapers.fromJson(json);
}

/// @nodoc
mixin _$Wallpapers {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WallpapersCopyWith<Wallpapers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallpapersCopyWith<$Res> {
  factory $WallpapersCopyWith(
          Wallpapers value, $Res Function(Wallpapers) then) =
      _$WallpapersCopyWithImpl<$Res>;
  $Res call({String name, String url});
}

/// @nodoc
class _$WallpapersCopyWithImpl<$Res> implements $WallpapersCopyWith<$Res> {
  _$WallpapersCopyWithImpl(this._value, this._then);

  final Wallpapers _value;
  // ignore: unused_field
  final $Res Function(Wallpapers) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WallpapersCopyWith<$Res>
    implements $WallpapersCopyWith<$Res> {
  factory _$$_WallpapersCopyWith(
          _$_Wallpapers value, $Res Function(_$_Wallpapers) then) =
      __$$_WallpapersCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url});
}

/// @nodoc
class __$$_WallpapersCopyWithImpl<$Res> extends _$WallpapersCopyWithImpl<$Res>
    implements _$$_WallpapersCopyWith<$Res> {
  __$$_WallpapersCopyWithImpl(
      _$_Wallpapers _value, $Res Function(_$_Wallpapers) _then)
      : super(_value, (v) => _then(v as _$_Wallpapers));

  @override
  _$_Wallpapers get _value => super._value as _$_Wallpapers;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Wallpapers(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallpapers implements _Wallpapers {
  _$_Wallpapers({required this.name, required this.url});

  factory _$_Wallpapers.fromJson(Map<String, dynamic> json) =>
      _$$_WallpapersFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'Wallpapers(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallpapers &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_WallpapersCopyWith<_$_Wallpapers> get copyWith =>
      __$$_WallpapersCopyWithImpl<_$_Wallpapers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WallpapersToJson(this);
  }
}

abstract class _Wallpapers implements Wallpapers {
  factory _Wallpapers({required final String name, required final String url}) =
      _$_Wallpapers;

  factory _Wallpapers.fromJson(Map<String, dynamic> json) =
      _$_Wallpapers.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WallpapersCopyWith<_$_Wallpapers> get copyWith =>
      throw _privateConstructorUsedError;
}
