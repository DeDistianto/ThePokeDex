import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thepokedexapp/data/pokeInfo.dart';
import 'package:thepokedexapp/data/pokeSpecies.dart';
import 'package:thepokedexapp/data/pokemonpageres.dart';

class PokemonRepo {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageRes> getPokemonPage(int pageIndex) async {
    //pokemon?limit=200&offset=400

    final queryParameteres = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameteres);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageRes.fromJson(json);
  }

  Future<PokemonInfoRes> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoRes.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokeSpeciesRes> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokeSpeciesRes.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
