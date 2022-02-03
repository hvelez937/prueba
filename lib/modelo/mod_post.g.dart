// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 1;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      name: fields[1] as String,
      email: fields[2] as String,
      picture: fields[3] as String,
      isActive: fields[4] as bool?,
      balance: fields[5] as String?,
      age: fields[6] as int?,
      eyeColor: fields[7] as String?,
      gender: fields[8] as String?,
      company: fields[9] as String?,
      phone: fields[10] as String?,
      address: fields[11] as String?,
      about: fields[12] as String?,
    )..userId = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.picture)
      ..writeByte(4)
      ..write(obj.isActive)
      ..writeByte(5)
      ..write(obj.balance)
      ..writeByte(6)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.eyeColor)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.company)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.address)
      ..writeByte(12)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
