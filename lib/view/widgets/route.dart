import 'package:flutter/material.dart';

class AppRoute {
  static go(context, Widget page) => Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_) => page), (route) => true);
}
