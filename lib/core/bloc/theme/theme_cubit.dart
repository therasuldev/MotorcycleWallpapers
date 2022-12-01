import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorcycle/core/app/themes.dart';
import 'package:motorcycle/core/repository/hive/theme_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.empty);

  final service = ThemePreferences.themePref;

  final themes = {'dark': Themes().dark, 'light': Themes().light};

  Future<void> initApp() async {
    final themeName = await currentTheme;

    emit(state.copyWith(
      themeName: themeName,
      theme: themes[themeName],
    ));
  }

  Future<void> changeTheme(dynamic newTheme) async {
    try {
      await service.put('theme', newTheme);
      emit(state.copyWith(
        theme: themes[newTheme] ?? themes['light'],
        themeName: newTheme,
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> get currentTheme async {
    final appTheme = await service.get('theme');

    return appTheme ?? 'light';
  }
}
