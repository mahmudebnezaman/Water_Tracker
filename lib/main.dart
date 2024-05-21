import 'package:flutter/material.dart';
import 'package:water_tracker/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Intake Taker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          onPrimary: Colors.white,
          onSecondary: Colors.black87,
        ),
        useMaterial3: true,
        fontFamily: 'Ubuntu',
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          titleMedium: const TextStyle(
            fontSize: 14,
            // color: Theme.of(context).colorScheme.onSecondary,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      home: const MyHomePage(
        title: 'Water Intake Tracker',
      ),
    );
  }
}
