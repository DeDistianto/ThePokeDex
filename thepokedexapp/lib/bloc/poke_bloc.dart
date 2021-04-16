import 'package:thepokedexapp/bloc/poke_event.dart';
import 'package:thepokedexapp/bloc/poke_state.dart';
import 'package:thepokedexapp/data/pokemonrepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonReposit = PokemonRepo();
  PokemonBloc() : super(null);

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokeClassReq) {
      yield PokemonLoadInP();

      try {
        final pokemonPageRes = await _pokemonReposit.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonListings: pokemonPageRes.pokemonList,
            canLoadNextPage: pokemonPageRes.canLoadNextPage);
      } catch (e) {
        yield PokemonPageLoadFailed(error: e);
      }
    }
  }
}
