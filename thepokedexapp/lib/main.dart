import 'package:thepokedexapp/bloc/poke_bloc.dart';
import 'package:thepokedexapp/bloc/poke_event.dart';
import 'package:thepokedexapp/pokedexbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(PokeApp());

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          primaryColor: Colors.red[900], accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => PokemonBloc()..add(PokeClassReq(page: 0)))
      ], child: Pokebody()),
    );
  }
}
