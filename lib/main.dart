import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_try_stone_paper_scissors/screens/main_screen.dart';
import 'package:second_try_stone_paper_scissors/screens/newScreen.dart';
import 'package:second_try_stone_paper_scissors/widgets/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: MainScreen(),
    );
  }
}
