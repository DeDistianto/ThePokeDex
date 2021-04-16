import 'package:flutter/cupertino.dart';
import 'package:thepokedexapp/data/pokemonpageres.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInP extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonList> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {@required this.pokemonListings, @required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({@required this.error});
}
