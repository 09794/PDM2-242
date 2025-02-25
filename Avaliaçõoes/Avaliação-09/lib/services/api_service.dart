import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';

class ApiService {
  final String _baseUrl = 'https://restcountries.com/v3.1';

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse('$_baseUrl/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar países');
    }
  }

  Future<List<Country>> fetchCountryByName(String name) async {
    final response = await http.get(Uri.parse('$_baseUrl/name/$name'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('País não encontrado');
    }
  }
}
