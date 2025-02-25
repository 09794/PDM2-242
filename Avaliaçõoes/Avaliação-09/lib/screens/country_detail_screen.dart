import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  const CountryDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(country.flagUrl, width: 150, height: 100),
            ),
            const SizedBox(height: 20),
            Text('Nome Oficial: ${country.officialName}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Capital: ${country.capital}'),
            Text('População: ${country.population}'),
            Text('Área: ${country.area} km²'),
            Text('Moeda: ${country.currency}'),
            Text('Línguas: ${country.languages.join(", ")}'),
            Text('Fusos Horários: ${country.timezones.join(", ")}'),
            Text('Fronteiras: ${country.borders.isNotEmpty ? country.borders.join(", ") : "Nenhuma"}'),
          ],
        ),
      ),
    );
  }
}