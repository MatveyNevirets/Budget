import 'package:budget/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

import 'Consts/AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(4),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
            backgroundColor: WidgetStateProperty.all(AppColors.buttonColor),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.appBarBlue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      routes: {
        "/": (context) => const MainScreenWidget(),
      },
      initialRoute: "/",
    );
  }
}
