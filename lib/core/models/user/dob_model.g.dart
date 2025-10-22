// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dob_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DobModel _$DobModelFromJson(Map<String, dynamic> json) =>
    DobModel(date: json['date'] as String, age: (json['age'] as num).toInt());

Map<String, dynamic> _$DobModelToJson(DobModel instance) => <String, dynamic>{
  'date': instance.date,
  'age': instance.age,
};
