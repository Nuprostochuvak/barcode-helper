import 'package:json_annotation/json_annotation.dart';

part 'barcode.g.dart';

//flutter pub run build_runner build (build - один раз, watch -  ждет измеений в концоли)

@JsonSerializable()
class Barcode {
  //final String id;
  final String name;
  final String codeOfBarcode;
  final String description;

/*class Barcode {
  final String? id;
  final String name;
  final String codeOfBarcode;
  final String description;
 */

  Barcode(
    this.name,
    this.codeOfBarcode,
    this.description,
  );

  factory Barcode.fromJson(Map<String, dynamic> json) =>
      _$BarcodeFromJson(json);
  Map<String, dynamic> toJson() => _$BarcodeToJson(this);
}
