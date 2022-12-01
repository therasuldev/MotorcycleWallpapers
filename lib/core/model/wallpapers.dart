import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallpapers.freezed.dart';
part 'wallpapers.g.dart';

@freezed
class Wallpapers with _$Wallpapers {
  factory Wallpapers({
    required String name,
    required String url,
  }) = _Wallpapers;

  factory Wallpapers.fromJson(Map<String, dynamic> json) =>
      _$WallpapersFromJson(json);
}
