import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:motorcycle/core/model/wallpapers.dart';
import 'package:motorcycle/core/repository/repository.dart';

part 'wallpapers_event.dart';
part 'wallpapers_state.dart';

class WallpapersBloc extends Bloc<PageEvent, WallpapersState> {
  final WallpapersRepository wallpapersRepository;
  WallpapersBloc({required this.wallpapersRepository}) : super(Empty()) {
    on<GetPageEvent>(_onGetPageEvent);
    on<AppendPageEvent>(_appendPageEvent);
  }
  void _onGetPageEvent(
      GetPageEvent event, Emitter<WallpapersState> emit) async {
    try {
      emit(Loading());

      final resp = await wallpapersRepository.getWallpapers(event.pages);
      final wallpapers =
          resp.map<Wallpapers>((e) => Wallpapers.fromJson(e)).toList();
      emit(Loaded(wallpapers: wallpapers));
    } catch (error) {
      emit(Error(message: error.toString()));
    }
  }

  void _appendPageEvent(
      AppendPageEvent event, Emitter<WallpapersState> emit) async {
    try {
      final resp = await wallpapersRepository.getWallpapers(event.pages);
      final wallpapers =
          resp.map<Wallpapers>((e) => Wallpapers.fromJson(e)).toList();
      final newWallpapers = [...wallpapers];
      emit(Loaded(wallpapers: newWallpapers));
    } catch (error) {
      emit(Error(message: error.toString()));
    }
  }
}
