import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:motorcycle/core/repository/hive/preferences.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final HiveDB hiveDB;
  FavoriteBloc({required this.hiveDB}) : super(EmptyState()) {
    on<AddEvent>(_onAddEvent);
    on<RemoveEvent>(_onRemoveEvent);
    on<GetEvent>(_onGetEvent);
  }
  _onAddEvent(AddEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(LoadingState());
      var item = await hiveDB.saveItem(event.key, event.value);
      emit(LoadedState(favorites: item));
    } catch (error) {
      emit(ErrorState(message: error.toString()));
    }
  }

  _onGetEvent(GetEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(LoadingState());
      var items = await hiveDB.getItems();
      emit(LoadedState(keys: items[0], values: items[1]));
    } catch (error) {
      emit(ErrorState(message: error.toString()));
    }
  }

  _onRemoveEvent(RemoveEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(LoadingState());
      var items = await hiveDB.removeItem(event.key);
      emit(LoadedState(keys: items[0], values: items[1]));
    } catch (error) {
      emit(ErrorState(message: error.toString()));
    }
  }
}
