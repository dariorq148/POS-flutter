/*
import 'package:flutter/material.dart';
import 'package:practica2/selectiondisplay.dart';
import 'clase__pizza.dart';
import 'clase__producto.dart';
import 'clase__vinos.dart';
import 'grid.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ProductGrid<Pizza>(
                      productos: widget.pizzas,
                      selectedIndices: selectedPizzaIndices,
                      onSelectionChanged: _updateSelectedPizzaIndices,
                    ),
                  ),
                  Expanded(
                    child: ProductGrid<Vinos>(
                      productos: widget.vinos,
                      selectedIndices: selectedVinoIndices,
                      onSelectionChanged: _updateSelectedVinoIndices,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 400,
              color: Colors.orange,
              child: SelectionDisplay<Productos>(
                selectedIndices: [
                  ...selectedPizzaIndices,
                  ...selectedVinoIndices
                ],
                productos: [
                  ...widget.pizzas,
                  ...widget.vinos
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
