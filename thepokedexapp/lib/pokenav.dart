import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thepokedexapp/bloc/navcubit.dart';
import 'package:thepokedexapp/pokedexbody.dart';
import 'package:thepokedexapp/pokeview.dart';

class AppNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: Pokebody()),
          if (pokemonId != null) MaterialPage(child: PokeDetailsScreen())
        ],
        onPopPage: (route, results) {
          BlocProvider.of<NavCubit>(context).toPokedex();
          return route.didPop(results);
        },
      );
    });
  }
}
