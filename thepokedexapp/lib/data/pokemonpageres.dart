/*
count:1118
next:"https://pokeapi.co/api/v2/pokemon?offset=300&limit=100"
previous:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
name:"unown"
url:"https://pokeapi.co/api/v2/pokemon/201/"
name:"wobbuffet"
url:"https://pokeapi.co/api/v2/pokemon/202/"
*/

import 'package:flutter/cupertino.dart';

class PokemonList {
  final int id;
  final String name;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonList({@required this.id, @required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonList(id: id, name: name);
  }
}

class PokemonPageRes {
  final List<PokemonList> pokemonList;
  final bool canLoadNextPage;

  PokemonPageRes({@required this.pokemonList, @required this.canLoadNextPage});

  factory PokemonPageRes.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonList = (json['results'] as List)
        .map((listingJson) => PokemonList.fromJson(listingJson))
        .toList();

    return PokemonPageRes(
        pokemonList: pokemonList, canLoadNextPage: canLoadNextPage);
  }
}
