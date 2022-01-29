import 'package:hive/hive.dart';

import 'models/barcode_hive.dart';

class Boxes {
  static Box<BarcodeHive> getBarcodes() =>
      Hive.box<BarcodeHive>('barcodes_box');
}
