import 'package:flutter/material.dart';

class PokeSpeciesRes {
  final String description;

  PokeSpeciesRes({@required this.description});

  factory PokeSpeciesRes.fromJson(Map<String, dynamic> json) {
    return PokeSpeciesRes(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}
