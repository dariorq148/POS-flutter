
import 'clase__producto.dart';

class Pizza extends Productos{

  Pizza({required super.nombre_p, required super.precio, required super.cantidad, required super.url_p}):super();

  static List<Pizza>listapizzas=[
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/1.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/2.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/3.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/4.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/5.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/6.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/1.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/2.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/2.png'),
    Pizza(nombre_p: 'vino semi seco', precio: 25.00, cantidad: 1, url_p: 'assets/productos/5.png'),
  ];
}