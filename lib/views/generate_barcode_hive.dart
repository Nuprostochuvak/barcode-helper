import 'package:flutter/material.dart';
import 'package:google_sheet_db/models/barcode.dart';
import 'package:google_sheet_db/models/barcode_hive.dart';
import 'package:google_sheet_db/resources/resources.dart';

import 'package:syncfusion_flutter_barcodes/barcodes.dart';

// ignore: non_constant_identifier_names
Widget GenerateBarcodeHiveWidget(BuildContext context, BarcodeHive barcode) {
  return Row(
    children: [
      IconButton(
        tooltip: 'Показать штрихкод',
        icon: Icon(Icons.qr_code_2),
        splashColor: Colors.grey,
        padding: EdgeInsets.all(0),
        iconSize: 40,
        onPressed: () => showDialog<String>(
            context: context,
            builder: (context) => BarcodeDialog(
                  barcode: barcode,
                )),
      ),
      IconButton(
        tooltip: 'Информация о штрихкоде',
        icon: Icon(Icons.info),
        color: Colors.grey,
        splashColor: Colors.grey,
        padding: EdgeInsets.all(0),
        iconSize: 40,
        onPressed: () => showDialog<String>(
            context: context,
            builder: (context) => BarcodeDialog(
                  barcode: barcode,
                )),
      )
    ],
  );
}

class BarcodeDialog extends StatelessWidget {
  final BarcodeHive barcode;

  const BarcodeDialog({Key? key, required this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stringImage = barcode.codeOfBarcode;
    String name = (barcode.name == '') ? 'Имя еще не задано' : barcode.name;

    //BarcodeImages barcodeImages = BarcodeImages(a: '');

    return AlertDialog(
      title: Center(child: Text(name)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //height: 150,
            //width: 300,
            child: Image(
              image: AssetImage('images/barcode_images/$stringImage.png'),
            ),
          )
        ],
      ),
    );
  }
}



//SfBarcodeGenerator(
//              value: barcode.codeOfBarcode,
//              symbology: Code128(),
//              showValue: true,
 //           ),
//          ),