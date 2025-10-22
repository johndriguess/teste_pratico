// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredModel _$RegisteredModelFromJson(Map<String, dynamic> json) =>
    RegisteredModel(
      date: json['date'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$RegisteredModelToJson(RegisteredModel instance) =>
    <String, dynamic>{'date': instance.date, 'age': instance.age};
