import 'package:flutter/material.dart';
import 'package:google_sheet_db/views/config_barcode_page.dart';

class WiredConfigPage extends StatelessWidget {
  WiredConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: ConfigBarcodesPage(),
    );
  }
}
