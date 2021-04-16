import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thepokedexapp/bloc/navcubit.dart';
import 'package:thepokedexapp/bloc/poke_bloc.dart';
import 'package:thepokedexapp/bloc/poke_state.dart';
import 'package:flutter/material.dart';

class Pokebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PokeDex',
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 28.0,
              letterSpacing: 2.0,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadInP) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonPageLoadSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: state.pokemonListings.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<NavCubit>(context)
                        .showPokemonDetails(state.pokemonListings[index].id),
                    child: Card(
                      child: GridTile(
                        child: Column(
                          children: [
                            Image.network(
                                state.pokemonListings[index].imageUrl),
                            Text(
                              state.pokemonListings[index].name,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 12.0,
                                letterSpacing: 1.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is PokemonPageLoadFailed) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
