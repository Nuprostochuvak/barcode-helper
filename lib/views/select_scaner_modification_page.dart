import 'package:flutter/material.dart';
import 'package:google_sheet_db/views/wired_congig_page.dart';
import 'package:google_sheet_db/views/wireless_config_page.dart';

class SelectScanerModification extends StatefulWidget {
  const SelectScanerModification({Key? key}) : super(key: key);

  @override
  State<SelectScanerModification> createState() =>
      _SelectScanerModificationState();
}

class _SelectScanerModificationState extends State<SelectScanerModification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Выберите модификацию сканера'),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => WiredConfigPage()));
              },
              child: Text("Проводной"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => WirelessConfigPage()));
              },
              child: Text("Беспроводной"),
            )
          ],
        ),
      ),
    );
  }
}
