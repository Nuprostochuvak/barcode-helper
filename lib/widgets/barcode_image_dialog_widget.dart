import 'package:flutter/material.dart';
import 'package:google_sheet_db/models/barcode.dart';

class BarcodeImageDialog extends StatelessWidget {
  final Barcode barcode;

  const BarcodeImageDialog({Key? key, required this.barcode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stringImage = barcode.codeOfBarcode;
    String name = (barcode.name == '') ? 'Имя еще не задано' : barcode.name;

    AssetImage barcodeImage =
        (AssetImage('images/barcode_images/$stringImage.png') == null)
            ? AssetImage('images/errore_image.png')
            : AssetImage('images/barcode_images/$stringImage.png');

    return AlertDialog(
      title: Center(child: Text(name)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //height: 150,
            //width: 300,
            child: Image(
              image: barcodeImage,
            ),
          )
        ],
      ),
    );
  }
}
