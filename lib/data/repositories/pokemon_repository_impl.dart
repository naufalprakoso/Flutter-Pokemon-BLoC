import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../response/pokemon_response.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  @override
  Future<PokemonList> fetchPokemonList({int limit = 20, int offset = 0}) async {
    try {
      final url = Uri.parse('$_baseUrl/pokemon?limit=$limit&offset=$offset');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final pokemonListResponse = PokemonListResponse.fromJson(jsonData);
        
        return _mapToDomain(pokemonListResponse);
      } else {
        throw Exception('Failed to load Pokemon list: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Pokemon list: $e');
    }
  }

  PokemonList _mapToDomain(PokemonListResponse response) {
    return PokemonList(
      count: response.count,
      next: response.next,
      previous: response.previous,
      results: response.results
          .map((pokemonResponse) => Pokemon(
                name: pokemonResponse.name,
                url: pokemonResponse.url,
                imageUrl: pokemonResponse.imageUrl,
              ))
          .toList(),
    );
  }
}