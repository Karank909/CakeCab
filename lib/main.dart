import 'package:flutter/material.dart';
import 'app/app_theme.dart';
import 'views/main_screen.dart';

void main() {
  runApp(const CakeCabApp());
}

class CakeCabApp extends StatelessWidget {
  const CakeCabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CakeCab',
      debugShowCheckedModeBanner: false,
      theme: CakeCabTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}
