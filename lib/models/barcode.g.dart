// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barcode _$BarcodeFromJson(Map<String, dynamic> json) {
  return Barcode(
    json['name'] as String,
    json['codeOfBarcode'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$BarcodeToJson(Barcode instance) => <String, dynamic>{
      'name': instance.name,
      'codeOfBarcode': instance.codeOfBarcode,
      'description': instance.description,
    };
