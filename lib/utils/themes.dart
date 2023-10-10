import 'package:flutter/material.dart';

const PRIMARY_COLOR = Color.fromARGB(255, 27, 50, 84);
const COlOR_ACCENT = Color.fromARGB(255, 58, 0, 229);


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: PRIMARY_COLOR,
  appBarTheme: const AppBarTheme(
    backgroundColor: PRIMARY_COLOR,
  ),

);