import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_sheet_db/models/barcode_model.dart';

class BarcodePageWidget extends StatefulWidget {
  BarcodePageWidget({Key? key}) : super(key: key);

  @override
  _BarcodePageWidgetState createState() => _BarcodePageWidgetState();
}

class _BarcodePageWidgetState extends State<BarcodePageWidget> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  final model = BarcodesWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Функция еще в разработке'));
    //Column(
    // children: [
    //Expanded(
    //  child: ValueListenableBuilder<Box<BarcodeHive>>(
    //    valueListenable: Boxes.getBarcodes().listenable(),
    //    builder: (context, box, _) {
    //      final barcodes = box.values.toList().cast<BarcodeHive>();
    //      return buildContent(barcodes);
    //    },
    //  ),
    // ),
    //  Row(
    //    children: [
    //      Expanded(
    //          child: ElevatedButton(
    //        child: const Text('Сохранить в БД'),
    //        onPressed: () {},
    //      )),
    //      Expanded(
    //          child: ElevatedButton(
    //        child: const Text('Удалить БД'),
    //        onPressed: () {},
    //     )),
    //    ],
    //   ),
    //  ],
    //);
    //}
  }
}
