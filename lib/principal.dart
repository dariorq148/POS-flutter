import 'package:flutter/material.dart';
import 'blue.dart';
import 'clase__pizza.dart';
import 'clase__producto.dart';
import 'clase__vinos.dart';
import 'selectiondisplay.dart';// Asegúrate de importar tu ProductTab o el widget correspondiente
import 'metodos.dart';
import 'tabs.dart'; // Importa los métodos desde el nuevo archivo

class HomePage1 extends StatefulWidget {
  final List<Pizza> pizzas;
  final List<Vinos> vinos;

  const HomePage1({
    super.key,
    required this.pizzas,
    required this.vinos,
  });

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  List<int> selectedPizzaIndices = [];
  List<int> selectedVinoIndices = [];

  double getTotal() {
    return calcularTotal(selectedPizzaIndices, widget.pizzas, selectedVinoIndices, widget.vinos);
  }

  void _handlePizzaSizeChange(Pizza pizza, String newSize) {
    setState(() {
      pizza.tamanio = newSize; // Actualizar el tamaño de la pizza
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = getTotal(); // Obtener el total actualizado

    return Scaffold(
      appBar: AppBar(
        title: Text("Total: \$${total.toStringAsFixed(2)}"),
      ),
      body: Row(
        children: [
          // Left side: ProductTab
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ProductTab(
              onVinosSelectionChanged: (newSelection) {
                setState(() {
                  updateSelectedVinoIndices(selectedVinoIndices, newSelection);
                });
              },
              onPizzasSelectionChanged: (newSelection) {
                setState(() {
                  updateSelectedPizzaIndices(selectedPizzaIndices, newSelection);
                });
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.orange,
            child: Stack(
              children: [
                SelectionDisplay<Productos>(
                  selectedIndices: [
                    ...selectedPizzaIndices,
                    ...selectedVinoIndices.map((index) => index + widget.pizzas.length),
                  ],
                  productos: [
                    ...widget.pizzas,
                    ...widget.vinos,
                  ],
                  onIncrement: (producto) {
                    setState(() {
                      producto.cantidad++;
                    });
                  },
                  onDecrement: (producto) {
                    setState(() {
                      if (producto.cantidad > 1) {
                        producto.cantidad--;
                      }
                    });
                  },
                  onPizzaSizeChange: _handlePizzaSizeChange, // Manejar el cambio de tamaño
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      printReceiptBluetooth(); // Método para imprimir con Bluetooth
                      imprimirBoleta(
                        selectedPizzaIndices.map((index) => widget.pizzas[index]).toList(),
                        selectedVinoIndices.map((index) => widget.vinos[index]).toList(),
                        total,
                      );
                    },
                    child: Text("Imprimir Boleta (\$${total.toStringAsFixed(2)})"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
