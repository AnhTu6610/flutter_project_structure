// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mess_hive_field.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessHiveFieldAdapter extends TypeAdapter<MessHiveField> {
  @override
  final int typeId = 1;

  @override
  MessHiveField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessHiveField(
      peerId: fields[0] as String,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MessHiveField obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.peerId)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessHiveFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MessPublicHiveFieldAdapter extends TypeAdapter<MessPublicHiveField> {
  @override
  final int typeId = 2;

  @override
  MessPublicHiveField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessPublicHiveField(
      peerId: fields[0] as String,
      name: fields[1] as String?,
      listMess: (fields[2] as List?)?.cast<MessHiveField>(),
      dateTime: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MessPublicHiveField obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.peerId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.listMess)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessPublicHiveFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
