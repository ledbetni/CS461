import 'package:flutter/material.dart';
import 'package:vet_app/lib.dart';

class MainTabController extends StatelessWidget {
  MainTabController({super.key});

  static const tabs = [
    Tab(text: 'Animals'),
    Tab(text: 'Drugs'),
    Tab(text: 'Calculator')
  ];

  final screens = [
    const AnimalScreen(title: 'Animals'),
    const DrugScreen(title: 'Drugs'),
    const CalculatorScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text('Project Penflower'),
              bottom: const TabBar(
                tabs: tabs,
              )),
          body: TabBarView(children: screens),
        ));
  }
}
