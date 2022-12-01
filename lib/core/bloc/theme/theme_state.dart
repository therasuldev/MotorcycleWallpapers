part of 'theme_cubit.dart';

class ThemeState {
  final String? themeName;
  final ThemeData? theme;

  const ThemeState({
    this.themeName,
    this.theme,
  });

  ThemeState copyWith({
    String? themeName,
    ThemeData? theme,
  }) {
    return ThemeState(
      themeName: themeName ?? this.themeName,
      theme: theme ?? this.theme,
    );
  }
  static get empty => const ThemeState();
}
