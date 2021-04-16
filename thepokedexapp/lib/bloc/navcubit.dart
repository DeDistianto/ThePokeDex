import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thepokedexapp/bloc/pokedetailscubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {
    print(pokemonId);
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void toPokedex() {
    emit(null);
  }
}
