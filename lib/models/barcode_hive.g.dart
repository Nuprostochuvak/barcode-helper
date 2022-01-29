// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarcodeHiveAdapter extends TypeAdapter<BarcodeHive> {
  @override
  final int typeId = 0;

  @override
  BarcodeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BarcodeHive(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BarcodeHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.codeOfBarcode)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarcodeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
