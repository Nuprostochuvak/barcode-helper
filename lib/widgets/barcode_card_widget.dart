import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sheet_db/models/barcode.dart';
import 'package:google_sheet_db/widgets/barcode_image_dialog_widget.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';

Widget BarcodeCardWidget(BuildContext context, Barcode barcode) {
  String stringImage = barcode.codeOfBarcode;
  String path = 'images/barcode_images/$stringImage.png';

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
            builder: (context) => BarcodeImageDialog(
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
            builder: (context) => BarcodeImageDialog(
                  barcode: barcode,
                )),
      ),
      IconButton(
        tooltip: 'Информация о штрихкоде',
        icon: Icon(Icons.share),
        color: Colors.grey,
        splashColor: Colors.grey,
        padding: EdgeInsets.all(0),
        iconSize: 40,
        onPressed: () => _getImage(path),
      )
    ],
  );
}

_getImage(path) async {
  final ByteData bytes = await rootBundle.load(path);
  final Uint8List list = bytes.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final file = await new File('${tempDir.path}/image.jpg').create();
  file.writeAsBytesSync(list);
  Share.shareFiles(['${file.path}']);
}
