import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/fetch_pokemon_list_use_case.dart';
import 'pokemon_list_event.dart';
import 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final FetchPokemonListUseCase fetchPokemonListUseCase;

  PokemonListBloc({required this.fetchPokemonListUseCase})
      : super(const PokemonListInitial()) {
    on<LoadPokemonList>(_onLoadPokemonList);
    on<RetryLoadPokemonList>(_onRetryLoadPokemonList);
  }

  Future<void> _onLoadPokemonList(
    LoadPokemonList event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(const PokemonListLoading());
    
    try {
      final pokemonList = await fetchPokemonListUseCase.call(
        limit: event.limit,
        offset: event.offset,
      );
      
      emit(PokemonListLoaded(pokemonList.results));
    } catch (e) {
      emit(PokemonListError(e.toString()));
    }
  }

  Future<void> _onRetryLoadPokemonList(
    RetryLoadPokemonList event,
    Emitter<PokemonListState> emit,
  ) async {
    add(const LoadPokemonList());
  }
}