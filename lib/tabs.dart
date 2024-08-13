import 'package:flutter/material.dart';
import 'clase__pizza.dart';
import 'clase__vinos.dart';
import 'grid.dart';

class ProductTab extends StatefulWidget {
  final void Function(List<int>) onVinosSelectionChanged;
  final void Function(List<int>) onPizzasSelectionChanged;

  const ProductTab({
    super.key,
    required this.onVinosSelectionChanged,
    required this.onPizzasSelectionChanged,
  });

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Vinos> vinoslista = [];
  List<Pizza> listapizza = [];
  List<int> selectedVinosIndices = [];
  List<int> selectedPizzasIndices = [];

  @override
  void initState() {
    super.initState();
    vinoslista = Vinos.listavinos;
    listapizza = Pizza.listapizzas;
    _tabController = TabController(length: 2, vsync: this);
  }

  void onVinosSelectionChanged(List<int> indices) {
    setState(() {
      selectedVinosIndices = indices;
    });
    widget.onVinosSelectionChanged(indices);
  }

  void onPizzasSelectionChanged(List<int> indices) {
    setState(() {
      selectedPizzasIndices = indices;
    });
    widget.onPizzasSelectionChanged(indices);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Vinos'),
            Tab(text: 'Pizzas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductGrid<Vinos>(
            productos: vinoslista,
            selectedIndices: selectedVinosIndices,
            onSelectionChanged: onVinosSelectionChanged,
          ),
          ProductGrid<Pizza>(
            productos: listapizza,
            selectedIndices: selectedPizzasIndices,
            onSelectionChanged: onPizzasSelectionChanged,
          ),
        ],
      ),
    );
  }
}
