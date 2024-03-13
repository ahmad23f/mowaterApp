// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NormalCompanyModelHiveAdapter
    extends TypeAdapter<NormalCompanyModelHive> {
  @override
  final int typeId = 3;

  @override
  NormalCompanyModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NormalCompanyModelHive(
      companyToken: fields[19] as String?,
      companyImage: fields[20] as String?,
      companyType: fields[18] as String?,
      id: fields[0] as String?,
      name: fields[1] as String?,
      weekdayWork: fields[2] as String?,
      startTime: fields[3] as String?,
      endTime: fields[4] as String?,
      specialty: fields[5] as String?,
      description: fields[6] as String?,
      location: fields[7] as String?,
      phoneNumber: fields[8] as String?,
      whatsappNumber: fields[9] as String?,
      image: fields[10] as String?,
      categoryName: fields[11] as String?,
      carBrands: (fields[12] as List?)?.cast<String>(),
      approval: fields[13] as int?,
      mowaterDiscount: fields[14] as int?,
      carMakes: fields[15] as String?,
      latitude: fields[16] as String?,
      longitude: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NormalCompanyModelHive obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.weekdayWork)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.specialty)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.phoneNumber)
      ..writeByte(9)
      ..write(obj.whatsappNumber)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.categoryName)
      ..writeByte(12)
      ..write(obj.carBrands)
      ..writeByte(13)
      ..write(obj.approval)
      ..writeByte(14)
      ..write(obj.mowaterDiscount)
      ..writeByte(15)
      ..write(obj.carMakes)
      ..writeByte(16)
      ..write(obj.latitude)
      ..writeByte(17)
      ..write(obj.longitude)
      ..writeByte(18)
      ..write(obj.companyType)
      ..writeByte(19)
      ..write(obj.companyToken)
      ..writeByte(20)
      ..write(obj.companyImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NormalCompanyModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
