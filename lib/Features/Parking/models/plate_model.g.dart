// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlateModelAdapter extends TypeAdapter<PlateModel> {
  @override
  final int typeId = 1;

  @override
  PlateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlateModel(
      lastUse: fields[4] as DateTime,
      nickName: fields[0] as String,
      plateNumber: fields[1] as String,
      plateSource: fields[2] as String,
      plateCode: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlateModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nickName)
      ..writeByte(1)
      ..write(obj.plateNumber)
      ..writeByte(2)
      ..write(obj.plateSource)
      ..writeByte(3)
      ..write(obj.plateCode)
      ..writeByte(4)
      ..write(obj.lastUse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
