import 'package:equatable/equatable.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemonList extends PokemonListEvent {
  final int limit;
  final int offset;

  const LoadPokemonList({this.limit = 50, this.offset = 0});

  @override
  List<Object> get props => [limit, offset];
}

class RetryLoadPokemonList extends PokemonListEvent {
  const RetryLoadPokemonList();
}