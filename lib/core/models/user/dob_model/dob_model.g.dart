// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dob_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DobModelAdapter extends TypeAdapter<DobModel> {
  @override
  final int typeId = 2;

  @override
  DobModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DobModel(
      date: fields[0] as String,
      age: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DobModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DobModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DobModel _$DobModelFromJson(Map<String, dynamic> json) => DobModel(
      date: json['date'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$DobModelToJson(DobModel instance) => <String, dynamic>{
      'date': instance.date,
      'age': instance.age,
    };
