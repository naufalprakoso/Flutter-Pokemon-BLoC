class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResponse> results;

  PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => PokemonResponse.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class PokemonResponse {
  final String name;
  final String url;

  PokemonResponse({
    required this.name,
    required this.url,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  String get imageUrl {
    final id = _getPokemonIdFromUrl();
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  String _getPokemonIdFromUrl() {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments[segments.length - 2];
  }
}