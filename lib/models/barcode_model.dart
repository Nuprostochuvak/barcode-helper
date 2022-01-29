import 'package:flutter/material.dart';
import 'package:google_sheet_db/API/api_client.dart';
import 'package:google_sheet_db/models/barcode.dart';

class BarcodesWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();

  var _barcodes = <Barcode>[];
  List<Barcode> get barcodes => _barcodes;

  Future<void> loadBarcodes() async {
    final barcodes = await apiClient.getBarcodes();
    _barcodes = barcodes; // загрузить штрихкоды
    notifyListeners();
  }

  Future<void> saveBarcodes() async {
    print("WALLPAPER ADICIONADO NO HIVE!");
  }

  void createBarcodes() {}
}

class ExampleModelProvider extends InheritedNotifier {
  final BarcodesWidgetModel model;

  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
}
