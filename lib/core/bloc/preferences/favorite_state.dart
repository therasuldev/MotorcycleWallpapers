part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState extends Equatable {}

class EmptyState extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends FavoriteState {
  final dynamic favorites;
  final dynamic values;
  final dynamic keys;

  LoadedState({this.favorites,this.values ,this.keys});
  @override
  List<Object?> get props => [favorites];
}

class ErrorState extends FavoriteState {
  final String message;

  ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
