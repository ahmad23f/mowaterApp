import 'package:hive/hive.dart';

enum UsersType {
  user,
  ghost,
  maintenance,
  showRooms,
  insurance,
  carRental,
  warranty,
  spareParts,
  inspection,
  carCare,
  mobileService,
  evaluation,
  service24
}

class UsersTypeAdapter extends TypeAdapter<UsersType> {
  @override
  final int typeId = 2; // Unique identifier for this adapter

  @override
  UsersType read(BinaryReader reader) {
    return UsersType.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, UsersType obj) {
    writer.writeInt(obj.index);
  }
}
