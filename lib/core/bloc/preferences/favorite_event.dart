part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {}

class AddEvent extends FavoriteEvent {
  final dynamic key;
  final dynamic value;

  AddEvent({required this.key, required this.value});
  @override
  List<Object?> get props => [key, value];
}

class GetEvent extends FavoriteEvent {
  final dynamic key;

  GetEvent({this.key});
  @override
  List<Object?> get props => [key];
}

class RemoveEvent extends FavoriteEvent {
  final dynamic key;

  RemoveEvent({required this.key});
  @override
  List<Object?> get props => [key];
}
