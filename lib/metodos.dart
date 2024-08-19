import 'clase__pizza.dart';
import 'clase__vinos.dart';

double calcularTotal(List<int> selectedPizzaIndices, List<Pizza> pizzas, List<int> selectedVinoIndices, List<Vinos> vinos) {
  double total = 0.0;

  // Sumar precios de las pizzas seleccionadas
  for (int index in selectedPizzaIndices) {
    total += pizzas[index].preciocalculado * pizzas[index].cantidad;
  }

  // Sumar precios de los vinos seleccionados
  for (int index in selectedVinoIndices) {
    total += vinos[index].precio * vinos[index].cantidad;
  }

  return total;
}

void updateSelectedPizzaIndices(List<int> selectedPizzaIndices, List<int> newSelection) {
  selectedPizzaIndices.clear();
  selectedPizzaIndices.addAll(newSelection);
}

void updateSelectedVinoIndices(List<int> selectedVinoIndices, List<int> newSelection) {
  selectedVinoIndices.clear();
  selectedVinoIndices.addAll(newSelection);
}

void imprimirBoleta(List<Pizza> pizzasSeleccionadas, List<Vinos> vinosSeleccionados, double total) {
  const int anchoBoleta = 14;

  print("Boleta:");
  print("-" * anchoBoleta);

  for (Pizza pizza in pizzasSeleccionadas) {
    String nombreP = pizza.nombre_p.length > 5 ? pizza.nombre_p.substring(0, 5) : pizza.nombre_p.padRight(5);
    String precioP = (pizza.preciocalculado * pizza.cantidad).toStringAsFixed(2).padLeft(5);
    String linea = "$nombreP x${pizza.cantidad} $precioP".padRight(anchoBoleta);
    print(linea);
  }

  for (Vinos vino in vinosSeleccionados) {
    String nombreV = vino.nombre_p.length > 5 ? vino.nombre_p.substring(0, 5) : vino.nombre_p.padRight(5);
    String precioV = (vino.precio * vino.cantidad).toStringAsFixed(2).padLeft(5);
    String linea = "$nombreV x${vino.cantidad} $precioV".padRight(anchoBoleta);
    print(linea);
  }

  print("-" * anchoBoleta);
  print("Total: \$${total.toStringAsFixed(2)}".padLeft(anchoBoleta));
  print("-" * anchoBoleta);
}
