import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thepokedexapp/pokemonpageres.dart';

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
}
