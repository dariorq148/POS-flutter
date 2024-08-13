import 'package:flutter/material.dart';
import 'package:practica2/selectiondisplay.dart';
import 'clase__pizza.dart';
import 'clase__producto.dart';
import 'clase__vinos.dart';
import 'grid.dart';
import 'tabs.dart';
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

  void _updateSelectedPizzaIndices(List<int> newSelection) {
    setState(() {
      selectedPizzaIndices = newSelection;
    });
  }

  void _updateSelectedVinoIndices(List<int> newSelection) {
    setState(() {
      selectedVinoIndices = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side: ProductTab
          Container(
            width: MediaQuery.of(context).size.width * 0.7,  child: ProductTab(
              onVinosSelectionChanged: _updateSelectedVinoIndices,
              onPizzasSelectionChanged: _updateSelectedPizzaIndices,
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width * 0.3,    color: Colors.orange,
            child: SelectionDisplay<Productos>(
              selectedIndices: [
                ...selectedPizzaIndices,
                ...selectedVinoIndices.map((index) => index + widget.pizzas.length), // Ajusta los índices para vinos
              ],
              productos: [
                ...widget.pizzas,
                ...widget.vinos
              ],
            ),
          ),
        ],
      ),
    );
  }
}
