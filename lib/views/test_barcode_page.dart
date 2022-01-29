import 'package:flutter/material.dart';

import 'package:google_sheet_db/models/barcode_list_model.dart';

class TestBarcodePage extends StatefulWidget {
  TestBarcodePage({Key? key}) : super(key: key);

  @override
  _TestBarcodePageState createState() => _TestBarcodePageState();
}

class _TestBarcodePageState extends State<TestBarcodePage> {
  final model = BarcodesListModel();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Функция еще в разработке'));
  }
}
