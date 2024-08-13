import 'package:flutter/material.dart';
import 'clase__pizza.dart';
import 'clase__vinos.dart';
import 'clase__producto.dart';

class ProductGrid<T extends Productos> extends StatefulWidget {
  final List<T> productos;
  final List<int> selectedIndices;
  final Function(List<int>) onSelectionChanged;

  const ProductGrid({
    super.key,
    required this.productos,
    required this.selectedIndices,
    required this.onSelectionChanged,
  });

  @override
  State<ProductGrid<T>> createState() => _ProductGridState<T>();
}

class _ProductGridState<T extends Productos> extends State<ProductGrid<T>> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: widget.productos.length,
      itemBuilder: (context, index) {
        bool isSelected = widget.selectedIndices.contains(index);

        final producto = widget.productos[index];
        return _buildProductItem(
          producto.nombre_p,
          producto.precio,
          producto.url_p,
          isSelected,
          index,
        );
      },
    );
  }

  Widget _buildProductItem(
      String nombre, double precio, String url, bool isSelected, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            widget.selectedIndices.remove(index);
          } else {
            widget.selectedIndices.add(index);
          }
          widget.onSelectionChanged(List.from(widget.selectedIndices));
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.asset(
              url,
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
            Text(
              nombre,
              style: const TextStyle(color: Colors.black),
            ),
            Text(precio.toString()),
          ],
        ),
      ),
    );
  }
}
