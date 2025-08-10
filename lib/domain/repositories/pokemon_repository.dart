import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<PokemonList> fetchPokemonList({int limit = 20, int offset = 0});
}