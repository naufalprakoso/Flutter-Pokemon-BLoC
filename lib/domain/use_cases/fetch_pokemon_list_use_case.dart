import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class FetchPokemonListUseCase {
  final PokemonRepository repository;

  FetchPokemonListUseCase(this.repository);

  Future<PokemonList> call({int limit = 20, int offset = 0}) async {
    return await repository.fetchPokemonList(limit: limit, offset: offset);
  }
}