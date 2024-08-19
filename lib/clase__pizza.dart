
  import 'clase__producto.dart';

  class Pizza extends Productos{
String tamanio;
    Pizza({required super.nombre_p, required super.precio, required super.cantidad,
      required super.url_p, this.tamanio='Mediana'}):super();
double get preciocalculado{
  switch (tamanio) {
    case "Personal":
      return precio;
    case "Mediana":
      return precio * 1.2;
    case "Familiar":
      return precio * 1.5;
    default:
      return precio;
  }

}


    static List<Pizza>listapizzas=[
      Pizza(nombre_p: 'napolitana', precio: 10.00, cantidad: 1, url_p: 'assets/productos/1.png'),
      Pizza(nombre_p: 'vino semi seco', precio: 10.00, cantidad: 1, url_p: 'assets/productos/2.png'),
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