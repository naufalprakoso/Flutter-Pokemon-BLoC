import 'package:equatable/equatable.dart';
import '../../domain/entities/pokemon.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object?> get props => [];
}

class PokemonListInitial extends PokemonListState {
  const PokemonListInitial();
}

class PokemonListLoading extends PokemonListState {
  const PokemonListLoading();
}

class PokemonListLoaded extends PokemonListState {
  final List<Pokemon> pokemonList;

  const PokemonListLoaded(this.pokemonList);

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonListError extends PokemonListState {
  final String message;

  const PokemonListError(this.message);

  @override
  List<Object?> get props => [message];
}