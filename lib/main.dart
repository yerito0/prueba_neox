import 'package:flutter/material.dart';
import 'package:prueba_neox/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Prueba NEOX',
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true, color: Colors.grey.shade200),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
