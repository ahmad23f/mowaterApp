// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveModelAdapter extends TypeAdapter<UserHiveModel> {
  @override
  final int typeId = 0;

  @override
  UserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveModel(
      id: fields[0] as int?,
      type: fields[1] as String?,
      name: fields[2] as String?,
      password: fields[3] as String?,
      joinedFrom: fields[4] as DateTime?,
      nickName: fields[5] as String?,
      email: fields[6] as String?,
      phoneNumber: fields[7] as String?,
      whatsAppNumber: fields[8] as String?,
      token: fields[9] as String?,
      image: fields[10] as String?,
      commercialLicenesNumber: fields[11] as String?,
      description: fields[12] as String?,
      mowaterDiscount: fields[13] as int?,
      specialtyCategorys: fields[14] as String?,
      workDays: fields[15] as String?,
      startTime: fields[16] as String?,
      endTime: fields[17] as String?,
      location: fields[18] as String?,
      latitude: fields[19] as String?,
      longitude: fields[20] as String?,
      attachment: fields[21] as String?,
      availableProducts: fields[22] as int?,
      subscriptionState: fields[23] as String?,
      carMakes: fields[24] as String?,
      whatsAppVerificationCode: fields[25] as String?,
      phoneNumberVerificationCode: fields[26] as String?,
      emailVerificationCode: fields[27] as String?,
      lastUpdatePhone: fields[28] as DateTime?,
      lastUpdateWhatsAppNumber: fields[29] as DateTime?,
      emailState: fields[30] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveModel obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.joinedFrom)
      ..writeByte(5)
      ..write(obj.nickName)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.whatsAppNumber)
      ..writeByte(9)
      ..write(obj.token)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.commercialLicenesNumber)
      ..writeByte(12)
      ..write(obj.description)
      ..writeByte(13)
      ..write(obj.mowaterDiscount)
      ..writeByte(14)
      ..write(obj.specialtyCategorys)
      ..writeByte(15)
      ..write(obj.workDays)
      ..writeByte(16)
      ..write(obj.startTime)
      ..writeByte(17)
      ..write(obj.endTime)
      ..writeByte(18)
      ..write(obj.location)
      ..writeByte(19)
      ..write(obj.latitude)
      ..writeByte(20)
      ..write(obj.longitude)
      ..writeByte(21)
      ..write(obj.attachment)
      ..writeByte(22)
      ..write(obj.availableProducts)
      ..writeByte(23)
      ..write(obj.subscriptionState)
      ..writeByte(24)
      ..write(obj.carMakes)
      ..writeByte(25)
      ..write(obj.whatsAppVerificationCode)
      ..writeByte(26)
      ..write(obj.phoneNumberVerificationCode)
      ..writeByte(27)
      ..write(obj.emailVerificationCode)
      ..writeByte(28)
      ..write(obj.lastUpdatePhone)
      ..writeByte(29)
      ..write(obj.lastUpdateWhatsAppNumber)
      ..writeByte(30)
      ..write(obj.emailState);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
