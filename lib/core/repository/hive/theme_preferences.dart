import 'package:hive_flutter/hive_flutter.dart';

class ThemePreferences {
  static Box get themePref => Hive.box('theme');
}
