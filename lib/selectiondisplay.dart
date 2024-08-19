import 'package:flutter/material.dart';
import 'clase__pizza.dart';
import 'clase__producto.dart';

class SelectionDisplay<T extends Productos> extends StatefulWidget {
  final List<int> selectedIndices;
  final List<T> productos;
  final Function(T) onIncrement;
  final Function(T) onDecrement;
  final Function(Pizza, String) onPizzaSizeChange;

  const SelectionDisplay({
    super.key,
    required this.selectedIndices,
    required this.productos,
    required this.onIncrement,
    required this.onDecrement,
    required this.onPizzaSizeChange,
  });

  @override
  _SelectionDisplayState<T> createState() => _SelectionDisplayState<T>();
}

class _SelectionDisplayState<T extends Productos> extends State<SelectionDisplay<T>> {
  @override
  Widget build(BuildContext context) {
    List<T> selectedProducts = widget.selectedIndices.map((index) => widget.productos[index]).toList();

    return ListView.builder(
      itemCount: selectedProducts.length,
      itemBuilder: (context, index) {
        final producto = selectedProducts[index];

        return ListTile(
          leading: Image.asset(producto.url_p),
          title: Text(producto.nombre_p),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mostrar el precio calculado de la pizza
              Text("Precio: ${producto is Pizza ? (producto as Pizza).preciocalculado.toString() : producto.precio.toString()}"),
              if (producto is Pizza)
                DropdownButton<String>(
                  value: producto.tamanio,
                  onChanged: (newSize) {
                    if (newSize != null) {
                      setState(() {
                        widget.onPizzaSizeChange(producto, newSize);
                        producto.tamanio = newSize;
                      });
                    }
                  },
                  items: <String>["Personal", "Mediana", "Familiar"].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (producto.cantidad > 1) {
                        widget.onDecrement(producto);
                        setState(() {}); // Actualizar la vista
                      }
                    },
                  ),
                  Text(producto.cantidad.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      widget.onIncrement(producto);
                      setState(() {}); // Actualizar la vista
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
