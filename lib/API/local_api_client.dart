import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_sheet_db/models/barcode.dart';

class LocalApiClient {
  Future<List<Barcode>> getBarcodes() async {
    final String response = await rootBundle.loadString('assets/json.json');
    final json = await jsonDecode(response) as List<dynamic>;

    final barcods = json
        .map((dynamic e) => Barcode.fromJson((e as Map<String, dynamic>)))
        .toList();
    return barcods;
  }
}
