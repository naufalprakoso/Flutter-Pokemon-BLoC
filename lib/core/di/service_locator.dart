import 'package:get_it/get_it.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/use_cases/fetch_pokemon_list_use_case.dart';
import '../../presentation/bloc/pokemon_list_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => PokemonListBloc(
        fetchPokemonListUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => FetchPokemonListUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl());
}