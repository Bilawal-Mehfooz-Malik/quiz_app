import 'package:provider/provider.dart';
import 'package:quiz_app/providers/category_details_provider.dart';
import 'package:quiz_app/router.dart';
import 'package:flutter/material.dart';

final _theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 33, 75, 243)));

final _darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 13, 42, 185),
  ),
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryDetailsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _theme,
      title: 'Quiz App',
      routerConfig: router,
      darkTheme: _darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
