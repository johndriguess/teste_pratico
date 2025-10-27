// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdModelAdapter extends TypeAdapter<IdModel> {
  @override
  final int typeId = 3;

  @override
  IdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IdModel(
      name: fields[0] as String,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IdModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdModel _$IdModelFromJson(Map<String, dynamic> json) => IdModel(
      name: json['name'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$IdModelToJson(IdModel instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
