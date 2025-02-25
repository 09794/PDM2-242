import 'package:flutter/material.dart';
import 'screens/country_list_screen.dart';
import 'screens/country_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Países do Mundo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Países do Mundo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.public), text: "Lista de Países"),
              Tab(icon: Icon(Icons.search), text: "Pesquisa"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [CountryListScreen(), CountrySearchScreen()],
        ),
      ),
    );
  }
}
