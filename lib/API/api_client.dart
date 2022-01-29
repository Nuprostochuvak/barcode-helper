import 'dart:convert';
import 'dart:io'; // не работает в браузере

import 'package:google_sheet_db/models/barcode.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Barcode>> getBarcodes() async {
    final json = await getJson(
            'https://script.google.com/macros/s/AKfycbz-q2H6fNZomAEy7vbuvfstvAqNCJFmsDHRd1QaTxJWVHaufeTd/exec')
        as List<dynamic>;

    final barcods = json
        .map((dynamic e) => Barcode.fromJson((e as Map<String, dynamic>)))
        .toList();
    return barcods;
  }

  Future<dynamic> getJson(String ulr) async {
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString) as List<dynamic>;
    return json;
  }
}

 // final url = Uri.parse(
    //     'https://script.google.com/macros/s/AKfycbz-q2H6fNZomAEy7vbuvfstvAqNCJFmsDHRd1QaTxJWVHaufeTd/exec');
    // final request = await client.getUrl(url);
    //  final response = await request.close();
    //response.transform(utf8.decoder).listen((event) {
    //  print(event);
    //  print(1);
    // });
    //final jsonStrings = await response.transform(utf8.decoder).toList();
    //final jsonString = jsonStrings.join();
    // print(jsonString);

    // final json = jsonDecode(jsonString) as List<dynamic>;