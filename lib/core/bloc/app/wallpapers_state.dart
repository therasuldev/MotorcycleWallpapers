part of 'wallpapers_bloc.dart'; 


@immutable
abstract class WallpapersState extends Equatable {}

class Empty extends WallpapersState {
  @override
  List<Object?> get props => [];
}

class Loading extends WallpapersState {
  @override
  List<Object?> get props => [];
}

class Loaded extends WallpapersState {
  final List<Wallpapers> wallpapers;
  Loaded({required this.wallpapers});
  @override
  List<Object?> get props => [wallpapers];
}

class Error extends WallpapersState {
  final String message;

  Error({required this.message});
  @override
  List<Object?> get props => [message];
}
