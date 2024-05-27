// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class contactModelAdapter extends TypeAdapter<contactModel> {
  @override
  final int typeId = 1;

  @override
  contactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return contactModel(
      name: fields[1] as String,
      age: fields[2] as String,
      date: fields[3] as DateTime?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, contactModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is contactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
