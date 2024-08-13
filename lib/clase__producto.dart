import 'package:flutter/material.dart';

import 'clase__pizza.dart';
import 'clase__vinos.dart';

class Productos {
  final String nombre_p;
  final String url_p;
  final double precio;
  final int cantidad;

  Productos(
      { required this.nombre_p, required this.precio, required this.cantidad, required this.url_p});
  
}
final List<Productos> productoslista = [
  ...Vinos.listavinos,
  ...Pizza.listapizzas,
];

