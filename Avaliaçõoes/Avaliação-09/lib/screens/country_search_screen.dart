import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/country.dart';
import 'country_detail_screen.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  _CountrySearchScreenState createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Country> _searchResults = [];

  void _searchCountry(String name) async {
    try {
      List<Country> countries = await _apiService.fetchCountryByName(name);
      setState(() {
        _searchResults = countries;
      });
    } catch (e) {
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Pesquisar país",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _searchCountry(_searchController.text),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final country = _searchResults[index];

              return ListTile(
                leading: Image.network(country.flagUrl, width: 50, height: 30),
                title: Text(country.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryDetailScreen(country: country),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
