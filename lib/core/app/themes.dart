import 'package:flutter/material.dart';
import 'package:motorcycle/constant/app_colors.dart';

class Themes {
  static const lightID = 'light';
  static const darkID = 'dark';

  ThemeData get light => ThemeData(
        dividerColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.white,
        textTheme: _lightTextTheme,
        iconTheme: IconThemeData(color: AppColors.black),
        colorScheme: ColorScheme.light(primary: AppColors.black),
        appBarTheme: AppBarTheme(titleTextStyle: _blackText),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.black.withOpacity(.7),
            fontSize: 18,
          ),
          labelStyle: TextStyle(color: AppColors.black),
          helperStyle: TextStyle(color: AppColors.black, fontSize: 18),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.black),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.bottomNavigationBarTheme,
          unselectedItemColor: AppColors.grey,
        ),
        backgroundColor: AppColors.white,
        splashColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        cardColor: AppColors.white,
        shadowColor: AppColors.grey,
      );

  ThemeData get dark => ThemeData(
        dividerColor: AppColors.white,
        scaffoldBackgroundColor: const Color(0xFF141414),
        textTheme: _darkTextTheme,
        primaryColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.white),
        colorScheme: ColorScheme.dark(primary: AppColors.white),
        appBarTheme: AppBarTheme(
          titleTextStyle: _whiteText,
          actionsIconTheme: IconThemeData(color: AppColors.white),
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: AppColors.white),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.white.withOpacity(.7),
            fontSize: 18,
          ),
          labelStyle: TextStyle(color: AppColors.white),
          helperStyle: TextStyle(color: AppColors.white, fontSize: 18),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.white),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF141414),
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white.withOpacity(.5),
        ),
        splashColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        cardColor: AppColors.grey,
        shadowColor: AppColors.black,
      );

  TextTheme get _darkTextTheme => TextTheme(
        headline1: _whiteText,
        headline2: _whiteText,
        headline3: _whiteText,
        headline4: _whiteText,
        headline5: _whiteText,
        headline6: _whiteText,
      );

  TextTheme get _lightTextTheme => TextTheme(
        headline1: _blackText,
        headline2: _blackText,
        headline3: _blackText,
        headline4: _blackText,
        headline5: _blackText,
        headline6: _blackText,
      );

  TextStyle get _whiteText => TextStyle(color: AppColors.white);
  TextStyle get _blackText => TextStyle(color: AppColors.black);
}
