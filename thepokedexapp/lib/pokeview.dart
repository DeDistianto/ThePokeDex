import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thepokedexapp/bloc/pokedetailscubit.dart';

import 'package:thepokedexapp/data/pokemondetails.dart';

class PokeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 28.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
        body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
          builder: (context, details) {
            return details != null
                ? Center(
                    child: Column(
                      children: [
                        Expanded(
                            child: Card(
                          child: Column(
                            children: [
                              Image.network(details.imageUrl),
                              Text(
                                details.name,
                                style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontSize: 28.0,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: details.types
                                    .map((type) => _pokemonTypeView(type))
                                    .toList(),
                              ),
                              Text(
                                  'ID:  ${details.id} - Weight: ${details.weight} - Height: ${details.height}',
                                  style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 18.0,
                                    letterSpacing: 2.0,
                                  ))
                            ],
                          ),
                        )),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Text(
                                  details.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 15.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
