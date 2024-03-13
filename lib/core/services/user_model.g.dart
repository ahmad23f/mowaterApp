// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      username: fields[0] as String?,
      userType: fields[15] as String,
      whatsState: fields[12] as int?,
      emailVerificationCode: fields[14] as String?,
      emailState: fields[13] as int?,
      email: fields[6] as String?,
      lastUpdatePhoneNumber: fields[8] as DateTime?,
      lastUpdateWhatsAppNumber: fields[10] as DateTime?,
      password: fields[7] as String?,
      nickName: fields[5] as String?,
      phoneNumber: fields[1] as String?,
      token: fields[2] as String?,
      whatsappNumber: fields[9] as String?,
      image: fields[4] as String?,
      verify: fields[11] as int?,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.verify)
      ..writeByte(5)
      ..write(obj.nickName)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.lastUpdatePhoneNumber)
      ..writeByte(9)
      ..write(obj.whatsappNumber)
      ..writeByte(10)
      ..write(obj.lastUpdateWhatsAppNumber)
      ..writeByte(12)
      ..write(obj.whatsState)
      ..writeByte(13)
      ..write(obj.emailState)
      ..writeByte(14)
      ..write(obj.emailVerificationCode)
      ..writeByte(15)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
