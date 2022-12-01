import 'package:flutter/material.dart';

class ViewUtils {
  static size(context) => MediaQuery.of(context).size;
  static textStyle(
      {double? fontSize, Color? color, int? fStyle, int? fWeight}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontStyle: FontStyle.values[fStyle ?? 0],
      fontWeight: FontWeight.values[fWeight ?? 3],
    );
  }

  static decoration({double? radius, Color? color}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0),
      color: color,
    );
  }

  static borderDecor({Color? color}) {
    return BoxDecoration(border: Border.all(color: color!));
  }

  static divider() {
    return const Divider(
      height: .5,
      indent: 20,
      endIndent: 20,
      color: Color.fromARGB(255, 166, 158, 215),
    );
  }

  static allDecor({double? radius, Color? color, String? url}) {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius ?? 0),
            topRight: Radius.circular(radius ?? 0)),
        color: color,
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url!)));
  }
}
