import 'package:flutter/cupertino.dart';

abstract class PokemonEvent {}

class PokeClassReq extends PokemonEvent {
  final int page;

  PokeClassReq({@required this.page});
}
