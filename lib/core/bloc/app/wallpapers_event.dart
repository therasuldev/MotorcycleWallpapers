part of 'wallpapers_bloc.dart'; 

@immutable
abstract class PageEvent extends Equatable {}

class GetPageEvent extends PageEvent {
  final int pages;

  GetPageEvent({required this.pages});
  @override
  List<Object?> get props => [pages];
}

class AppendPageEvent extends PageEvent {
  final int pages;

  AppendPageEvent({required this.pages});
  @override
  List<Object?> get props => [pages];
}
