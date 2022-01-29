import 'package:flutter/material.dart';

import 'package:google_sheet_db/models/barcode_list_model.dart';

class TestBarcodePageWidget extends StatefulWidget {
  TestBarcodePageWidget({Key? key}) : super(key: key);

  @override
  _TestBarcodePageWidgetState createState() => _TestBarcodePageWidgetState();
}

class _TestBarcodePageWidgetState extends State<TestBarcodePageWidget> {
  final model = BarcodesListModel();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Функция еще в разработке'));
  }
}
