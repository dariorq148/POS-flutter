import 'package:flutter/material.dart';
import 'clase__producto.dart';

class SelectionDisplay<T extends Productos> extends StatelessWidget {
  final List<int> selectedIndices;
  final List<T> productos;

  const SelectionDisplay({
    super.key,
    required this.selectedIndices,
    required this.productos,
  });

  @override
  Widget build(BuildContext context) {

    List<T> selectedProducts = selectedIndices.map((index) => productos[index]).toList();

    return ListView.builder(
      itemCount: selectedProducts.length,
      itemBuilder: (context, index) {
        final producto = selectedProducts[index];
        return ListTile(
          leading: Image.asset(producto.url_p),
          title: Text(producto.nombre_p),
          subtitle: Text(producto.precio.toString()),
        );
      },
    );
  }
}
