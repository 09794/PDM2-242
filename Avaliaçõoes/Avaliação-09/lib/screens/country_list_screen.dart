import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/country.dart';
import 'country_detail_screen.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Country>> _countries;

  @override
  void initState() {
    super.initState();
    _countries = _apiService.fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: _countries,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final country = snapshot.data![index];

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
        );
      },
    );
  }
}
