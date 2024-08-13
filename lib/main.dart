import 'package:flutter/material.dart';
import 'package:practica2/principal.dart';
import 'clase__pizza.dart';
import 'clase__vinos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage1(
        pizzas: Pizza.listapizzas,
        vinos: Vinos.listavinos,
      ),
    );
  }
}
