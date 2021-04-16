import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thepokedexapp/data/pokeInfo.dart';
import 'package:thepokedexapp/data/pokeSpecies.dart';
import 'package:thepokedexapp/data/pokemondetails.dart';
import 'package:thepokedexapp/data/pokemonrepo.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepo();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoRes;
    final speciesInfo = responses[1] as PokeSpeciesRes;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null);
}
