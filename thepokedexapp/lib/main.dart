import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'PokeDex',
            style: TextStyle(
              fontSize: 28.0,
              letterSpacing: 2.0,
              fontFamily: 'BebasNeue',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 28.0,
              letterSpacing: 2,
              color: Colors.blueGrey[500],
              fontFamily: 'BebasNeue',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Click'),
          backgroundColor: Colors.red[900],
        ),
      ),
    ));
