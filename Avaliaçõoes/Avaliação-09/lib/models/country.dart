class Country {
  final String name;
  final String officialName;
  final String capital;
  final int population;
  final double area;
  final String currency;
  final List<String> languages;
  final String flagUrl;
  final List<String> timezones;
  final List<String> borders;

  Country({
    required this.name,
    required this.officialName,
    required this.capital,
    required this.population,
    required this.area,
    required this.currency,
    required this.languages,
    required this.flagUrl,
    required this.timezones,
    required this.borders,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? 'Desconhecido',
      officialName: json['name']['official'] ?? 'Desconhecido',
      capital: (json['capital'] as List?)?.first ?? 'Sem capital',
      population: json['population'] ?? 0,
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      currency:
          json['currencies'] != null
              ? json['currencies'].keys.first
              : 'Desconhecida',
      languages:
          (json['languages'] as Map?)?.values.cast<String>().toList() ?? [],
      flagUrl: json['flags']['png'] ?? '',
      timezones: List<String>.from(json['timezones'] ?? []),
      borders: List<String>.from(json['borders'] ?? []),
    );
  }
}
