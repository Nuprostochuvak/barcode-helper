import 'package:hive/hive.dart';

part 'barcode_hive.g.dart';

//flutter packages pub run build_runner build (build - один раз, watch -  ждет измеений в концоли)

@HiveType(typeId: 0)
class BarcodeHive extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String codeOfBarcode;
  @HiveField(3)
  final String description;

  BarcodeHive(
    this.id,
    this.name,
    this.codeOfBarcode,
    this.description,
  );
}
