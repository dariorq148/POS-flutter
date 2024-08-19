import 'package:blue_thermal_printer/blue_thermal_printer.dart';

BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

Future<void> printReceiptBluetooth() async {
  // Conectar a la impresora Bluetooth
  final isConnected = await bluetooth.isConnected;
  if (isConnected!) {
    bluetooth.printNewLine();
    bluetooth.printCustom("Boleta de Compra", 2, 1);
    bluetooth.printNewLine();
    bluetooth.printCustom("Producto       Precio", 1, 0);
    bluetooth.printNewLine();
    bluetooth.printCustom("Pizza       \$10.00", 1, 0);
    bluetooth.printCustom("Vino        \$15.00", 1, 0);
    bluetooth.printNewLine();
    bluetooth.printCustom("Total: \$25.00", 2, 1);
    bluetooth.printNewLine();
    bluetooth.printNewLine();
    bluetooth.paperCut();
  } else {
    print('Error: No conectado a la impresora Bluetooth');
  }
}
