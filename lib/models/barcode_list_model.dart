import 'package:flutter/material.dart';
import 'package:google_sheet_db/API/api_client.dart';
import 'package:google_sheet_db/API/local_api_client.dart';
import 'package:google_sheet_db/models/barcode.dart';

class BarcodesListModel extends ChangeNotifier {
  final apiClient = ApiClient();

  final localApiClient = LocalApiClient();

  var _barcodes = <Barcode>[];

  List<Barcode> get barcodes => _barcodes;

  Future<void> loadWebBarcodes() async {
    final barcodes = await apiClient.getBarcodes();
    _barcodes = barcodes; // загрузить штрихкоды
    notifyListeners();
  }

  Future<void> loadLocalBarcodes() async {
    final barcodes = await localApiClient.getBarcodes();
    _barcodes = barcodes; // загрузить штрихкоды
    notifyListeners();
  }

  Future<List<Barcode>> getLocalBarcodes() async {
    loadLocalBarcodes();
    return barcodes;
  }
}

class BarcodesListModelProvider extends InheritedNotifier {
  final BarcodesListModel model;

  const BarcodesListModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static BarcodesListModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BarcodesListModelProvider>();
  }

  static BarcodesListModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BarcodesListModelProvider>()
        ?.widget;
    return widget is BarcodesListModelProvider ? widget : null;
  }
}
