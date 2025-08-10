import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final String url;
  final String imageUrl;

  const Pokemon({
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [name, url, imageUrl];
}

class PokemonList extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;

  const PokemonList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}