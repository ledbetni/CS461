import 'package:flutter/material.dart';
import 'package:vet_app/screens/calculator_screen.dart';
import 'lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinary Application',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainTabController(),
    );
  }
}
