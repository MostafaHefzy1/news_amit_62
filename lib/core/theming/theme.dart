import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.amber[900]),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    ));

ThemeData darkTheme() => ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black54,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
          color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
    ));
