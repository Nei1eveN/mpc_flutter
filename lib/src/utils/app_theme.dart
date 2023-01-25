import 'package:flutter/material.dart';
import 'package:mpc_flutter/generated/assets/colors.gen.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: ColorName.scaffoldBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              }

              return ColorName.green;
            },
          ),
        ),
      ),
    );
  }
}
